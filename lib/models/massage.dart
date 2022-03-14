import 'dart:core';
class Massage {
  String id;
  String massage;
  String description;
  String date;


  Massage({
    this.id,
    this.massage,
    this.description,
    this.date,

  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': this.id,
      'massage': this.massage,
      'description': this.description,
      'date': this.date,
    };

    return map;
  }

  Massage.fromMap(Map<String, dynamic> json) {
    this.id = json['id'];
    this.massage = json['massage'];
    this.description = json['description'];
    this.date = json['date'];
  }

}
