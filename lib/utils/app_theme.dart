import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// application theme with a set of common colors and text styles
class AppTheme {
  AppTheme._();

  // *********************************************
  // Colors
  // *********************************************

  /* Primary colors */

  static const Color colorPrimary = Colors.pink;
  static const Color colorOnPrimary = Color(0xFFFFFFFF);
  static const Color colorSecondary = Color(0xFFEDEEF1);
  static const Color colorOnSecondary = Color(0xFF000000);
  static const Color colorBackground = Color(0xFFFFFFFF);
  static const Color colorOnBackground = Color(0xFF000000);
  static const Color colorSurface = Color(0xFFF8F9FB);
  static const Color colorOnSurface = Color(0xFF000000);
  static const Color colorError = Color(0xFFF70C13);
  static const Color colorOnError = Color(0xFFFFFFFF);
  static const Color colorOutline = Color.fromRGBO(0, 0, 0, 0.12);
  static const Color colorDisabled = Color.fromRGBO(0, 0, 0, 0.12);
  static const Color colorOnDisabled = Color.fromRGBO(0, 0, 0, 0.38);

  // *********************************************
  // ColorScheme
  // *********************************************

  static const colorPrimarySwatch = Colors.pink;
  static final colorSecondarySwatch = MaterialColor(
    colorSecondary.value,
    const {
      50: Color(0xFFF9FAFD),
      100: Color(0xFFF4F5F8),
      200: Color(0xFFEDEEF1),
      300: Color(0xFFDFE0E3),
      400: Color(0xFFBCBDC0),
      500: Color(0xFF9D9EA1),
      600: Color(0xFF747577),
      700: Color(0xFF606163),
      800: Color(0xFF414244),
      900: Color(0xFF202123),
    },
  );

  static final ColorScheme appColorScheme = ColorScheme.fromSwatch(
    primarySwatch: colorPrimarySwatch,
  ).copyWith(
    primary: colorPrimarySwatch.shade500,
    onPrimary: colorOnPrimary,
    primaryContainer: colorPrimarySwatch.shade700,
    secondary: colorSecondarySwatch.shade200,
    onSecondary: colorOnSecondary,
    secondaryContainer: colorSecondarySwatch.shade700,
    background: colorBackground,
    onBackground: colorOnBackground,
    surface: colorSurface,
    onSurface: colorOnSurface,
    error: colorError,
    onError: colorOnError,
    outline: colorOutline,
  );

  // *********************************************
  // Typography
  // *********************************************

  static const font = 'Poppins';

  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: font,
      fontSize: 96,
      letterSpacing: -1.5,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      fontFamily: font,
      fontSize: 60,
      letterSpacing: -0.5,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
    ),
    displaySmall: TextStyle(
      fontFamily: font,
      fontSize: 48,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
    ),
    headlineMedium: TextStyle(
      fontFamily: font,
      fontSize: 34,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: TextStyle(
      fontFamily: font,
      fontSize: 24,
      letterSpacing: -0.18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      fontFamily: font,
      fontSize: 20,
      letterSpacing: 0.15,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      fontFamily: font,
      fontSize: 16,
      letterSpacing: 0.15,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: TextStyle(
      fontFamily: font,
      fontSize: 14,
      letterSpacing: 0.1,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: TextStyle(
      fontFamily: font,
      fontSize: 14,
      letterSpacing: 1.25,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      fontFamily: font,
      fontSize: 10,
      letterSpacing: 1.5,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      fontFamily: font,
      fontSize: 16,
      letterSpacing: 0.5,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontFamily: font,
      fontSize: 14,
      letterSpacing: 0.25,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontFamily: font,
      fontSize: 12,
      letterSpacing: 0.4,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
    ),
  );

  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    fontFamily: font,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: _textTheme,
    canvasColor: colorBackground,
    scaffoldBackgroundColor: colorBackground,
    dialogBackgroundColor: colorBackground,
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      elevation: 0,
      color: colorBackground,
      centerTitle: false,
      iconTheme: const IconThemeData(
        color: colorOnBackground,
      ),
      // systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: _textTheme.titleLarge!.copyWith(
        color: colorOnBackground,
      ),
    ),
    primarySwatch: colorPrimarySwatch,
    cupertinoOverrideTheme: CupertinoThemeData(
      textTheme: CupertinoTextThemeData(
        dateTimePickerTextStyle: _textTheme.bodyLarge,
      ),
    ),
    colorScheme: appColorScheme,
  );
}
