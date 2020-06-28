import 'package:flutter/material.dart';
import 'package:easy_google_maps/easy_google_maps.dart';
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
                apiKey: kGoogleMapsApiKey,
                address: 'Infinite Loop, Cupertino, CA 95014',
                title: 'Apple Campus',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
