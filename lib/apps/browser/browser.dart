import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';
import 'package:easy_web_view/easy_web_view.dart';

class Browser extends StatefulWidget {
  @override
  _BrowserState createState() => _BrowserState();
}

class _BrowserState extends State<Browser> {
  String _url = 'https://flutter.dev/';
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _url);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Toolbar95(actions: [
          Item95(
            label: 'File',
            menu: _buildMenu(),
          ),
          Item95(
            label: 'Edit',
            onTap: (context) {},
          ),
          Item95(
            label: 'View',
            onTap: (context) {},
          ),
          Item95(
            label: 'Favorites',
            onTap: (context) {},
          ),
          Item95(
            label: 'Help',
            onTap: (context) {},
          ),
        ]),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 2.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Address', style: Flutter95.textStyle),
              const SizedBox(width: 4),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField95(controller: _controller),
                ),
              ),
              Button95(
                height: 35,
                onTap: () {
                  setState(() {
                    _url = _controller.text;
                  });
                },
                child: Center(child: Text('Go')),
              )
            ],
          ),
        ),
        const SizedBox(height: 4),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Elevation95(
              type: Elevation95Type.down,
              child: EasyWebView(
                key: ValueKey('key_0'),
                src: _url,
                isHtml: false,
                isMarkdown: false,
              ),
            ),
          ),
        ),
      ],
    ));
  }

  Menu95 _buildMenu() {
    return Menu95(
      items: [
        MenuItem95(
          value: 1,
          label: 'New',
        ),
        MenuItem95(
          value: 2,
          label: 'Open',
        ),
        MenuItem95(
          value: 3,
          label: 'Exit',
        ),
      ],
      onItemSelected: (item) {},
    );
  }
}
