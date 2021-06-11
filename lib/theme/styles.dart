import 'package:flutter/cupertino.dart';

class AppTextStyle {
  static TextStyle get h1 {
    return TextStyle(
        fontFamily: "Gilroy", fontWeight: FontWeight.w400, fontSize: 20);
  }

  static TextStyle get h2 {
    return TextStyle(
        fontFamily: "Gilroy", fontWeight: FontWeight.w400, fontSize: 18);
  }

  static TextStyle get body1 {
    return TextStyle(
        fontFamily: "Gilroy", fontWeight: FontWeight.w400, fontSize: 16);
  }

  static TextStyle get body {
    return TextStyle(
        fontFamily: "Gilroy", fontWeight: FontWeight.w400, fontSize: 14);
  }

  static TextStyle get bodySmall {
    return TextStyle(
        fontFamily: "Gilroy", fontWeight: FontWeight.w400, fontSize: 11);
  }
}
