class User {
  User(
      {
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

  User.fromMap(Map<String, dynamic> json) {
    this.name = json['name'];
    this.phone = json['phone'];
    this.email = json['email'];
    this.password = json['password'];
    this.recordNumber = json['recordNumber'];
    this.personalIdentity = json['personalIdentity'];
    this.address = json['address'];
    this.job = json['job'];
    this.lat = json['lat'];
    this.long = json['long'];
    this.mainServiceType = json['mainServiceType'];
    this.subServiceType = json['subServiceType'];
    this.approved = json['approved'];
    this.visable = json['visable'];
  }
}