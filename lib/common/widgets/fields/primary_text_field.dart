import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';
import 'package:go_desk_workplace/common/enums/card_mode_enum.dart';
import 'package:go_desk_workplace/common/texts/primary_text.dart';
import 'package:go_desk_workplace/common/utils/typedefs.dart';

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(text: newValue.text.toUpperCase());
  }
}

class PrimaryTextField extends StatelessWidget {
  final String label;
  final TextAlign textAlignment;
  final FormFieldValidator<String>? validator;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final OnSaved? onSaved;
  final Rx<CardMode> cardMode;
  final int? maxLength;
  final FocusNode? focusNode;
  final double? editTextSize;
  final FontWeight? editTextWeight;
  final double? editLabelSize;
  final FontWeight? editLabelWeight;
  final bool isRequired;
  final double borderRadius;
  final bool isResponsive;
  final ValueChanged<String>? onChanged;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final Color fillColor;
  final Color enabledUnderlineBorderColor;
  final bool showCounterText;
  final double verticalContentPadding;
  final double? disabledHeight;
  final int maxLines;
  final double? labelFontSize;
  final FontWeight? labelFontWeight;
  final Color? labelColor;
  final ValueChanged<String>? onFieldSubmitted;
  final Color? editLabelColor;
  final RxBool obscureText;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool? isDense;

  const PrimaryTextField({
    super.key,
    required this.label,
    required this.cardMode,
    this.textAlignment = TextAlign.start,
    this.validator,
    required this.obscureText ,
    this.textInputType = TextInputType.text,
    this.controller,
    this.keyboardType,
    this.onSaved,
    this.maxLength,
    this.focusNode,
    this.editTextSize,
    this.editTextWeight,
    this.onChanged,
    this.editLabelSize,
    this.editLabelWeight,
    this.isRequired = false,
    this.borderRadius = 10,
    this.isResponsive = false,
    this.textCapitalization = TextCapitalization.words,
    this.inputFormatters,
    this.suffix,
    this.fillColor = AppColors.gray200Color,
    this.enabledUnderlineBorderColor = Colors.transparent,
    this.showCounterText = false,
    required this.verticalContentPadding,
    this.disabledHeight,
    this.maxLines = 1,
    this.onFieldSubmitted,
    this.labelFontSize,
    this.labelFontWeight,
    this.labelColor,
    this.editLabelColor,
    this.hintStyle,
    this.hintText,
    this.isDense,
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
              fontWeight: editLabelWeight,
              fontSize: editLabelSize,
              fontColor: editLabelColor,
            ),
          )
              : const Center(),
          SizedBox(
            height:
            cardMode.value == CardMode.edit ? disabledHeight ?? 40 : null,
            child: TextFormField(
              maxLines: maxLines,
              // enableInteractiveSelection: false,
              inputFormatters: inputFormatters,
              onFieldSubmitted: onFieldSubmitted,
              textCapitalization: textCapitalization,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              focusNode: focusNode,
              maxLength: maxLength,
              onSaved: onSaved,
              validator: validator,
              onChanged: onChanged,
              controller: controller,
              obscureText: obscureText.value,
              keyboardType: textInputType,
              enabled: cardMode.value == CardMode.edit ? false : true,
              textAlign: cardMode.value == CardMode.edit
                  ? textAlignment
                  : TextAlign.start,
              style: cardMode.value == CardMode.edit
                  ? TextStyle(
                color: AppColors.textColor,
                fontFamily: AppThemes.fontFamilyOpenSans,
                fontWeight: editTextWeight,
                fontSize: editTextSize,
              )
                  : TextStyle(
                fontFamily: AppThemes.fontFamilyOpenSans,
                fontWeight: editTextWeight,
                fontSize: editTextSize,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                errorStyle: const TextStyle(
                  height: 0.5,
                  fontSize: 14,
                  color: AppColors.errorColor,
                ),
                counterText: '',
                suffixIcon: suffix,
                contentPadding: cardMode.value == CardMode.edit
                    ? EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: verticalContentPadding,
                )
                    : null,
                isDense: isDense,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: TextStyle(
                  fontWeight: labelFontWeight,
                  fontFamily: AppThemes.fontFamilyOpenSans,
                  fontSize: labelFontSize,
                  color: labelColor,
                ),
                label: cardMode.value == CardMode.edit
                    ? null
                    : RichText(
                  text: TextSpan(
                    text: label,
                    style: TextStyle(
                      fontWeight: labelFontWeight,
                      fontFamily: AppThemes.fontFamilyOpenSans,
                      fontSize: labelFontSize,
                      color: labelColor,
                    ),
                    children: [
                      TextSpan(
                        text: isRequired ? ' *' : "",
                        style: const TextStyle(
                          // color: Colors.red,
                          color: AppColors.errorColor,
                        ),
                      ),
                    ],
                  ),
                ),
                fillColor:
                cardMode.value == CardMode.edit ? Colors.white : fillColor,
                disabledBorder: InputBorder.none,
                floatingLabelStyle: TextStyle(
                  fontWeight: labelFontWeight,
                  fontFamily: AppThemes.fontFamilyOpenSans,
                  fontSize: labelFontSize,
                  color: labelColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: const Color.fromRGBO(0, 156, 104, 1).withAlpha(175),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                filled: false,
              ),
            ),
          ),
        ],
      );
    });
  }
}

