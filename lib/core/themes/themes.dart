import 'package:flutter/material.dart';

import '../app_colors.dart';

/// Google fonts constant setting: https://fonts.google.com/
class Themes {
  static const String darkTheme = 'darkTheme';
  static const String lightTheme = 'lightTheme';

  /// Build the App Theme
  static ThemeData buildTheme(
      {required BuildContext context, String theme = Themes.darkTheme}) {
    var isDarkTheme = theme == Themes.darkTheme;

    var fontFamily = 'Roboto';
    if (isDarkTheme) {
      return buildDarkTheme(context, fontFamily);
    }
    return buildLightTheme(context, fontFamily);
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static ThemeData buildDarkTheme(BuildContext context,
      [String fontFamily = 'Roboto']) {
    return ThemeData.dark().copyWith(
      primaryColor: AppColors.primaryColor,
      appBarTheme: _appBarTheme,
      scaffoldBackgroundColor: AppColors.kDarkBackground,
      buttonTheme: _buttonTheme(context),
      elevatedButtonTheme: _elevatedButtonTheme,
      cardColor: AppColors.kDarkCard,
      drawerTheme: const DrawerThemeData(backgroundColor: AppColors.kDarkCard),
      sliderTheme: _sliderTheme,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.kDarkBottomNavBar),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryColor),
    );
  }

  static ThemeData buildLightTheme(BuildContext context,
      [String fontFamily = 'Roboto']) {
    return ThemeData.light().copyWith(
      primaryColor: AppColors.primaryColor,
      appBarTheme: _appBarTheme,
      scaffoldBackgroundColor: AppColors.kLightBackground,
      buttonTheme: _buttonTheme(context),
      elevatedButtonTheme: _elevatedButtonTheme,
      cardColor: AppColors.kLightCard,
      drawerTheme: const DrawerThemeData(backgroundColor: AppColors.kLightCard),
      sliderTheme: _sliderTheme,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.kLightBottomNavBar,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryColor),
    );
  }

  static const _appBarTheme = AppBarTheme(color: AppColors.primaryColor);
  static const _sliderTheme = SliderThemeData(
    activeTrackColor: AppColors.primaryColor,
    thumbColor: AppColors.primaryColor,
  );

  static _buttonTheme(context) => ButtonTheme.of(context).copyWith(
      buttonColor: AppColors.primaryColor, textTheme: ButtonTextTheme.primary);

  static final _elevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    primary: AppColors.primaryColor,
  ));
}
