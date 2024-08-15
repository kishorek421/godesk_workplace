import 'package:flutter/material.dart';
import 'package:go_desk_workplace/common/utils/helpers.dart';

class AppColors {
  AppColors._();

  static const Color primaryColor = Color(0xff009C68);
  static const Color secondaryColor = Color(0xff999999);
  static const Color whiteColor = Color(0xffffffff);
  static const Color cardColor = Color(0xffD6F8EC);
  static const Color textColor = Color(0xff999999);
  static const Color blueColor = Color(0xff4154FE);
  static const Color accentColor = Color(0xffFFD8BE);
  static const Color gray100Color = Color(0xffececec);
  static const Color gray200Color = Color(0xffefefef);
  static const Color gray500Color = Color(0xffA9A9A9);
  static const Color gray600Color = Color(0xffa7a7a7);
  static const Color black800Color = Color(0xff0f0606);
  static const Color errorColor = Color(0xFFD50000);

  static MaterialColor primaryMaterialColor = getSwatch(primaryColor);
}
