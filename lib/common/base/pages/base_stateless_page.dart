import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';
import 'package:go_desk_workplace/common/widgets/texts/primary_text.dart';

class BaseStatelessPage extends StatelessWidget {
  final String title;
  final Widget child;
  final Color? headerBgColor;
  final double headerFontSize;
  final FontWeight headerFontWeight;
  final Color? headerFontColor;

  const BaseStatelessPage({
    super.key,
    required this.title,
    required this.child,
    this.headerBgColor = AppColors.primaryColor,
    this.headerFontSize = AppThemes.secondaryHeaderSize,
    this.headerFontWeight = AppThemes.fontSemiBold,
    this.headerFontColor = AppColors.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: PrimaryText(
            title,
            fontSize: headerFontSize,
            fontWeight: headerFontWeight,
            fontColor: headerFontColor,
          ),
          leadingWidth: 35,
          backgroundColor: headerBgColor,
          leading: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                size: 22,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: child,
        ),
      ),
    );
  }
}
