import 'package:flutter/material.dart';
import 'package:retro95/models/application.dart';

class Constants {
  static const backgroundColor = Color(0xFF008080);
  static const bsodColor = Color(0xFF0100aa);
  static const iconSelectedColor = Color(0xFF000080);

  static List<Application> defaultApps = [
    Application(
      label: 'Counter',
      image: 'assets/images/tree.png',
      processName: 'tree-app',
      maximized: true,
    ),
    Application(
      label: 'Browser',
      image: 'assets/images/browser.png',
      processName: 'browser-app',
      maximized: true,
    ),
    Application(
      label: 'Doom95',
      image: 'assets/images/application.png',
      processName: 'dummy-app',
      maximized: true,
    ),
    Application(
      label: 'Notepad',
      image: 'assets/images/notepad.png',
      processName: 'notepad-app',
      maximized: true,
    ),
    Application(
      label: 'Maps',
      image: 'assets/images/maps.png',
      processName: 'maps-app',
      maximized: true,
    ),
    Application(
      label: 'Flutter95',
      image: 'assets/images/windows.png',
      processName: 'flutter95-app',
      maximized: true,
    ),
    Application(
      label: 'Calculator',
      image: 'assets/images/calculator.png',
      processName: 'calculator-app',
      maximized: false,
    ),
    Application(
      label: 'About',
      image: 'assets/images/hack20_logo.png',
      processName: 'about-app',
      maximized: false,
    ),
  ];
}
