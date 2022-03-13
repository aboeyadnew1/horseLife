class Service {
  String vendor_id;
  String mainServiceType;
  String subServiceType;
  String name;
  String description;
  var quantity;
  var price;
  String deliveryMethod;
  String deliveryTime;
  String image;
  String id;
  var rate;
  Service(
      {
        this.vendor_id,
        this.mainServiceType,
      this.subServiceType,
      this.name,
      this.description,
      this.quantity,
      this.price,
      this.deliveryMethod,
      this.image,
      this.id,
      this.rate,
      this.deliveryTime});



  Map<String, dynamic> toMap() {
    return {
      'vendor_id' : this.vendor_id,
      'mainServiceType': this.mainServiceType,
      'subServiceType': this.subServiceType,
      'name': this.name,
      'description': this.description,
      'quantity': this.quantity,
      'price': this.price,
      'image': this.image,
      'id': this.id,
      'rate': this.rate,
      'deliveryMethod': this.deliveryMethod,
      'deliveryTime': this.deliveryTime,
    };
  }
}
