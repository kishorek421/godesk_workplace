import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';
import 'package:go_desk_workplace/common/enums/padding_type_enum.dart';
import 'package:go_desk_workplace/common/texts/primary_text.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final double borderRadius;
  final double innerPadding;
  final double innerVerticalPadding;
  final double innerHorizontalPadding;
  final PaddingType innerPaddingType;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final TextAlign textAlign;
  final double textScale;
  final VoidCallback? onTap;
  final Widget? trailingIcon;
  final double widthFactor;
  final Color? buttonColor;
  final BorderSide? borderSide;
  List<BoxShadow>? boxShadow;
  final double? elevation;

  PrimaryButton({
    super.key,
    required this.title,
    this.borderRadius = 10,
    this.innerPaddingType = PaddingType.symmetric,
    this.innerPadding = 10,
    this.innerHorizontalPadding = 15,
    this.innerVerticalPadding = 10,
    this.fontSize = AppThemes.buttonTextSize,
    this.fontWeight = AppThemes.fontSemiBold,
    this.fontColor = AppColors.textColor,
    this.textAlign = TextAlign.center,
    this.textScale = .8,
    this.onTap,
    this.trailingIcon,
    this.widthFactor = .5,
    this.buttonColor = AppColors.primaryColor,
    this.borderSide = BorderSide.none,
    this.boxShadow,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: FractionallySizedBox(
        widthFactor: widthFactor,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: boxShadow,
          ),
          child: Card(
            elevation: elevation,
            color: buttonColor,
            shape: RoundedRectangleBorder(
              side: borderSide ?? BorderSide.none,
              borderRadius: BorderRadius.circular(
                borderRadius,
              ),
            ),
            child: Padding(
              padding: innerPaddingType == PaddingType.all
                  ? EdgeInsets.all(innerPadding)
                  : EdgeInsets.symmetric(
                      vertical: innerVerticalPadding,
                      horizontal: innerHorizontalPadding,
                    ),
              child: Row(
                children: [
                  Expanded(
                    child: PrimaryText(
                      title,
                      fontColor: fontColor,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                      textAlign: textAlign,
                      textScale: textScale,
                    ),
                  ),
                  SizedBox(
                    child: trailingIcon ?? const Center(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
