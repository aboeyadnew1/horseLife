import 'dart:core';

class SubService {
  String id;
  String name;
  String main_id;


  SubService({
    this.id,
    this.name,
    this.main_id,

  });
  Map<String,dynamic> toMap(){
    return {
      "id":this.id,
      "name":this.name,
      "main_id":this.main_id,

    };
  }
}
