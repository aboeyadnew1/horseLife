import 'dart:core';
class Massage {
  String id;
  String massage;
  String description;
  String date;
  String vendor_id;
  String vendor_name;

  Massage({
    this.id,
    this.massage,
    this.description,
    this.date,
    this.vendor_id,
    this.vendor_name

  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': this.id,
      'massage': this.massage,
      'description': this.description,
      'date': this.date,
      'vendor_id': this.vendor_id,
      'vendor_name': this.vendor_name,
    };

    return map;
  }

  Massage.fromMap(Map<String, dynamic> json) {
    this.id = json['id'];
    this.massage = json['massage'];
    this.description = json['description'];
    this.date = json['date'];
    this.vendor_id = json['vendor_id'];
    this.vendor_name = json['vendor_name'];
  }

}
