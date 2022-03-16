import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  CameraPosition initPosition =
      CameraPosition(target: LatLng(24.7229063, 46.7618251), zoom: 10.0);
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, null);
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            centerTitle: true,
            title: Text(
              'اختار موقعك',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: GoogleMap(
            markers: markers,
            initialCameraPosition: initPosition,
            onMapCreated: (controller) {
              _controller.complete(controller);
            },
            onTap: (latLng) {
              setState(() {
                markers.clear();
                markers.add(Marker(
                  position: latLng,
                  markerId: MarkerId(latLng.toString()),
                ));
              });
            },
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: () {
              if (markers.isNotEmpty) {
                Navigator.pop(context, markers.first.position);
              }
            },
          ),
        ));
  }
}
