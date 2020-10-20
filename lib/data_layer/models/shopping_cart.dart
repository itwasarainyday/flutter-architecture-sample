import 'package:flutterarchitecturesample/data_layer/network/models/product_details.dart';

class ShoppingCart {
  List<ProductDetails> _products = [];

  ShoppingCart(this._products);

  double get totalPrice => _products.fold(0.0, (total, product) => total + product.price);

  void addToCart(ProductDetails product) {
    _products.add(product);
  }

  void removeFromCart(ProductDetails product) {
    _products.remove(product);
  }

  ShoppingCart.fromJson(Map<String, dynamic> json)
      : _products = json['products'];

  Map<String, dynamic> toJson() => {'products': _products.toString()};
}
