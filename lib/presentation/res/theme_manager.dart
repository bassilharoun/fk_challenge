import 'package:challenge/presentation/res/color_manager.dart';
import 'package:challenge/presentation/res/font_manager.dart';
import 'package:challenge/presentation/res/style_manager.dart';
import 'package:challenge/presentation/res/values_manager.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.black,
    primaryColorLight: ColorManager.black,
    primaryColorDark: ColorManager.black,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.black,

    scaffoldBackgroundColor: ColorManager.black,

    // cardview theme
    cardTheme: CardTheme(
      color: ColorManager.grey1,
      shadowColor: ColorManager.grey2,
      elevation: AppSize.s4,
    ),

    // app bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.black,
        elevation: AppSize.s4,
        shadowColor: ColorManager.black,
        titleTextStyle:
            getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white)),

    // button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.white,
      splashColor: ColorManager.white,
    ),

    // elevated ButtonTheme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                color: ColorManager.white, fontSize: FontSize.s17),
            backgroundColor: ColorManager.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    //text theme
    textTheme: TextTheme(
        displayLarge:
            getSemiBoldStyle(color: ColorManager.white, fontSize: FontSize.s18),
        headlineLarge:
            getSemiBoldStyle(color: ColorManager.white, fontSize: FontSize.s16),
        headlineMedium:
            getLightStyle(color: ColorManager.white, fontSize: FontSize.s16),
        titleMedium:
            getMediumStyle(color: ColorManager.white, fontSize: FontSize.s18),
        titleLarge:
            getBoldStyle(color: ColorManager.white, fontSize: FontSize.s22),
        titleSmall:
            getRegularStyle(color: ColorManager.white, fontSize: FontSize.s14),
        bodyLarge: getRegularStyle(color: ColorManager.white),
        bodyMedium: getMediumStyle(color: ColorManager.white),
        bodySmall: getRegularStyle(color: ColorManager.white)),

    // input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      //content padding
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle:
          getRegularStyle(color: ColorManager.white, fontSize: FontSize.s14),
      labelStyle:
          getMediumStyle(color: ColorManager.white, fontSize: FontSize.s14),
      errorStyle: getRegularStyle(color: ColorManager.error),
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.white, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.white, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.error, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.white, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
    ),
  );
}
