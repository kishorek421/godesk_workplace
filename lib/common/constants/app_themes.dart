import 'dart:ui';

import 'package:go_desk_workplace/common/constants/app_colors.dart';

class AppThemes {
  AppThemes._();

  // font family
  static const String fontFamilyOpenSans = "Open Sans";

  // font weights
  static const FontWeight fontRegular = FontWeight.w400;
  static const FontWeight fontSemiBold = FontWeight.w600;
  static const FontWeight fontBold = FontWeight.w700;

  // font sizes
  static const double headerSize = 34;
  static const double secondaryHeaderSize = 24;
  static const double mainContentSize = 18;
  static const double buttonTextSize = 20;

  // text styles
  static  TextStyle labelStyle = TextStyle(
    fontFamily: fontFamilyOpenSans,
    fontSize: 16,
    color: AppColors.gray500Color,
  );

  static TextStyle floatingLabelStyle = TextStyle(
    fontFamily: fontFamilyOpenSans,
    fontWeight: FontWeight.w500,
  );
}
