class UserModel {
  String id;
  String name;
  String phone;
  String email;
  String password;
  String recordNumber;
  String personalIdentity;
  String address;
  String job;
  String lat;
  String long;
  String mainServiceType;
  String subServiceType;
  bool approved = false;
  bool visable = true;
  UserModel(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.password,
      this.recordNumber,
      this.personalIdentity,
      this.address,
      this.job,
      this.lat,
      this.long});

  UserModel.fromMap(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    recordNumber = json['recordNumber'];
    personalIdentity = json['personalIdentity'];
    address = json['address'];
    job = json['job'];
    lat = json['lat'];
    long = json['long'];
    mainServiceType = json['mainServiceType'];
    subServiceType = json['subServiceType'];
    approved = json['approved'];
    visable = json['visable'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': this.name,
      'phone': this.phone,
      'email': this.email,
      'password': this.password,
      'recordNumber': this.recordNumber,
      'personalIdentity': this.personalIdentity,
      'address': this.address,
      'job': this.job,
      'lat': this.lat,
      'long': this.long,
      'mainServiceType': this.mainServiceType,
      'subServiceType': this.subServiceType,
      'approved': this.approved,
      'visable': this.visable,
    };

    return map;
  }
}
