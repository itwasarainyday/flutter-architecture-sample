import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/ui_layer/values/theme_colors.dart';

enum FontBookStyle {
  title,
  body,
  placeholder,
  button,
  caption,
}

class FontBook {
  static Widget buildText(
    String string,
    FontBookStyle fontBookStyle, {
    String semanticLabel,
    Color overrideColor,
    int maxLines,
    bool wrapContent = true,
    TextAlign textAlign = TextAlign.start,
  }) {
    final textWidget = Text(
      string,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: wrapContent ? TextOverflow.visible : TextOverflow.ellipsis,
      style: createTextStyle(fontBookStyle, overrideColor: overrideColor),
    );

    return (semanticLabel != null)
        ? Semantics(
            label: semanticLabel,
            value: string,
            excludeSemantics: true,
            child: textWidget)
        : textWidget;
  }

  static TextStyle createTextStyle(
    FontBookStyle fontBookStyle, {
    Color overrideColor,
  }) {
    switch (fontBookStyle) {
      case FontBookStyle.title:
        return TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.5,
            color: overrideColor ?? ThemeColors.black);
        break;
      case FontBookStyle.body:
        return TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.25,
            color: overrideColor ?? ThemeColors.black);
        break;
      case FontBookStyle.placeholder:
        return TextStyle(
            fontSize: 14.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.25,
            color: overrideColor ?? ThemeColors.black);
        break;
      case FontBookStyle.button:
        return TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.25,
            color: overrideColor ?? ThemeColors.black);
        break;
      case FontBookStyle.caption:
        return TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.4,
            color: overrideColor ?? ThemeColors.black);
        break;
    }

    return null;
  }
}
