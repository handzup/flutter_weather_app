import 'package:flutter/material.dart';

abstract class Styles {
  static const primaryColor = Color(0xFFf8fcff);
  static const primaryShadowColor = Color(0xFFe8edff);
  static const blue = Color(0xFF1565C0);
  static const TextStyle defaultTextStyle = TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontFamily: 'GT Eesti Pro',
      fontWeight: FontWeight.w600);
  static const TextStyle defaultTextStyleDark = TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontFamily: 'GT Eesti Pro',
      fontWeight: FontWeight.w600);
  static const TextStyle defaultLinkBlue = TextStyle(
      color: blue,
      fontSize: 20,
      fontFamily: 'GT Eesti Pro',
      fontWeight: FontWeight.w600);
  static const TextStyle defaultLinkBlueDark = TextStyle(
      color: blue,
      fontSize: 20,
      fontFamily: 'GT Eesti Pro',
      fontWeight: FontWeight.w600);

  static const TextStyle defaultGreyText = TextStyle(
      color: Colors.grey,
      fontSize: 16,
      fontFamily: 'GT Eesti Pro',
      fontWeight: FontWeight.w600);
  static const TextStyle defaultGreyTextDark = TextStyle(
      color: Colors.white70,
      fontSize: 16,
      fontFamily: 'GT Eesti Pro',
      fontWeight: FontWeight.w600);
  static const TextStyle defaultHeadlineText = TextStyle(
      color: Colors.black,
      fontSize: 30,
      fontFamily: 'GT Eesti Pro',
      fontWeight: FontWeight.w600);
  static const TextStyle defaultHeadlineDark = TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontFamily: 'GT Eesti Pro',
      fontWeight: FontWeight.w600);
  static const TextStyle gradusHeadlineText = TextStyle(
      color: Colors.grey,
      fontSize: 30,
      fontFamily: 'GT Eesti Pro',
      fontWeight: FontWeight.w300);
  static const TextStyle gradusHeadlineTextDark = TextStyle(
      color: Colors.white70,
      fontSize: 30,
      fontFamily: 'GT Eesti Pro',
      fontWeight: FontWeight.w300);

  static const TextStyle defaulTemperatureText = TextStyle(
      color: Colors.black54,
      fontSize: 60,
      fontFamily: 'GT Eesti Pro',
      fontWeight: FontWeight.w700);
  static const TextStyle defaulTemperatureTextDark = TextStyle(
      color: Colors.white,
      fontSize: 60,
      fontFamily: 'GT Eesti Pro',
      fontWeight: FontWeight.w700);
  static const TextStyle defaultText = TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontFamily: 'GT Eesti Pro',
      fontWeight: FontWeight.w600);
  static const TextStyle defaultTextDark = TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontFamily: 'GT Eesti Pro',
      fontWeight: FontWeight.w600);
  static const TextStyle smallTemperatureText = TextStyle(
      color: Colors.black54,
      fontSize: 20,
      fontFamily: 'GT Eesti Pro',
      fontWeight: FontWeight.w700);
  static const TextStyle smallTemperatureTextDark = TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontFamily: 'GT Eesti Pro',
      fontWeight: FontWeight.w700);
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      shadowColor: primaryShadowColor,
      scaffoldBackgroundColor: isDarkTheme ? Colors.black : primaryColor,
      primaryColor: isDarkTheme ? Colors.black : primaryColor,
      backgroundColor: isDarkTheme ? Colors.black : primaryColor,
      textTheme: TextTheme(
          bodyText1: isDarkTheme ? defaultTextStyleDark : defaultTextStyle,
          bodyText2: isDarkTheme ? defaultGreyTextDark : defaultGreyText,
          headline1: isDarkTheme ? defaultHeadlineDark : defaultHeadlineText,
          headline2:
              isDarkTheme ? defaulTemperatureTextDark : defaulTemperatureText,
          headline3: isDarkTheme ? gradusHeadlineTextDark : gradusHeadlineText,
          subtitle1: isDarkTheme ? defaultTextDark : defaultText,
          subtitle2:
              isDarkTheme ? smallTemperatureTextDark : smallTemperatureText,
          headline4: isDarkTheme ? defaultLinkBlueDark : defaultLinkBlue),
      buttonColor: isDarkTheme ? Colors.white : Colors.black,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
    );
  }
}
