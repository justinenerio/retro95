import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';

class ToolbarItem95 extends StatefulWidget {
  const ToolbarItem95({
    this.onTap,
    this.child,
    this.padding = const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
    this.height = 30,
    Key key,
    this.isSelected = false,
  }) : super(key: key);

  final Function() onTap;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double height;
  final bool isSelected;

  @override
  _ToolbarItem95State createState() => _ToolbarItem95State();
}

class _ToolbarItem95State extends State<ToolbarItem95> {
  bool _tapped = false;

  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.isSelected;

    return SizedBox(
      height: widget.height,
      child: GestureDetector(
        onTap: () {
          widget.onTap();
          isSelected = false;
        },
        onTapDown: (details) => setState(() {
          if (widget.onTap != null) {
            _tapped = true;
          }
        }),
        onTapUp: (details) => setState(() {
          _tapped = false;
        }),
        onTapCancel: () => setState(() => _tapped = false),
        child: Container(
          decoration: isSelected
              ? Flutter95.pressedDecorationOutside
              : Flutter95.elevatedDecorationOutside,
          child: Container(
            padding: widget.padding,
            decoration: _tapped
                ? Flutter95.pressedDecoration
                : Flutter95.elevatedDecoration,
            child: DefaultTextStyle(
              style: widget.onTap != null
                  ? Flutter95.textStyle
                  : Flutter95.disabledTextStyle,
              child: Padding(
                padding: _tapped
                    ? const EdgeInsets.only(top: 1.0, left: 1.0)
                    : const EdgeInsets.all(0.0),
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
