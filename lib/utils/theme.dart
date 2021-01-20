import 'package:flutter/material.dart';
import './styleConstant.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: backgroundColor,
  fontFamily: 'Cairo',
  textTheme: TextTheme(
    // body1:bodyTextStyle
    bodyText2: bodyTextStyle,
  ),
  brightness: Brightness.light,
  accentColor: Colors.amber,
);
// bodyText2