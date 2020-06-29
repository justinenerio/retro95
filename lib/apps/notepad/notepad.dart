import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart' hide TextField95;
import 'package:retro95/apps/notepad/textfield95.dart';

class Notepad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
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
              label: 'Format',
              onTap: (context) {},
            ),
            Item95(
              label: 'Help',
              onTap: (context) {},
            ),
          ]),
          const SizedBox(height: 4),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Elevation95(
                type: Elevation95Type.down,
                child: TextField95(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
