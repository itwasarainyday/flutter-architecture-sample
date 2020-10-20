import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/bloc_layer/bloc_provider.dart';
import 'package:flutterarchitecturesample/bloc_layer/data_blocs/shopping_cart_bloc.dart';
import 'package:flutterarchitecturesample/ui_layer/router.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Blocs provided above MaterialApp are provided to any widgets in the navigation stack
    return BlocProvider(
      bloc: ShoppingCartBloc(),
      child: MaterialApp(
        title: 'Sample App',
        initialRoute: RouterPage.productsScreen,
        onGenerateRoute: (RouteSettings settings) {
          return Router.generateRoute(settings);
        },
      ),
    );
  }
}
