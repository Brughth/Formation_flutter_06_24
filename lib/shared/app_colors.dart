import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primary = Color(0xff76C893);
  static const Color primaryGreen50 = Color(0xffF0FDF4);
  static const Color grayCharcoal = Color(0xff5E5E5E);

  static const Color scaffoldBackground = Color(0xffF1FFF6);

  static const Color gray600 = Color(0xff4B5563);
  static const Color gray500 = Color(0xff6B7280);
  static const Color gray400 = Color(0xff9CA3AF);
  static const Color gray300 = Color(0xffD1D5DB);
  static const Color gray200 = Color(0xffE5E7EB);
  static const Color gray100 = Color(0xffF3F4F6);
  static const Color gray50 = Color(0xffF9FAFB);
  static const Color borderColor = Color(0xffD9D9D9);
  static const Color divider = Color(0xffC0C9C3);

  static const Color white = Color(0xffFFFFFF);
  static const Color blackGray = Color(0xff333333);
  static const Color black = Color(0xff000000);
  static const Color gray = Color(0xffD5D5D5);
  static const Color border = Color(0xffAAAAAA);

  static const Color surfaceWhite = Color(0xFFFFFBFA);
  static const Color red2 = Color(0xffCB5959);
  static const Color red = Color(0xffB91C1C);
  static const Color yellow = Color(0xffFFA500);
  static const Color green600 = Color(0xff16A34A);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);

  static const ColorScheme colorScheme = ColorScheme(
    primary: AppColors.primary,
    secondary: AppColors.primary,
    surface: surfaceWhite,
    background: white,
    error: red,
    onPrimary: black,
    onSecondary: black,
    onSurface: black,
    onBackground: black,
    onError: white,
    brightness: Brightness.light,
  );
}
