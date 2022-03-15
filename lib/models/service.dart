class ServiceModel {
  String vendor_id;
  String mainServiceType;
  String subServiceType;
  String name;
  String description;
  dynamic quantity;
  dynamic price;
  String deliveryMethod;
  String deliveryTime;
  String image;
  String id;
  dynamic rate;
  ServiceModel(
      {this.vendor_id,
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
  ServiceModel.fromJson(Map<String, dynamic> json) {
    vendor_id = json['vendor_id'];
    mainServiceType = json['mainServiceType'];
    subServiceType = json['subServiceType'];
    name = json['name'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    deliveryMethod = json['deliveryMethod'];
    image = json['image'];
    id = json['id'];
    rate = json['rate'];
    deliveryTime = json['deliveryTime'];
  }
  Map<String, dynamic> toMap() {
    return {
      'vendor_id': this.vendor_id,
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
