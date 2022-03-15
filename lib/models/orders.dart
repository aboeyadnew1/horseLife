import 'dart:core';

import 'package:hourse_life/models/service.dart';

class Order {
  String id;
  String user_id;
  String vendor_id;
  List<ServiceModel> services;
  String email;
  String address;
  String state;
  double lat;
  double lng;
  String creation_date;
  String delivered_date;
  String updated_date;
  String statue;
  double total;
  double rate;
  String phone;

  // 0 for creation
  // 1 for accepted for delivery
  // 2 for canceled
  // 3 for delivered

  Order({
    this.id,
    this.user_id,
    this.vendor_id,
    this.services,
    this.email,
    this.address,
    this.state,
    this.lat,
    this.lng,
    this.creation_date,
    this.delivered_date,
    this.updated_date,
    this.statue,
    this.total,
    this.rate,
    this.phone,
  });
}
