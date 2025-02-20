import 'package:flutter/material.dart';
import 'package:news_app_two/core/constants/app_style.dart';
import 'package:news_app_two/theme/color_palette.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      iconTheme: IconThemeData(color: ColorPalette.blackColor),
      toggleButtonsTheme: ToggleButtonsThemeData(
        textStyle: AppStyles.bold16Black,
      ),
      indicatorColor: ColorPalette.blackColor,
      scaffoldBackgroundColor: ColorPalette.primaryColor,
      primaryColor: ColorPalette.primaryColor,
      appBarTheme: AppBarTheme(
          backgroundColor: ColorPalette.primaryColor, centerTitle: true),
      textTheme: TextTheme(
          labelLarge: AppStyles.medium24Black,
          headlineLarge: AppStyles.bold16Black,
          headlineMedium: AppStyles.medium14Black));
  static final ThemeData darkTheme = ThemeData(
      iconTheme: IconThemeData(color: ColorPalette.primaryColor),
      toggleButtonsTheme:
          ToggleButtonsThemeData(textStyle: AppStyles.bold16Primary),
      indicatorColor: ColorPalette.primaryColor,
      scaffoldBackgroundColor: ColorPalette.blackColor,
      primaryColor: ColorPalette.blackColor,
      appBarTheme: AppBarTheme(
          backgroundColor: ColorPalette.blackColor, centerTitle: true),
      textTheme: TextTheme(
        labelLarge: AppStyles.medium24White,
        headlineLarge: AppStyles.bold16Primary,
        headlineMedium: AppStyles.medium14Primary,
      ));
}
