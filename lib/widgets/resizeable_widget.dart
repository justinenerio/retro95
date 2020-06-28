import 'package:flutter/material.dart';
import 'package:retro95/apps/bluescreen/dummy.dart';
import 'package:retro95/apps/browser/browser.dart';
import 'package:retro95/apps/counter/counter.dart';
import 'package:retro95/apps/flutter95/flutter95.dart';
import 'package:retro95/apps/notepad/notepad.dart';
import 'package:retro95/models/application.dart';
import 'package:retro95/widgets/custom_scaffold95.dart';
import 'package:custom_navigator/custom_navigator.dart';

class Window extends StatefulWidget {
  const Window({
    Key key,
    this.app,
    this.height = 600,
    this.width = 600,
    this.onCloseApp,
    this.constraints,
    this.onMinizeApp,
  }) : super(key: key);

  final Application app;
  final double height;
  final double width;
  final Function onCloseApp;
  final Function onMinizeApp;
  final BoxConstraints constraints;

  @override
  _WindowState createState() => _WindowState();
}

class _WindowState extends State<Window> {
  Application _app;

  @override
  void initState() {
    super.initState();

    _app = widget.app;
  }

  Widget createApp(String processName, int applicationId) {
    switch (processName) {
      case 'counter-app':
        return CounterApp();
      case 'dummy-app':
        return DummyPage();
      case 'flutter95-app':
        return Flutter95Screen();
      case 'browser-app':
        return Browser();
      case 'notepad-app':
        return Notepad();
      default:
        return CounterApp();
    }
  }

  void test() {
    widget.onMinizeApp();
  }

  void onMaximize() {
    setState(() {
      _app = _app.copyWith(maximized: !_app.maximized);
    });
  }

  void onMinimize() {
    setState(() {
      _app = _app.copyWith(minimized: !_app.minimized);
    });
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

    return Container(
      child: GestureDetector(
        onTap: () {
          print(_app.processId);
        },
        child: ResizebleWidget(
          child: CustomScaffold95(
            title: _app.label,
            body: CustomNavigator(
              navigatorKey: navigatorKey,
              pageRoute: PageRoutes.materialPageRoute,
              home: createApp(widget.app.processName, widget.app.processId),
            ),
            onClose: () => widget.onCloseApp(_app.processId),
            onMaximize: onMaximize,
            onMinimize: onMinimize,
          ),
          height: _app.maximized ? widget.constraints.maxHeight : widget.height,
          width: _app.maximized ? widget.constraints.maxWidth : widget.width,
          // maximize: _app.maximized,
          visible: _app.minimized ? false : true,
          // constraints: widget.constraints,
        ),
      ),
    );
  }
}

class ResizebleWidget extends StatefulWidget {
  ResizebleWidget({
    this.child,
    this.visible = true,
    this.key,
    this.height = 600,
    this.width = 600,
    // this.constraints,
    // this.maximize,
  });

  final Widget child;
  final bool visible;
  final Key key;
  final double height;
  final double width;
  // final bool maximize;
  // final BoxConstraints constraints;
  @override
  _ResizebleWidgetState createState() => _ResizebleWidgetState();
}

const ballDiameter = 10.0;
const lineWidth = 10.0;

class _ResizebleWidgetState extends State<ResizebleWidget> {
  double top = 0;
  double left = 0;
  double height = 600;
  double width = 600;

  @override
  void initState() {
    height = widget.height;
    width = widget.width;
    // if (widget.maximize) {
    //   height = widget.constraints.maxHeight;
    //   width = widget.constraints.maxWidth;
    // }
    super.initState();
  }

