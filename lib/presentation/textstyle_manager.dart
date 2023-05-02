import 'package:flutter/material.dart';

import '/presentation/font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  String fontFamily,
  FontWeight fontWeight,
  Color color,
) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle getTitleStyle({double fontSize = 30, required Color color}) {
  return _getTextStyle(
      fontSize, FontManager.fontFamily, FontWeightManager.regular, color);
}

TextStyle getDimTextStyle({double fontSize = 15, required Color color}) {
  return _getTextStyle(
      fontSize, FontManager.fontFamily, FontWeightManager.regular, color);
}

TextStyle getTempStyle({double fontSize = 80, required Color color}) {
  return _getTextStyle(
      fontSize, FontManager.fontFamily, FontWeightManager.bold, color);
}
