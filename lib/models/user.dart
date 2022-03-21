// ignore_for_file: unnecessary_this

class User {
  // 'number': customer.number,
  // 'service': customer.service,

  // 'total': 0,
  // 'identity_num': customer.identity_num,

  // 'name': customer.name,
  //

  String id;
  String name;
  String phone;
  String email;
  String image;
  String password;
  String tax_num;
  String identity_num;
  String address;
  String job;
  double lat;
  double lng;
  bool approved = false;
  bool visable = true;

  User({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.password,
    this.tax_num,
    this.identity_num,
    this.address,
    this.job,
    this.image,
    this.lat,
    this.lng,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': this.id,
      'name': this.name,
      'phone': this.phone,
      'email': this.email,
      'password': this.password,
      'tax_num': this.tax_num,
      'identity_num': this.identity_num,
      'address': this.address,
      'job': this.job,
      'lat': this.lat,
      'lng': this.lng,
      'image': this.image,
      'approved': this.approved,
      'visable': this.visable,
    };

    return map;
  }

  User.fromMap(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.phone = json['phone'];
    this.email = json['email'];
    this.password = json['password'];
    this.tax_num = json['recordNumber'];
    this.identity_num = json['identity_num'];
    this.address = json['address'];
    this.job = json['job'];
    this.lat = json['lat'];
    this.lng = json['lng'];
    this.approved = json['approved'];
    this.visable = json['visable'];
    this.image = json['image'];
  }
}
