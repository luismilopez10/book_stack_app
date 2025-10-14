import 'package:book_stack_design_system/book_stack_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: BsColors.NEUTRAL_00,
    primaryColor: BsColors.PRIMARY_02,
    cardColor: BsColors.PRIMARY_01,
    brightness: Brightness.light,
    focusColor: BsColors.SECONDARY_00,
    appBarTheme: _getAppBarTheme(),
    colorScheme: _getColorScheme().copyWith(secondary: BsColors.SECONDARY_01),
    inputDecorationTheme: const InputDecorationTheme(
      focusColor: BsColors.SECONDARY_00,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: BsColors.NEUTRAL_01,
    primaryColor: BsColors.PRIMARY_00,
    cardColor: BsColors.NEUTRAL_02,
    brightness: Brightness.dark,
    focusColor: BsColors.SECONDARY_02,
    appBarTheme: _getAppBarThemeDark(),
    colorScheme: _getColorSchemeDark().copyWith(
      secondary: BsColors.SECONDARY_02,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      focusColor: BsColors.SECONDARY_02,
    ),
  );

  static ColorScheme _getColorScheme() {
    return const ColorScheme.light(
      primary: BsColors.PRIMARY_02,
      secondary: BsColors.SECONDARY_01,
      surface: BsColors.NEUTRAL_00,
      error: BsColors.ERROR,
      onPrimary: BsColors.PRIMARY_01,
      onSecondary: BsColors.PRIMARY_01,
      onSurface: BsColors.PRIMARY_00,
      onError: BsColors.PRIMARY_01,
    );
  }

  static ColorScheme _getColorSchemeDark() {
    return const ColorScheme.dark(
      primary: BsColors.PRIMARY_02,
      secondary: BsColors.SECONDARY_02,
      surface: BsColors.NEUTRAL_01,
      error: BsColors.ERROR,
      onPrimary: BsColors.NEUTRAL_02,
      onSecondary: BsColors.NEUTRAL_02,
      onError: BsColors.NEUTRAL_02,
    );
  }

  static AppBarTheme _getAppBarTheme() {
    return const AppBarTheme(
      backgroundColor: BsColors.PRIMARY_02,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  static AppBarTheme _getAppBarThemeDark() {
    return const AppBarTheme(
      backgroundColor: BsColors.NEUTRAL_01,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }
}
