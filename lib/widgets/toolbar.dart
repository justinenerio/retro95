import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';
import 'package:intl/intl.dart';
import 'package:retro95/models/application.dart';
import 'package:retro95/widgets/toolbar_item.dart';

class ToolBar extends StatelessWidget {
  final List<Application> activeApps;

  const ToolBar({Key key, this.activeApps}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Elevation95(
      child: Container(
        padding: EdgeInsets.all(4.0),
        color: Flutter95.background,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Button95(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/images/windows.png'),
                  const SizedBox(width: 4.0),
                  Text(
                    'Start',
                    style: Flutter95.textStyle
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Row(
                children: [
                  for (final app in activeApps)
                    ToolBarItem(
                      app: app,
                      // onTapItem: notifier.minimize,
                    )
                ],
              ),
            ),
            const SizedBox(width: 10),
            Elevation95(
              type: Elevation95Type.down,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
                child: TimeWidget(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ToolBarItem extends StatefulWidget {
  final Application app;
  final Function onTapItem;
  final EdgeInsetsGeometry padding;

  const ToolBarItem({
    Key key,
    this.app,
    this.padding = const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
    this.onTapItem,
  }) : super(key: key);

  @override
  _ToolBarItemState createState() => _ToolBarItemState();
}

class _ToolBarItemState extends State<ToolBarItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 4.0),
      child: ToolbarItem95(
        isSelected: true,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (widget.app.image != null) Image.asset(widget.app.image),
            const SizedBox(width: 8.0),
            Text(
              widget.app.label,
              style: Flutter95.textStyle,
            ),
          ],
        ),
        onTap: () {
          // widget.onTapItem(widget.app.id);
        },
      ),
    );
  }
}

class TimeWidget extends StatefulWidget {
  @override
  _TimeWidgetState createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  String _timeString = '';

  @override
  void initState() {
    _timeString = getTime();
    Timer.periodic(Duration(minutes: 1), (Timer t) => _getCurrentTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _timeString,
      style: Flutter95.textStyle,
    );
  }

  void _getCurrentTime() {
    if (mounted)
      setState(() {
        _timeString = getTime();
      });
  }

  String getTime() {
    final now = DateTime.now();

    return DateFormat('h:mm a').format(now);
  }
}
