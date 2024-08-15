import 'package:flutter/material.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';

Widget bottomSheetHeadDivider({
  Alignment alignment = Alignment.center,
  required double headerLineWidth,
}) {
  return Align(
    alignment: alignment,
    child: Container(
      height: 6,
      width: headerLineWidth,
      margin: const EdgeInsets.only(
        top: 20.0,
      ),
      decoration: const BoxDecoration(
        color: AppColors.gray200Color,
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
    ),
  );
}
