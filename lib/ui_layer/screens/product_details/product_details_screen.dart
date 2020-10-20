import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/bloc_layer/bloc_provider.dart';
import 'package:flutterarchitecturesample/bloc_layer/data_blocs/product_details_bloc.dart';
import 'package:flutterarchitecturesample/bloc_layer/data_blocs/shopping_cart_bloc.dart';
import 'package:flutterarchitecturesample/data_layer/network/models/product_details.dart';
import 'package:flutterarchitecturesample/ui_layer/font_book.dart';
import 'package:flutterarchitecturesample/ui_layer/screens/error/error_screen.dart';
import 'package:flutterarchitecturesample/ui_layer/values/dimens.dart';
import 'package:flutterarchitecturesample/ui_layer/values/strings.dart';
import 'package:flutterarchitecturesample/ui_layer/values/theme_colors.dart';
import 'package:flutterarchitecturesample/ui_layer/widgets/default_app_bar.dart';
import 'package:flutterarchitecturesample/ui_layer/widgets/loading_spinner.dart';
import 'package:flutterarchitecturesample/ui_layer/widgets/stateable_builder.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int productId;

  ProductDetailsScreen(this.productId);

  @override
  Widget build(BuildContext context) {
    final productDetailsBloc = ProductDetailsBloc();

    return Scaffold(
      appBar: DefaultAppBar(title: Strings.WELCOME),
      body: StateableBuilder<ProductDetails>(
        stateable: productDetailsBloc,
        initialize: () {
          productDetailsBloc.getProductDetails(productId);
        },
        onUninitialized: () => LoadingSpinner(),
        onLoading: (_) => LoadingSpinner(),
        onError: (result) => ErrorScreen(onTryAgainPressed: () {
          productDetailsBloc.getProductDetails(productId);
        }),
        onSuccess: (productDetails) =>
            _buildProductDetails(context, productDetails),
      ),
    );
  }

  Widget _buildProductDetails(
    BuildContext context,
    ProductDetails productDetails,
  ) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: Dimens.MARGIN_16),
      children: [
        SizedBox(height: Dimens.MARGIN_24),
        FontBook.buildText(productDetails.name, FontBookStyle.title),
        SizedBox(height: Dimens.MARGIN_16),
        FontBook.buildText(productDetails.description, FontBookStyle.title),
        SizedBox(height: Dimens.MARGIN_8),
        FontBook.buildText(
          Strings.PRICE_DESCRIPTION(productDetails.price),
          FontBookStyle.title,
        ),
        SizedBox(height: Dimens.MARGIN_24),
        Expanded(
          child: Center(
            child: FlatButton(
              color: ThemeColors.primary,
              onPressed: () {
                BlocProvider.of<ShoppingCartBloc>(context)
                    .addToCart(productDetails);
              },
              child: FontBook.buildText(
                Strings.ADD_TO_CART,
                FontBookStyle.button,
                overrideColor: ThemeColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
