import 'dart:convert';

import 'package:flutterarchitecturesample/data_layer/models/shopping_cart.dart';
import 'package:flutterarchitecturesample/data_layer/shared_prefs_keys.dart';
import 'package:flutterarchitecturesample/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Session {
  ShoppingCart _shoppingCart;

  set shoppingCart(ShoppingCart shoppingCart) {
    _shoppingCart = shoppingCart;

    final prefs = serviceLocator.get<SharedPreferences>();
    if (shoppingCart == null) {
      prefs.remove(SharedPrefsKeys.SHOPPING_CART);
    } else {
      prefs.setString(
        SharedPrefsKeys.SHOPPING_CART,
        json.encode(shoppingCart.toJson()),
      );
    }
  }

  ShoppingCart get shoppingCart {
    if (_shoppingCart == null) {
      _shoppingCart = ShoppingCart([]);

      final prefs = serviceLocator.get<SharedPreferences>();
      if (prefs.containsKey(SharedPrefsKeys.SHOPPING_CART)) {
        _shoppingCart = ShoppingCart.fromJson(
            json.decode(prefs.getString(SharedPrefsKeys.SHOPPING_CART)));
      }
    }

    return _shoppingCart;
  }
}
