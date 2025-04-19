import 'package:flutter/material.dart';
import 'package:task_app_flutter/utility/color_constants.dart';

class CustomFonts {
  // Font sizes
  static const double mini = 10.0;
  static const double small = 12.0;
  static const double medium = 14.0;
  static const double large = 16.0;
  static const double xlarge = 18.0;
  static const double xxlarge = 30.0;

  // Text styles with dynamic colors
  static TextStyle heading({Color? color}) => TextStyle(
        fontSize: xxlarge,
        fontWeight: FontWeight.bold,
        fontFamily: 'Raleway',
        letterSpacing: 3,
        color: color ?? Appcolors.white,
      );

  static TextStyle subheading({Color? color}) => TextStyle(
        fontSize: large,
        letterSpacing: 0.25,
        fontFamily: 'Poppins',
        color: color ?? Appcolors.white,
      );

  static TextStyle body({Color? color}) => TextStyle(
        fontSize: medium,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.15,
        fontFamily: 'Poppins',
        color: color,
      );

  static TextStyle caption({Color? color}) => TextStyle(
        fontSize: small,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.1,
        fontFamily: 'Poppins',
        color: color,
      );

  static TextStyle button({Color? color}) => TextStyle(
        fontSize: medium,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.25,
        fontFamily: 'Poppins',
        color: color,
      );

  static TextStyle minitext({Color? color}) => TextStyle(
        fontSize: mini,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.1,
        fontFamily: 'Poppins',
        color: color,
      );
}