  @override
  void didUpdateWidget(ResizebleWidget oldWidget) {
    setState(() {
      height = widget.height;
      width = widget.width;
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: top,
            left: left,
            child: Container(
              height: height,
              width: width,
              child: widget.child,
            ),
          ),
          // top left
          Positioned(
            top: top - ballDiameter / 2,
            left: left - ballDiameter / 2,
            child: ManipulatingBall(
              onDrag: (dx, dy) {
                var mid = (dx + dy) / 2;
                var newHeight = height - 2 * mid;
                var newWidth = width - 2 * mid;

                setState(() {
                  height = newHeight > 0 ? newHeight : 0;
                  width = newWidth > 0 ? newWidth : 0;
                  top = top + mid;
                  left = left + mid;
                });
              },
            ),
          ),
          // top middle
          Positioned(
            top: top - ballDiameter / 2,
            left: left + ballDiameter,
            child: ManipulatingLine(
              width: width - ballDiameter * 2,
              onDrag: (dx, dy) {
                var newHeight = height - dy;

                setState(() {
                  height = newHeight > 0 ? newHeight : 0;
                  top = top + dy;
                });
              },
            ),
          ),
          // top right
          Positioned(
            top: top - ballDiameter / 2,
            left: left + width - ballDiameter / 2,
            child: ManipulatingBall(
              onDrag: (dx, dy) {
                var mid = (dx + (dy * -1)) / 2;

                var newHeight = height + 2 * mid;
                var newWidth = width + 2 * mid;

                setState(() {
                  height = newHeight > 0 ? newHeight : 0;
                  width = newWidth > 0 ? newWidth : 0;
                  top = top - mid;
                  left = left - mid;
                });
              },
            ),
          ),
          // center right
          Positioned(
            top: top + ballDiameter,
            left: left + width - ballDiameter / 2,
            child: ManipulatingLine(
              height: height - ballDiameter,
              onDrag: (dx, dy) {
                var newWidth = width + dx;

                setState(() {
                  width = newWidth > 0 ? newWidth : 0;
                });
              },
            ),
          ),
          // bottom right
          Positioned(
            top: top + height - ballDiameter / 2,
            left: left + width - ballDiameter / 2,
            child: ManipulatingBall(
              onDrag: (dx, dy) {
                var mid = (dx + dy) / 2;

                var newHeight = height + 2 * mid;
                var newWidth = width + 2 * mid;

                setState(() {
                  height = newHeight > 0 ? newHeight : 0;
                  width = newWidth > 0 ? newWidth : 0;
                  top = top - mid;
                  left = left - mid;
                });
              },
            ),
          ),
          // bottom center
          Positioned(
            top: top + height - ballDiameter / 2,
            left: left - ballDiameter / 2,
            child: ManipulatingLine(
              width: width,
              onDrag: (dx, dy) {
                var newHeight = height + dy;

                setState(() {
                  height = newHeight > 0 ? newHeight : 0;
                });
              },
            ),
          ),
          // bottom left
          Positioned(
            top: top + height - ballDiameter / 2,
            left: left - ballDiameter / 2,
            child: ManipulatingBall(
              onDrag: (dx, dy) {
                var mid = ((dx * -1) + dy) / 2;

                var newHeight = height + 2 * mid;
                var newWidth = width + 2 * mid;

                setState(() {
                  height = newHeight > 0 ? newHeight : 0;
                  width = newWidth > 0 ? newWidth : 0;
                  top = top - mid;
                  left = left - mid;
                });
              },
            ),
          ),
          //left center
          Positioned(
            top: top + ballDiameter / 2,
            left: left,
            child: ManipulatingLine(
              height: height - ballDiameter,
              onDrag: (dx, dy) {
                var newWidth = width - dx;

                setState(() {
                  width = newWidth > 0 ? newWidth : 0;
                  left = left + dx;
                });
              },
            ),
          ),
          // center center
          Positioned(
            top: top + ballDiameter / 2,
            left: left,
            child: ManipulatingLine(
              width: width - 100,
              height: 30,
              onDrag: (dx, dy) {
                setState(() {
                  top = top + dy;
                  left = left + dx;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ManipulatingBall extends StatefulWidget {
  ManipulatingBall({
    Key key,
    this.onDrag,
    this.showGuidelines = false,
  });

  final Function onDrag;

  final bool showGuidelines;

  @override
  _ManipulatingBallState createState() => _ManipulatingBallState();
}

class _ManipulatingBallState extends State<ManipulatingBall> {
  double initX;
  double initY;

  _handleDrag(details) {
    setState(() {
      initX = details.globalPosition.dx;
      initY = details.globalPosition.dy;
    });
  }

  _handleUpdate(details) {
    var dx = details.globalPosition.dx - initX;
    var dy = details.globalPosition.dy - initY;
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;
    widget.onDrag(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _handleDrag,
      onPanUpdate: _handleUpdate,
      child: Container(
        width: ballDiameter,
        height: ballDiameter,
        decoration: BoxDecoration(
          color: widget.showGuidelines ? Colors.red : null,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class ManipulatingLine extends StatefulWidget {
  ManipulatingLine({
    Key key,
    this.onDrag,
    this.width = lineWidth,
    this.height = lineWidth,
    this.showGuidelines = false,
  });

  final Function onDrag;

  final double width;

  final double height;

  final bool showGuidelines;

  @override
  _ManipulatingLineState createState() => _ManipulatingLineState();
}

class _ManipulatingLineState extends State<ManipulatingLine> {
  double initX;
  double initY;

  _handleDrag(details) {
    setState(() {
      initX = details.globalPosition.dx;
      initY = details.globalPosition.dy;
    });
  }

  _handleUpdate(details) {
    var dx = details.globalPosition.dx - initX;
    var dy = details.globalPosition.dy - initY;
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;
    widget.onDrag(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _handleDrag,
      onPanUpdate: _handleUpdate,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.showGuidelines ? Colors.green.withOpacity(0.5) : null,
        ),
      ),
    );
  }
}
