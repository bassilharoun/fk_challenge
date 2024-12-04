
import 'package:challenge/presentation/res/font_manager.dart';
import 'package:flutter/material.dart';

dynamic _getTextStyle(double fontSize, FontWeight fontWeight, Color color){
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontConstants.fontFamily,
    color: color,
    fontWeight: fontWeight
  );
}

// regular style

dynamic getRegularStyle({double fontSize = FontSize.s12, required Color color, }){
  return _getTextStyle(fontSize, FontWeightManager.regular, color)!;
}

// medium style

dynamic getMediumStyle({double fontSize = FontSize.s12, required Color color, }){
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

// light style

dynamic getLightStyle({double fontSize = FontSize.s12, required Color color, }){
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

// bold style

dynamic getBoldStyle({double fontSize = FontSize.s12, required Color color, }){
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

// semiBold style

dynamic getSemiBoldStyle({double fontSize = FontSize.s12, required Color color, }){
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}