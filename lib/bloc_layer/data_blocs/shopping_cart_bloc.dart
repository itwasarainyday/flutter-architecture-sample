import 'package:flutterarchitecturesample/bloc_layer/bloc.dart';
import 'package:flutterarchitecturesample/bloc_layer/stateable.dart';
import 'package:flutterarchitecturesample/data_layer/models/shopping_cart.dart';
import 'package:flutterarchitecturesample/data_layer/network/models/product_details.dart';
import 'package:flutterarchitecturesample/data_layer/result.dart';
import 'package:flutterarchitecturesample/data_layer/session.dart';
import 'package:flutterarchitecturesample/service_locator.dart';

class ShoppingCartBloc extends Bloc with Stateable<ShoppingCart> {
  /// Adding and removing items in the cart can be achieved by using Events directly in the view.
  /// However, using the Bloc pattern allows us to observe changes in the cart easily.

  void getCart() {
    setState(Result.success(serviceLocator.get<Session>().shoppingCart));
  }

  void addToCart(ProductDetails product) {
    serviceLocator.get<Session>().shoppingCart.addToCart(product);
    getCart();
  }

  void removeFromCart(ProductDetails product) {
    serviceLocator.get<Session>().shoppingCart.removeFromCart(product);
    getCart();
  }

  void clearCart() {
    serviceLocator.get<Session>().shoppingCart = null;
    getCart();
  }
}
