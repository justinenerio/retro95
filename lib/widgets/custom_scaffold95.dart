import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter95/flutter95.dart';

class CustomScaffold95 extends StatelessWidget {
  const CustomScaffold95({
    @required this.title,
    @required this.body,
    this.toolbar,
    Key key,
    this.onClose,
    this.onMinimize,
    this.onMaximize,
  }) : super(key: key);

  final String title;
  final Widget body;
  final Toolbar95 toolbar;
  final Function onClose;
  final Function onMinimize;
  final Function onMaximize;

  @override
  Widget build(BuildContext context) {
    return Elevation95(
      child: Column(
        children: <Widget>[
          WindowHeader95(
            title: title,
            onMinimize: onMaximize,
            onClose: onClose,
            onMaximize: onMaximize,
          ),
          const SizedBox(height: 4),
          if (toolbar != null) toolbar,
          if (toolbar != null) const SizedBox(height: 4),
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}

class WindowHeader95 extends StatefulWidget {
  const WindowHeader95({
    @required this.title,
    Key key,
    this.onClose,
    this.onMinimize,
    this.onMaximize,
  }) : super(key: key);

  final String title;

  final Function onClose;
  final Function onMinimize;
  final Function onMaximize;

  @override
  _WindowHeader95State createState() => _WindowHeader95State();
}

class _WindowHeader95State extends State<WindowHeader95> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Container(
          height: 33,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Flutter95.headerDark,
                Flutter95.headerLight,
              ],
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 8),
              Text(
                widget.title,
                style: Flutter95.headerTextStyle,
              ),
              Spacer(),
              HeadButton95(
                icon: Icons.minimize,
                onClick: widget.onMinimize,
              ),
              const SizedBox(width: 4),
              HeadButton95(
                icon: Icons.crop_square,
                onClick: widget.onMaximize,
              ),
              const SizedBox(width: 4),
              HeadButton95(
                icon: Icons.close,
                onClick: widget.onClose,
              ),
              const SizedBox(width: 4),
            ],
          ),
        ),
      ),
    );
  }
}

class HeadButton95 extends StatelessWidget {
  const HeadButton95({
    Key key,
    this.onClick,
    this.icon = Icons.close,
  }) : super(key: key);

  final Function onClick;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Button95(
      height: 24,
      padding: EdgeInsets.zero,
      onTap: onClick,
      child: Icon(
        icon,
        size: 20,
      ),
    );
  }
}
