import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hourse_life/constants/constants.dart';
import 'package:provider/provider.dart';

class Address extends StatefulWidget {
  static String id="Address";
  const Address({Key key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  bool isEdit;
  double lat, lng;
  Completer<GoogleMapController> _contrioller = Completer();
  List<Marker> markers = [];
  Marker _marker;

  @override
  void initState() {
    setState(() {
      _marker = Marker(
        markerId: MarkerId(MapDimensions.mapList[0]['id']),
        position: uid.lat != null
            ? LatLng(uid.lat, uid.lng)
            : LatLng(
                MapDimensions.mapList[0]['lat'],
                MapDimensions.mapList[0]['lng'],
              ),
        infoWindow: InfoWindow(title: MapDimensions.mapList[0]["title"]),
      );
      markers.add(_marker);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(24.774265, 46.738586), zoom: 10.0),
                  onMapCreated: (GoogleMapController googlemapcontroller) {
                    _contrioller.complete(googlemapcontroller);
                  },
                  markers: Set.from(markers),
                  onTap: (pos) {
                    print(pos);
                    markers.clear();
                    Marker f = Marker(
                        markerId: MarkerId('1'),
                        infoWindow: InfoWindow(title: 'الموقع المحدد'),
                        position: LatLng(pos.latitude, pos.longitude),
                        onTap: () {});
                    setState(() {
                      markers.add(f);
                      uid.lat = pos.latitude;
                      uid.lng = pos.longitude;
                    });
                  },
                ),
                Positioned(
                    top: 25,
                    left: -5,
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.all(15),
                      child: FloatingActionButton(
                        heroTag: '2',
                          splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        backgroundColor: kMainColor,
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.close,
                        color: Colors.white,),
                      ),
                    ))
              ],
            );
  }
}

class MapDimensions {
  static List<Map<String, dynamic>> mapList = [
    {
      "title": "الرياض",
      "id": "1",
      "lat": 24.743525,
      "lng": 46.657719,
    }
  ];
}
