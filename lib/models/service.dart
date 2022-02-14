class Service {
  Service(
      {this.mainServiceType,
      this.subServiceType,
      this.name,
      this.description,
      this.quantity,
      this.price,
      this.deliveryMethod,
      this.deliveryTime});

  String mainServiceType;
  String subServiceType;
  String name;
  String description;
  String quantity;
  String price;
  String deliveryMethod;
  String deliveryTime;

  Map<String, dynamic> toMap() {
    return {
      'mainServiceType': this.mainServiceType,
      'subServiceType': this.subServiceType,
      'name': this.name,
      'description': this.description,
      'quantity': this.quantity,
      'price': this.price,
      'deliveryMethod': this.deliveryMethod,
      'deliveryTime': this.deliveryTime,
    };
  }
}
