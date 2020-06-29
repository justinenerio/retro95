import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';
import 'package:retro95/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  _launchURL() async {
    const url = 'https://github.com/justinenerio/retro95';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Elevation95(
              type: Elevation95Type.down,
              child: Container(
                child: Center(
                  child: Container(
                    width: 400,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/hack20.png'),
                        const SizedBox(height: 16),
                        Center(
                          child: Text(
                            '#Hack20 Entry',
                            style: Flutter95.textStyle.copyWith(
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                        const SizedBox(height: 72),
                        Text(
                          'Retro 95 - Windows 95 Desktop Experience',
                          style: Flutter95.textStyle.copyWith(
                            letterSpacing: 2.0,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Experience nostalgia with the iconic Windows 95 right from your browser. Retro 95 is an attempt to recreate the Windows 95 desktop experience with Flutter. Contains programs like notepad , a web browser, calculator and more.',
                          style: Flutter95.textStyle.copyWith(
                            letterSpacing: 2.0,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 32),
                        RichText(
                          text: TextSpan(
                            text: 'GitHub Repository: ',
                            style: Flutter95.textStyle.copyWith(
                              letterSpacing: 2.0,
                            ),
                            children: [
                              TextSpan(
                                  text:
                                      'https://github.com/justinenerio/retro95',
                                  style: TextStyle(color: Constants.bsodColor),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      _launchURL();
                                    })
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
