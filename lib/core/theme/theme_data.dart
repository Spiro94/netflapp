import 'package:flutter/material.dart';

class AppTheme {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
        textSelectionTheme:
            TextSelectionThemeData(cursorColor: colorScheme.secondary),
        colorScheme: colorScheme,
        textTheme: _textTheme.apply(
          displayColor: _darkFillColor,
          bodyColor: _darkFillColor,
        ),
        primaryColor: const Color(0xFF030303),
        appBarTheme: AppBarTheme(
          foregroundColor: _darkFillColor,
          backgroundColor: colorScheme.background,
          elevation: 0,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            minimumSize:
                MaterialStateProperty.all<Size>(const Size.fromHeight(40)),
            backgroundColor: MaterialStateProperty.all<Color>(
              colorScheme.primary,
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              _lightFillColor,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
        fontFamily: 'Gilroy',
        iconTheme: const IconThemeData(color: _darkFillColor),
        canvasColor: colorScheme.background,
        scaffoldBackgroundColor: colorScheme.background,
        highlightColor: Colors.transparent,
        focusColor: focusColor,
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Color.alphaBlend(
            _lightFillColor.withOpacity(0.80),
            _darkFillColor,
          ),
          contentTextStyle: _textTheme.subtitle1?.apply(color: _darkFillColor),
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: _lightFillColor.withOpacity(0.5),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: colorScheme.secondary),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                style: BorderStyle.solid, color: colorScheme.secondary),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                style: BorderStyle.solid, color: colorScheme.secondary),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showUnselectedLabels: true,
          selectedItemColor: colorScheme.primary,
          unselectedItemColor: _darkFillColor,
          selectedIconTheme: const IconThemeData(size: 30),
          unselectedIconTheme: const IconThemeData(size: 30),
        ));
  }

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFFFD233),
    primaryVariant: Color(0xFF1CDEC9),
    secondary: Color(0xFF8C8C8C),
    secondaryVariant: Color(0xFF8C8C8C),
    background: Color(0xFF191919),
    surface: Colors.black,
    onBackground: Color(0x0DFFFFFF),
    error: _darkFillColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    brightness: Brightness.dark,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static const TextTheme _textTheme = TextTheme(
    headline2: TextStyle(fontWeight: _semiBold, fontSize: 30.0),
    headline3: TextStyle(fontWeight: _semiBold, fontSize: 24.0),
    headline4: TextStyle(fontWeight: _bold, fontSize: 20.0),
    caption: TextStyle(fontWeight: _semiBold, fontSize: 16.0),
    headline5: TextStyle(fontWeight: _medium, fontSize: 16.0),
    subtitle1: TextStyle(fontWeight: _medium, fontSize: 16.0),
    overline: TextStyle(fontWeight: _medium, fontSize: 12.0),
    bodyText1: TextStyle(fontWeight: _regular, fontSize: 12.0),
    subtitle2: TextStyle(fontWeight: _bold, fontSize: 14.0),
    bodyText2: TextStyle(fontWeight: _regular, fontSize: 16.0),
    headline6: TextStyle(fontWeight: _regular, fontSize: 18.0),
    button: TextStyle(fontWeight: _semiBold, fontSize: 18.0),
  );
}
