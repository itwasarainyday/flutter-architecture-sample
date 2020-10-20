import 'package:flutter_test/flutter_test.dart';
import 'package:flutterarchitecturesample/data_layer/models/shopping_cart.dart';
import 'package:flutterarchitecturesample/data_layer/network/models/product_details.dart';

/// A simple data model test example for ShoppingCart.totalPrice

void main() {
  test('totalPrice returns the price of all items in the cart', () async {
    final shoppingCart = ShoppingCart([
      ProductDetails(price: 0.5),
      ProductDetails(price: 1.0),
      ProductDetails(price: 30),
      ProductDetails(price: 2.3),
    ]);

    expect(shoppingCart.totalPrice, 0.5 + 1.0 + 30 + 2.3);
  });
}
