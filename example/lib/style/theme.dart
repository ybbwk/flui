import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final ThemeData kLightTheme = _buildLightTheme();
final ThemeData kDarkTheme = _buildDarkTheme();

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    headline6: base.headline6.copyWith(
      fontFamily: 'GoogleSans',
    ),
  );
}

ThemeData _buildDarkTheme() {
  const Color primaryColor = Color(0xFF34355D);
  const Color secondaryColor = Color(0xFF5F58A0);
  final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );
  final ThemeData base = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    primaryColorDark: const Color(0xFF345B9A),
    appBarTheme: AppBarTheme(
      color: const Color(0xFF202124),
      titleTextStyle: TextStyle(
        color: Color(0xFFD1DAFE),
      ),
      toolbarTextStyle: TextStyle(
        color: Color(0xFFD1DAFE),
      ),
    ),
    primaryColorLight: secondaryColor,
    indicatorColor: Colors.white,
    toggleableActiveColor: primaryColor,
    canvasColor: const Color(0xFF202124),
    scaffoldBackgroundColor: const Color(0xFF202124),
    backgroundColor: const Color(0xFF202124),
    cardColor: const Color(0xFF323135),
    errorColor: const Color(0xFFB00020),
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: primaryColor,
      brightness: Brightness.dark,
    ),
  );
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      secondary: secondaryColor,
    ),
    textTheme: _buildTextTheme(base.textTheme).apply(
      bodyColor: Color(0xFFEDEDED),
    ),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme).apply(
      displayColor: Color(0xFFEDEDED),
      bodyColor: Color(0xFFEDEDED),
    ),
  );
}

ThemeData _buildLightTheme() {
  const Color primaryColor = Color(0xFF345B9A);
  Color secondaryColor = Color(0xFF095093);
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );
  final ThemeData base = ThemeData(
      brightness: Brightness.light,
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      indicatorColor: Colors.white,
      toggleableActiveColor: primaryColor,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      canvasColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      errorColor: const Color(0xFFB00020),
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor: primaryColor,
        brightness: Brightness.light,
      ));
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      secondary: secondaryColor,
    ),
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
  );
}
