import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';
import 'package:reorderables/reorderables.dart';
import 'package:retro95/models/application.dart';
import 'package:retro95/widgets/resizeable_widget.dart';
import 'package:retro95/widgets/toolbar.dart';

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  List<Application> _activeApps = [];

  int applicationId = 0;

  void onOpenApp(Application app) {
    setState(() {
      _activeApps.add(app.copyWith(
        processId: applicationId,
        maximized: true,
        minimized: false,
      ));
      applicationId++;
    });
  }

  void onCloseApp(int processId) {
    print('$processId asdf');
    final list =
        _activeApps.where((val) => val.processId != processId).toList();
    setState(() {
      // _activeApps.removeWhere((val) => val.processId == processId);
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
  List<Application> defaultApps = [
    Application(
        label: 'Counter',
        image: 'assets/images/tree.png',
        processName: 'tree-app'),
    Application(
        label: 'Doom95',
        image: 'assets/images/application.png',
        processName: 'dummy-app'),
    Application(
        label: 'Flutter95',
        image: 'assets/images/windows.png',
        processName: 'flutter95-app'),
    Application(
        label: 'Internet Explorer',
        image: 'assets/images/windows.png',
        processName: 'browser-app'),
    Application(
        label: 'Notepad',
        image: 'assets/images/notepad.png',
        processName: 'notepad-app'),
  ];

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      Application row = defaultApps.removeAt(oldIndex);
      defaultApps.insert(newIndex, row);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        runSpacing: 8.0,
        padding: const EdgeInsets.all(8),
        children: defaultApps.map((app) {
          return GestureDetector(
            onDoubleTap: () {
              widget.onOpenApp(app);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: FittedBox(
                    child: Image.asset(app.image),
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  width: 50,
                  child: Center(
                    child: Text(
                      app.label,
                      style: Flutter95.textStyle.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          );
        }).toList(),
        onReorder: _onReorder,
      ),
    );
  }
}
