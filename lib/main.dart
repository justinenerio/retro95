import 'package:flutter/material.dart';
import 'package:retro95/apps/root.dart';
import 'package:retro95/widgets/restart_widget.dart';

void main() {
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
