import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/ui_layer/font_book.dart';
import 'package:flutterarchitecturesample/ui_layer/values/dimens.dart';
import 'package:flutterarchitecturesample/ui_layer/values/semantic_strings.dart';
import 'package:flutterarchitecturesample/ui_layer/values/strings.dart';
import 'package:flutterarchitecturesample/ui_layer/values/theme_colors.dart';

class ErrorScreen extends StatelessWidget {
  final Function onTryAgainPressed;

  ErrorScreen({this.onTryAgainPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 100,
          height: 100,
          child: Icon(Icons.error),
        ),
        SizedBox(height: Dimens.MARGIN_20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.MARGIN_48),
          child: FontBook.buildText(
            Strings.ERROR_MESSAGE,
            FontBookStyle.body,
            textAlign: TextAlign.center,
            overrideColor: ThemeColors.black,
            wrapContent: true,
          ),
        ),
        SizedBox(height: Dimens.MARGIN_40),
        Semantics(
          label: SemanticStrings.TRY_AGAIN_BUTTON,
          hint: SemanticStrings.TRY_AGAIN_BUTTON_HINT,
          child: FlatButton(
            color: ThemeColors.primary,
            onPressed: onTryAgainPressed,
            child: FontBook.buildText(
              Strings.TRY_AGAIN,
              FontBookStyle.button,
              overrideColor: ThemeColors.black,
            ),
          ),
        ),
      ],
    );
  }
}
