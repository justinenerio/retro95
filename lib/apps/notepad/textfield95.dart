import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';

class TextField95 extends StatefulWidget {
  // TODO: Expose more properties from TextField
  const TextField95({
    Key key,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
  }) : super(key: key);

  final TextEditingController controller;

  final TextInputType keyboardType;

  final int maxLines;

  @override
  _TextField95State createState() => _TextField95State();
}

class _TextField95State extends State<TextField95> {
  @override
  Widget build(BuildContext context) {
    return Elevation95(
      type: Elevation95Type.down,
      child: Container(
        padding: EdgeInsets.all(4.0),
        color: Flutter95.white,
        height: 32,
        child: Material(
          color: Flutter95.white,
          child: TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
            ),
            cursorColor: Flutter95.black,
            style: Flutter95.textStyle,
            keyboardType: widget.keyboardType,
            maxLines: widget.maxLines,
          ),
        ),
      ),
    );
  }
}
