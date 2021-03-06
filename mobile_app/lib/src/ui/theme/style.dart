import 'package:flutter/material.dart';

final kTheme = ThemeData(
  primarySwatch: kPrimaryColor,
  scaffoldBackgroundColor: kScaffoldBackgroundColor,
  fontFamily: 'Montserrat',
  textTheme: TextTheme().apply(
    bodyColor: kTextColor,
    displayColor: kTextColor,
  ),
);

const kScaffoldBackgroundColor = Colors.white;

const kPrimaryColor = MaterialColor(
  0xFF1C6DF9,
  {
    50: Color(0xFF1C6DF9),
    100: Color(0xFF1C6DF9),
    200: Color(0xFF1C6DF9),
    300: Color(0xFF1C6DF9),
    400: Color(0xFF1C6DF9),
    500: Color(0xFF1C6DF9),
    600: Color(0xFF1C6DF9),
    700: Color(0xFF1C6DF9),
    800: Color(0xFF1C6DF9),
    900: Color(0xFF1C6DF9),
  },
);

const kTextColor = Color(0xFF313131);
