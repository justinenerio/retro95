import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Toolbar95(actions: [
            Item95(
              label: 'Edit',
              menu: _buildMenu(),
            ),
            Item95(
              label: 'View',
              onTap: (context) {},
            ),
            Item95(
              label: 'Help',
              onTap: (context) {},
            ),
          ]),
          const SizedBox(height: 4),
          Elevation95(
            type: Elevation95Type.down,
            child: Container(height: 0.5),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: CalculatorBody(),
            ),
          ),
        ],
      ),
    );
  }

  Menu95 _buildMenu() {
    return Menu95(
      items: [
        MenuItem95(
          value: 1,
          label: 'New',
        ),
        MenuItem95(
          value: 2,
          label: 'Open',
        ),
        MenuItem95(
          value: 3,
          label: 'Exit',
        ),
      ],
      onItemSelected: (item) {},
    );
  }
}

// https://github.com/escamoteur/flutter_calculator
class CalculatorBody extends StatefulWidget {
  @override
  _CalculatorBodyState createState() => _CalculatorBodyState();
}

typedef OperatorFunc = double Function(double accu, double operand);

class _CalculatorBodyState extends State<CalculatorBody> {
  TextEditingController _controller;
  double accu = 0.0;
  double operand = 0.0;
  OperatorFunc queuedOperation;

  String resultString = "0.0";

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: resultString);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void numberPressed(int value) {
    operand = operand * 10 + value;
    setState(() {
      resultString = operand.toString();
      _controller = TextEditingController(text: resultString);
    });
  }

  void calc(OperatorFunc operation) {
    if (operation == null) {
      accu = 0.0;
    } else {
      accu = queuedOperation != null ? queuedOperation(accu, operand) : operand;
    }
    queuedOperation = operation;
    operand = 0.0;
    var result = accu.toString();
    setState(() {
      resultString = result.toString().substring(0, min(10, result.length));
      _controller = TextEditingController(text: resultString);
    });
  }

  List<Widget> buildNumberButtons(int count, int from) {
    return Iterable.generate(count, (index) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Button95(
              onTap: () => numberPressed(from + index),
              child: Center(
                child: Text(
                  "${from + index}",
                  style: Flutter95.textStyle.copyWith(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
        ),
      );
    }).toList();
  }

  Widget buildOperatorButton(String label, OperatorFunc func) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Button95(
          onTap: () => calc(func),
          child: Center(
            child: Text(
              label,
              style: Flutter95.textStyle.copyWith(
                color: Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRow(
    int numberKeyCount,
    int startNumber,
    String operationLabel,
    OperatorFunc operation,
    String operationLabel2,
    OperatorFunc operation2,
  ) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.from(
          buildNumberButtons(
            numberKeyCount,
            startNumber,
          ),
        )
          ..add(
            buildOperatorButton(operationLabel, operation),
          )
          ..add(
            buildOperatorButton(operationLabel2, operation2),
          ),
      ),
    );
  }

  Widget buildTopRow() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(4.0),
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Elevation95(
                type: Elevation95Type.down,
                child: Container(),
              ),
            ),
          ),
          buildOperatorButton('Backspace', null),
          buildOperatorButton('CE', null),
          buildOperatorButton('C', null),
        ]),
      ),
    );
  }

  Widget buildLastRow() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...buildNumberButtons(
            1,
            0,
          ),
          buildOperatorButton('+/-', null),
          buildOperatorButton('.', null),
          buildOperatorButton('+', (accu, dividor) => accu + dividor),
          buildOperatorButton('=', (accu, dividor) => accu),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          height: 50,
          child: TextField95(controller: _controller),
        ),
        const SizedBox(height: 16),
        buildTopRow(),
        buildRow(3, 7, "/", (accu, dividor) => accu / dividor, "sqrt", null),
        buildRow(3, 4, "x", (accu, dividor) => accu * dividor, "%", null),
        buildRow(3, 1, "-", (accu, dividor) => accu - dividor, "1/x", null),
        buildLastRow(),
      ],
    );
  }
}
