class ProductDetails {
  final int id;
  final String name, description;
  final double price;

  ProductDetails({
    this.id = 0,
    this.name = "",
    this.description = "",
    this.price = 0.0,
  });

  ProductDetails.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        price = json['price'];
}
