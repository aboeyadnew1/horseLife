class Service {
  String mainServiceType;
  String subServiceType;
  String name;
  String description;
  String quantity;
  String price;
  String deliveryMethod;
  String deliveryTime;
  String image;
  double rate;
  String vendor_id;

  Service(
      {this.mainServiceType,
      this.subServiceType,
      this.name,
      this.description,
      this.quantity,
      this.price,
      this.deliveryMethod,
      this.deliveryTime,
      this.image,
      this.rate,
      this.vendor_id});

  Map<String, dynamic> toMap() {
    return {
      'mainServiceType': this.mainServiceType,
      'subServiceType': this.subServiceType,
      'name': this.name,
      'description': this.description,
      'quantity': this.quantity,
      'price': this.price,
      'image': this.image,
      'deliveryMethod': this.deliveryMethod,
      'deliveryTime': this.deliveryTime,
      'rate': this.rate,
      'vendor_id': this.vendor_id,
    };
  }
}
