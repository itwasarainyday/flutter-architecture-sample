import 'package:flutterarchitecturesample/extensions/double+extension.dart';

class Strings {
  static const WELCOME = "Welcome!";

  // Error
  static const ERROR_MESSAGE = "There was an unexpected error.";
  static const TRY_AGAIN = "Try Again";

  // Product Details
  static const ADD_TO_CART = "Add to Cart";
  static String PRICE_DESCRIPTION(double price) {
    return "For one simple payment of ${price.toPriceFormatString()} this can be yours to keep. Warranty not included.";
  }
}
