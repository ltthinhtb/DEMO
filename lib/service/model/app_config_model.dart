import 'package:bloc_example/theme/theme.dart';
import 'package:bloc_example/util/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfigModel {
  Locale? locale;
  ThemeData? themeData;


  ConfigModel({String? language, String? theme}) {
    // default language VI
    this.locale = Locale(language ?? Const.LOCALE_EN);
    getTheme(theme);
  }


  void getTheme(String? theme) {
    switch (theme) {
      case (Const.LIGHT_MODE):
        {
          this.themeData = AppTheme.lightTheme;
          break;
        }
      case (Const.NIGHT_MODE):
        {
          this.themeData = AppTheme.darkTheme;
          break;
        }
      default:
        {
          this.themeData = AppTheme.darkTheme;
        }
        break;
    }
  }
}
