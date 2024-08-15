import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';
import 'app_colors.dart';

TextStyle openSans({
  double fontSize = 15,
  FontWeight fontWeight = AppThemes.fontRegular,
  Color color = AppColors.textColor,
  TextDecoration decoration = TextDecoration.none,
}) {
  return TextStyle(
    fontFamily: 'OpenSans', // Use the family name defined in pubspec.yaml
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    decoration: decoration,
  );
}