import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';
import 'package:go_desk_workplace/common/enums/card_mode_enum.dart';
import 'package:go_desk_workplace/common/texts/primary_text.dart';

class PrimaryDropDownButton extends StatelessWidget {
  final ValueChanged<dynamic>? onChanged;
  final List<DropdownMenuItem<dynamic>> items;
  final Alignment alignment;
  final Color? dropdownColor;
  final Widget? hint;
  final TextStyle? style;
  final Icon? icon;
  final EdgeInsetsGeometry? padding;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final VoidCallback? onTap;
  final Rx<CardMode> cardMode;
  final String? hintTextEdit;
  final String? hintTextView;
  final double borderRadius;
  final bool? isDense;
  final TextAlign textAlignment;
  final double? editLabelSize;
  final FontWeight? editLabelWeight;
  final Color? editLabelColor;
  final String label;
  final double? disabledHeight;
  final double? viewLabelSize;
  final FontWeight? viewLabelWeight;
  final Color? viewLabelColor;

  const PrimaryDropDownButton({
    required this.onChanged,
    this.textAlignment = TextAlign.start,
    required this.items,
    this.alignment = Alignment.centerLeft,
    this.dropdownColor,
    this.hint,
    this.style,
    this.icon,
    this.hintTextEdit,
    this.hintTextView,
    this.padding,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.onTap,
    required this.cardMode,
    this.borderRadius = 10,
    this.isDense = false,
    this.editLabelSize,
    this.editLabelColor,
    this.editLabelWeight,
    required this.label,
    this.disabledHeight,
    this.viewLabelSize,
    this.viewLabelColor,
    this.viewLabelWeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: textAlignment == TextAlign.center
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          cardMode.value == CardMode.edit
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: PrimaryText(
                    label,
                    fontWeight: viewLabelWeight,
                    fontSize: viewLabelSize,
                    fontColor: viewLabelColor,
                  ),
                )
              : const Center(),
          SizedBox(
            height:
                cardMode.value == CardMode.edit ? disabledHeight ?? 40 : null,
            child: DropdownButtonFormField(
              onTap: onTap,
              iconDisabledColor: iconDisabledColor,
              iconEnabledColor: iconEnabledColor,
              padding: padding,
              icon: cardMode.value == CardMode.edit
                  ? null
                  : const Icon(
                      Icons.arrow_drop_down,
                      color: AppColors.textColor,
                    ),
              style: style,
              hint: cardMode.value == CardMode.edit
                  ? null
                  : PrimaryText(
                      label,
                      fontWeight: editLabelWeight,
                      fontSize: editLabelSize,
                      fontColor: editLabelColor,
                    ),
              borderRadius: BorderRadius.circular(borderRadius),
              dropdownColor: dropdownColor,
              alignment: alignment,
              items: items,
              onChanged: cardMode.value == CardMode.save ? onChanged : null,
              decoration: InputDecoration(
                isDense: isDense,
                border: cardMode.value == CardMode.edit
                    ? InputBorder.none
                    : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                focusedBorder: cardMode.value == CardMode.edit
                    ? InputBorder.none
                    : OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 2,
                          color: AppColors.primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                enabledBorder: cardMode.value == CardMode.edit
                    ? InputBorder.none
                    : OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.gray500Color.withOpacity(0.40),
                        ),
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                labelText: cardMode.value == CardMode.edit
                    ? hintTextEdit
                    : hintTextView,
                labelStyle: cardMode.value == CardMode.edit
                    ? null
                    : TextStyle(
                        fontWeight: AppThemes.fontRegular,
                        fontSize: 16,
                        color: AppColors.black800Color.withOpacity(0.6),
                      ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
