import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hourse_life/models/MainService.dart';

class Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//---------------------------------------------------MainService---------------------------------------------------------------------------
 //show Main Service In dropDown
  Stream<QuerySnapshot> loadMainServices() {
    return _firestore.collection("MainService").snapshots();
  }
 //show Sub Service In dropDown
  Stream<QuerySnapshot> loadSubService() {
    return _firestore.collection("SubService").snapshots();
  }
}
