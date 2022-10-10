
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.blue,
  appBarTheme: AppBarTheme(
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark),
    elevation: 0.0,
    backgroundColor: Colors.black12,
    titleTextStyle: TextStyle(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
  scaffoldBackgroundColor: Colors.black12,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    unselectedLabelStyle: TextStyle(
        color: Colors.white
    ),
    selectedItemColor: Colors.blue,
    elevation: 20,
    backgroundColor: Colors.black26,
    type:BottomNavigationBarType.fixed,
    unselectedIconTheme: IconThemeData(
      color: Colors.grey,
    ),
  ),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white
    ),
  ),
  fontFamily: 'Jannah',
) ;
ThemeData light =ThemeData(
  fontFamily: 'Jannah',
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    bodyText1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black
    ),
  ),
  appBarTheme: AppBarTheme(
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light
    ),
    elevation: 0.0,
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.bold,

    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    unselectedLabelStyle: TextStyle(
        color: Colors.black
    ),
    selectedItemColor: Colors.blue,
    elevation: 20,
    type:BottomNavigationBarType.fixed,
  ),
  iconTheme: IconThemeData(
    color: Colors.black,
  ),
) ;