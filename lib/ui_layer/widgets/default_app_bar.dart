import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/bloc_layer/bloc_provider.dart';
import 'package:flutterarchitecturesample/bloc_layer/data_blocs/shopping_cart_bloc.dart';
import 'package:flutterarchitecturesample/data_layer/models/shopping_cart.dart';
import 'package:flutterarchitecturesample/ui_layer/font_book.dart';
import 'package:flutterarchitecturesample/ui_layer/values/dimens.dart';
import 'package:flutterarchitecturesample/ui_layer/values/theme_colors.dart';
import 'package:flutterarchitecturesample/ui_layer/widgets/stateable_builder.dart';
import 'package:flutterarchitecturesample/extensions/double+extension.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  DefaultAppBar({@required this.title});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: ThemeColors.primary,
      elevation: 0,
      title: FontBook.buildText(
        title,
        FontBookStyle.title,
        overrideColor: ThemeColors.white,
      ),
      actions: [
        _buildCartButton(context),
      ],
    );
  }

  Widget _buildCartButton(BuildContext context) {
    final shoppingCartBloc = BlocProvider.of<ShoppingCartBloc>(context);

    return StateableBuilder<ShoppingCart>(
      stateable: shoppingCartBloc,
      initialize: () {
        shoppingCartBloc.getCart();
      },
      onAll: (result) => Row(
        children: [
          FontBook.buildText(
            (result.data?.totalPrice ?? 0.0).toPriceFormatString(),
            FontBookStyle.button,
            overrideColor: ThemeColors.white,
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: ThemeColors.white,
            ),
            onPressed: () {
              shoppingCartBloc.clearCart();
            },
          ),
        ],
      ),
    );
  }
}
