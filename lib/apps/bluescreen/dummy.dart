import 'package:flutter/material.dart';
import 'package:retro95/apps/bluescreen/blue_screen.dart';

class DummyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => {
          Navigator.of(context, rootNavigator: true).pushReplacement(
            MaterialPageRoute(builder: (context) => BlueScreen()),
          )
        });
    return Container(
      child: Center(
        child: Text(
          'FLUTTER<3',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
      ),
    );
  }
}
