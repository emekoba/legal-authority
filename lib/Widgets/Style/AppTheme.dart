import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white,
      accentColor: Colors.grey,
      scaffoldBackgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.white),
      buttonColor: Colors.blue,
      //
      textTheme: TextTheme(
          button: TextStyle(color: Colors.white),
          headline1: TextStyle(
              fontWeight: FontWeight.bold,
              height: 1.5,
              fontFamily: "Emporia",
              letterSpacing: 1),
          headline2: TextStyle(
              fontWeight: FontWeight.bold,
              height: 1.5,
              fontFamily: "Sailor",
              letterSpacing: 1),
          headline3: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 2.8,
              height: 1.8,
              fontFamily: "Helvetica"),
          headline4:
              TextStyle(fontFamily: "Blanco", fontWeight: FontWeight.bold),
          headline5: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Playfair",
              letterSpacing: 1.8),
          headline6: TextStyle(
            // fontWeight: FontWeight.bold,
            fontFamily: "Sebino",
            // height: 1.8,
            // letterSpacing: 1.8,
          )));

  static final ThemeData dark = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Color(0xff1D212B),
      accentColor: Color(0xff4a4a58),
      scaffoldBackgroundColor: Color(0xff1D212B),
      iconTheme: IconThemeData(color: Color(0xff1D212B)),
      buttonColor: Colors.amberAccent,
      //
      textTheme: TextTheme(
          headline1: TextStyle(
              fontWeight: FontWeight.bold,
              height: 1.5,
              fontFamily: "Emporia",
              letterSpacing: 1),
          headline2: TextStyle(
              fontWeight: FontWeight.bold,
              height: 1.5,
              fontFamily: "Sailor",
              letterSpacing: 1),
          headline3: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 2.8,
              height: 1.8,
              fontFamily: "Helvetica"),
          headline4:
              TextStyle(fontFamily: "Blanco", fontWeight: FontWeight.bold),
          headline5: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Playfair",
              letterSpacing: 1.8),
          headline6: TextStyle(
            // fontWeight: FontWeight.bold,
            fontFamily: "Sebino",
            // height: 1.8,
            // letterSpacing: 1.8,
          )));
}
