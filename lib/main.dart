import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retro95/apps/root.dart';
import 'package:retro95/constants/constants.dart';
import 'package:retro95/widgets/restart_widget.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Constants.backgroundColor),
  );

  runApp(
    RestartWidget(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retro 95',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Root(),
    );
  }
}
