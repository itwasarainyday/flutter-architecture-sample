import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/ui_layer/screens/product_details/product_details_screen.dart';
import 'package:flutterarchitecturesample/ui_layer/screens/products/products_screen.dart';
import 'package:flutterarchitecturesample/ui_layer/widgets/default_app_bar.dart';

class RouterPage {
  static const String productsScreen = "/";
  static const String productDetailsScreen = "/product_details";
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterPage.productsScreen:
        return MaterialPageRoute(builder: (_) => ProductsScreen());
      case RouterPage.productDetailsScreen:
        final productId = settings.arguments as int;
        return productId != null
            ? MaterialPageRoute(builder: (_) => ProductDetailsScreen(productId))
            : _buildRoutingError(route: RouterPage.productDetailsScreen);
      default:
        return _buildRoutingError();
    }
  }

  static popToRoot(BuildContext context) {
    Navigator.of(
      context,
      rootNavigator: true,
    ).popUntil((route) => route.isFirst);
  }

  static MaterialPageRoute _buildRoutingError({String route}) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: DefaultAppBar(title: "Error"),
        body: Center(
            child: Text(route != null
                ? 'Error routing to $route'
                : 'Route not defined for $route')),
      ),
    );
  }
}
