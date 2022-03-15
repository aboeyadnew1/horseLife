import 'dart:core';

class MainService {
  String id;
  String name;


  MainService({
    this.id,
    this.name,

  });
  Map<String,dynamic> toMap(){
    return {
      "id":this.id,
      "name":this.name,

    };
  }
}
