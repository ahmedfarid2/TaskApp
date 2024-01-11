import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSwatch(
      backgroundColor: Colors.white,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: const Color(0xffFFFFFF),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor:  Colors.transparent,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xffFFFFFF),
      surfaceTintColor: Colors.transparent,
    ),
  );
}
