import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';

class CounterApp extends StatefulWidget {
  CounterApp({Key key}) : super(key: key);

  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Elevation95(
        type: Elevation95Type.down,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
                style: Flutter95.textStyle,
              ),
              const SizedBox(height: 32),
              Elevation95(
                type: Elevation95Type.down,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Button95(
                onTap: _incrementCounter,
                child: Text('Increment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
