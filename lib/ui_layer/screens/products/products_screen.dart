import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/bloc_layer/bloc_provider.dart';
import 'package:flutterarchitecturesample/bloc_layer/data_blocs/get_products_bloc.dart';
import 'package:flutterarchitecturesample/data_layer/network/models/product.dart';
import 'package:flutterarchitecturesample/ui_layer/font_book.dart';
import 'package:flutterarchitecturesample/ui_layer/router.dart';
import 'package:flutterarchitecturesample/ui_layer/screens/error/error_screen.dart';
import 'package:flutterarchitecturesample/ui_layer/values/dimens.dart';
import 'package:flutterarchitecturesample/ui_layer/values/strings.dart';
import 'package:flutterarchitecturesample/ui_layer/widgets/default_app_bar.dart';
import 'package:flutterarchitecturesample/ui_layer/widgets/loading_spinner.dart';
import 'package:flutterarchitecturesample/ui_layer/widgets/stateable_builder.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final getProductsBloc = GetProductsBloc();

    return BlocProvider(
      bloc: getProductsBloc,
      child: Scaffold(
        appBar: DefaultAppBar(
          title: Strings.WELCOME,
        ),
        body: StateableBuilder<List<Product>>(
          stateable: getProductsBloc,
          initialize: () {
            getProductsBloc.getProducts();
          },
          onUninitialized: () => LoadingSpinner(),
          onLoading: (_) => LoadingSpinner(),
          onError: (result) => ErrorScreen(onTryAgainPressed: getProductsBloc.getProducts),
          onSuccess: (products) => _buildProductsList(context, products),
        ),
      ),
    );
  }

  Widget _buildProductsList(BuildContext context, List<Product> products) {
    return ListView(children: [
      SizedBox(height: Dimens.MARGIN_12),
      ...products.map((product) => _buildProductItem(context, product)),
      SizedBox(height: Dimens.MARGIN_12),
    ]);
  }

  Widget _buildProductItem(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          RouterPage.productDetailsScreen,
          arguments: product.id,
        );
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Dimens.MARGIN_12,
            horizontal: Dimens.MARGIN_16,
          ),
          child: FontBook.buildText(
            product.name,
            FontBookStyle.body,
          ),
        ),
      ),
    );
  }
}
