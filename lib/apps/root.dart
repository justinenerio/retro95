import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter95/flutter95.dart';
import 'package:reorderables/reorderables.dart';
import 'package:retro95/constants/constants.dart';
import 'package:retro95/models/application.dart';
import 'package:retro95/widgets/window.dart';
import 'package:retro95/widgets/toolbar.dart';

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  List<Application> _activeApps = [];

  int applicationId = 0;

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Constants.backgroundColor),
    );
  }

  void onOpenApp(Application app) {
    setState(() {
      _activeApps.add(app.copyWith(
        processId: applicationId,
        minimized: false,
      ));
      applicationId++;
    });
  }

  void onCloseApp(int processId) {
    final list =
        _activeApps.where((val) => val.processId != processId).toList();
    setState(() {
      _activeApps = list;
    });
  }

  void onMinimize() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: [
                      Desktop(
                        constraints: constraints,
                        onOpenApp: onOpenApp,
                      ),
                      for (final app in _activeApps)
                        Window(
                          app: app,
                          onCloseApp: onCloseApp,
                          onMinizeApp: onMinimize,
                          constraints: constraints,
                        )
                    ],
                  );
                },
              ),
            ),
            Container(
              child: ToolBar(
                activeApps: _activeApps,
                onOpenApp: onOpenApp,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Desktop extends StatefulWidget {
  final BoxConstraints constraints;
  final Function onOpenApp;

  const Desktop({
    Key key,
    this.constraints,
    this.onOpenApp,
  }) : super(key: key);

  @override
  _DesktopState createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  List<Application> defaultApps = Constants.defaultApps;
  Application _selected;

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      Application row = defaultApps.removeAt(oldIndex);
      defaultApps.insert(newIndex, row);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = null;
        });
      },
      child: Container(
        width: widget.constraints.maxWidth,
        height: widget.constraints.maxHeight,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        color: Color(0xFF008080),
        child: ReorderableWrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.start,
          alignment: WrapAlignment.start,
          scrollDirection: Axis.horizontal,
          spacing: 32.0,
          runSpacing: 32.0,
          padding: const EdgeInsets.all(8),
          buildDraggableFeedback: (context, constraints, child) {
            return Transform(
              transform: new Matrix4.rotationZ(0),
              alignment: FractionalOffset.topLeft,
              child: Material(
                child: Container(
                  color: Constants.backgroundColor,
                  child: ConstrainedBox(constraints: constraints, child: child),
                ),
                color: Constants.backgroundColor,
                borderRadius: BorderRadius.zero,
              ),
            );
          },
          children: defaultApps.map((app) {
            final bool _isSelected = _selected != null
                ? (app.processName == _selected.processName) ? true : false
                : false;

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selected = app;
                });
              },
              onDoubleTap: () {
                widget.onOpenApp(app);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    color: _isSelected
                        ? Constants.iconSelectedColor
                        : Colors.transparent,
                    child: FittedBox(
                      child: Image.asset(app.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: 65,
                    child: Center(
                      child: Container(
                        color: _isSelected
                            ? Constants.iconSelectedColor
                            : Colors.transparent,
                        child: Text(
                          app.label,
                          style:
                              Flutter95.textStyle.copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }).toList(),
          onReorder: _onReorder,
        ),
      ),
    );
  }
}
