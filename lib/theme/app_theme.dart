import 'package:flutter/material.dart';
import 'package:news_app_two/core/constants/app_style.dart';
import 'package:news_app_two/theme/color_palette.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      drawerTheme: DrawerThemeData(backgroundColor: Colors.black),
      filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              foregroundColor: MaterialStateProperty.all(Colors.black),
              textStyle:
                  MaterialStateProperty.all(const TextStyle(fontSize: 16)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )))),
      primaryColorLight: ColorPalette.blackColor,
      iconTheme: const IconThemeData(color: ColorPalette.blackColor),
      toggleButtonsTheme: ToggleButtonsThemeData(
        textStyle: AppStyles.bold16Black,
      ),
      indicatorColor: ColorPalette.blackColor,
      scaffoldBackgroundColor: ColorPalette.primaryColor,
      primaryColor: ColorPalette.primaryColor,
      appBarTheme: const AppBarTheme(
          backgroundColor: ColorPalette.primaryColor, centerTitle: true),
      textTheme: TextTheme(
          labelMedium: AppStyles.medium14Black,
          labelLarge: AppStyles.medium24Black,
          headlineLarge: AppStyles.bold16Black,
          headlineMedium: AppStyles.medium14Black));
  static final ThemeData darkTheme = ThemeData(
      drawerTheme: DrawerThemeData(
        backgroundColor: Colors.white,
        scrimColor: Colors.white,
      ),
      filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )))),
      primaryColorLight: ColorPalette.primaryColor,
      iconTheme: const IconThemeData(color: ColorPalette.primaryColor),
      toggleButtonsTheme:
          ToggleButtonsThemeData(textStyle: AppStyles.bold16Primary),
      indicatorColor: ColorPalette.primaryColor,
      scaffoldBackgroundColor: ColorPalette.blackColor,
      primaryColor: ColorPalette.blackColor,
      appBarTheme: const AppBarTheme(
          backgroundColor: ColorPalette.blackColor, centerTitle: true),
      textTheme: TextTheme(
        labelMedium: AppStyles.medium14Primary,
        labelLarge: AppStyles.medium24White,
        headlineLarge: AppStyles.bold16Primary,
        headlineMedium: AppStyles.medium14Primary,
      ));
}
