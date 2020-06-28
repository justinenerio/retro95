import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';
import 'package:retro95/widgets/restart_widget.dart';

class BlueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        RestartWidget.restartApp(context);
      },
      child: Scaffold(
        backgroundColor: Color(0xFF0100aa),
        body: SizedBox.expand(
          child: Container(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(4.0),
                  color: Color(0xFFa7aab0),
                  child: Text(
                    'Windows',
                    style: Flutter95.textStyle.copyWith(
                      color: Color(0xFF0100aa),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3.0,
                    ),
                  ),
                ),
                const SizedBox(height: 52),
                Text(
                  'A fatal exception 0E has occured at 0028:C0026822 in VXD VFAT(01) 0000690E. \nThe current application will be terminated.',
                  style: Flutter95.textStyle.copyWith(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3.0,
                  ),
                ),
                const SizedBox(height: 48),
                Text(
                  '* Press any key to terminate the current application.',
                  style: Flutter95.textStyle.copyWith(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3.0,
                  ),
                ),
                Text(
                  '* Press CTRL+ALT+DEL again to restart your computer. You will \nlose any unsaved information in all applications.',
                  style: Flutter95.textStyle.copyWith(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3.0,
                  ),
                ),
                const SizedBox(height: 52),
                Text(
                  'Press any key to continue _',
                  style: Flutter95.textStyle.copyWith(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
