import 'dart:ui';

import 'package:flutter/material.dart';

class Styles {

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.green,
      primaryColor: Colors.green,
      backgroundColor: isDarkTheme ? Colors.white : Color(0xff212121),
      // indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      // buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
      //
      // hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),
      //
      // highlightColor: isDarkTheme ? Colors.black:Colors.white ,
      // hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      // focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      //disabledColor: Colors.grey,
      textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme ? Color(0xff212121) : Colors.white,
      canvasColor: isDarkTheme ? Color(0xff212121) : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
       // buttonTheme: Theme.of(context).buttonTheme.copyWith(
       //     colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      // appBarTheme: AppBarTheme(
      //   elevation: 0.0,
      // ),
    );

  }
}