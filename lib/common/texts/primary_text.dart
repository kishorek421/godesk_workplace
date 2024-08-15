import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';

class PrimaryText extends StatelessWidget {
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final double textScale;
  final TextAlign textAlign;
  final double lineHeight;
  final double letterSpacing;
  final bool textAllCaps;
  final TextOverflow textOverflow;
  final TextDecoration? textDecoration;

  const PrimaryText(
    this.title, {
    super.key,
    this.fontSize = AppThemes.mainContentSize,
    this.fontWeight = AppThemes.fontRegular,
    this.fontColor = AppColors.black800Color,
    this.textScale = .8,
    this.textAlign = TextAlign.center,
    this.lineHeight = 1.5,
    this.letterSpacing = 0,
    this.textOverflow = TextOverflow.visible,
    this.textAllCaps = false,
    this.textDecoration = TextDecoration.none,
  });

  @override
  Widget build(BuildContext context) {
    return Text(

      textAllCaps ? title.toUpperCase() : title,
      style: TextStyle(
        decoration: textDecoration,
        fontFamily: AppThemes.fontFamilyOpenSans,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: fontColor,
        height: lineHeight,
        letterSpacing: letterSpacing,
      ),
      overflow: textOverflow,
      textAlign: textAlign,
      textScaler: TextScaler.linear(textScale),
    );
  }
}
