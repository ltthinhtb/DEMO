import 'package:bloc_example/theme/color.dart';
import 'package:bloc_example/theme/styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static TextTheme get _lightTextTheme {
    return TextTheme(
        headline1: AppTextStyle.h1,
        headline2: AppTextStyle.h2,
        bodyText1: AppTextStyle.body,
        bodyText2: AppTextStyle.body1,
        headline3: AppTextStyle.bodySmall
        // Using Text Theme with Theme.of(context).textTheme.bodyText2,
        //We using text theme from headline5 because of default color of headline 1-4 not exactly like black or white
        );
  }

  static TextTheme get _darkTextTheme {
    return TextTheme(
        headline1: AppTextStyle.h1,
        headline2: AppTextStyle.h2,
        bodyText1: AppTextStyle.body,
        bodyText2: AppTextStyle.body1,
        headline3: AppTextStyle.bodySmall
        // Using Text Theme with Theme.of(context).textTheme.bodyText2,
        //We using text theme from headline5 because of default color of headline 1-4 not exactly like black or white
        );
  }

  static ThemeData lightTheme = ThemeData.light().copyWith(
    backgroundColor: AppColor.lightBG,
    textTheme: _lightTextTheme,
    canvasColor: AppColor.white,
    primaryColor: AppColor.lightPrimary,
    accentColor: AppColor.lightAccent,
    scaffoldBackgroundColor: AppColor.lightBG,
    iconTheme: IconThemeData(color: AppColor.grey_50),
    sliderTheme: SliderThemeData(
      activeTrackColor: AppColor.greenAccent,
      inactiveTrackColor: AppColor.grey_500,
      trackShape: CustomTrackShape(),
      trackHeight: 2.0,
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
      thumbColor: AppColor.greenAccent,
    ),
    buttonColor: AppColor.grey,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColor.accentBlue),
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
          color: AppColor.lightBG,
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: _darkTextTheme,
    canvasColor: AppColor.black,
    brightness: Brightness.dark,
    backgroundColor: AppColor.black,
    primaryColor: AppColor.black,
    accentColor: AppColor.darkAccent,
    scaffoldBackgroundColor: AppColor.black,
    iconTheme: IconThemeData(color: AppColor.grey_50),
    buttonColor: AppColor.grey,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColor.blue),
    sliderTheme: SliderThemeData(
      activeTrackColor: AppColor.greenAccent,
      inactiveTrackColor: AppColor.grey_500,
      trackShape: CustomTrackShape(),
      trackHeight: 2.0,
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
      thumbColor: AppColor.greenAccent,
    ),
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
          color: AppColor.lightBG,
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double? trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
