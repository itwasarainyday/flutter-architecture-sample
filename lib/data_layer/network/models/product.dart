class Product {
  final int id;
  final String name;

  Product({this.id = 0, this.name = ""});

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}
