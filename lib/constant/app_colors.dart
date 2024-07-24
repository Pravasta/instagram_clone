import 'package:flutter/material.dart';

class AppColors {
  // DARK
  static const Color primaryDark = Color(0xff000000);
  static const Color blackColor = Color(0xff121212);
  static const Color blueDark = Color(0xff3085d3);
  static const Color inActiveBlue = Color(0xff1b4b77);
  static const Color greyDarkColor = Color(0xff5b5b5b);
  static const Color greyDarkColorLight = Color(0xff262626);

  // LIGHT
  static const Color blueColor = Color(0xff3797ef);
  static const Color blueLightColor = Color(0xff9bcbf7);
  static const Color whiteColor = Color(0xfff9f9f9);
  static const Color redColor = Color(0xffed4956);
  static const Color greyColor = Color(0xff999999);
  static const Color greyLightColor = Color(0xffeaeaeb);

  // COLOR INSTAGRAM
  static const instagramColor = LinearGradient(
    tileMode: TileMode.decal,
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Color(0xfffcca5d),
      Color(0xfffcca5d),
      Color(0xfffcca5d),
      Color(0xfff1403e),
      Color(0xffc408ba),
      Color(0xffc408ba),
      Color(0xffc408ba),
    ],
  );
}
