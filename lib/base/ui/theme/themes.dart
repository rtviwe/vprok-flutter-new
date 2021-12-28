import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  textTheme: const TextTheme(
    bodyText2: TextStyle(
      fontSize: 14,
      letterSpacing: -0.08,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
    ),
    caption: TextStyle(
      fontSize: 12,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.16,
    ),
    subtitle1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.15,
    ),
    subtitle2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    headline5: TextStyle(
      fontSize: 24,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.18,
    ),
    headline6: TextStyle(
      fontSize: 20,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.04,
    ),
    button: TextStyle(
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.24,
    ),
    overline: TextStyle(
      fontSize: 10,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.25,
    ),
  )..apply(fontFamily: 'Roboto'),
);

final lightTheme = ThemeData(
  brightness: Brightness.light,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  textTheme: const TextTheme(
    bodyText2: TextStyle(
      fontSize: 14,
      letterSpacing: -0.08,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
    ),
    caption: TextStyle(
      fontSize: 12,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.16,
    ),
    subtitle1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.15,
    ),
    subtitle2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    headline5: TextStyle(
      fontSize: 24,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.18,
    ),
    headline6: TextStyle(
      fontSize: 20,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.04,
    ),
    button: TextStyle(
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.24,
    ),
    overline: TextStyle(
      fontSize: 10,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.25,
    ),
  )..apply(fontFamily: 'Roboto'),
);
