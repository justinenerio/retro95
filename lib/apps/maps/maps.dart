import 'package:easy_google_maps/easy_google_maps.dart';
import 'package:flutter/material.dart';
import 'package:retro95/constants/api_key.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: EasyGoogleMaps(
                key: ValueKey('key_1'),
                apiKey: kGoogleMapsApiKey,
                address:
                    '1600 Amphitheatre Parkway, Mountain View, California, United States ',
                title: 'Googleplex',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
