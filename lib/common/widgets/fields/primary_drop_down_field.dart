import 'package:flutter/material.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';
import 'package:go_desk_workplace/common/texts/primary_text.dart';

class PrimaryDropDownField extends StatelessWidget {
  final void Function(String?)? onChanged;
  final List<String> items;
  final List<String>? options;
  final Alignment alignment;
  final Color? dropdownColor;
  final Text? hint;
  final String? value;
  final TextStyle? style;
  final Icon? icon;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final VoidCallback? onTap;
  final bool? isDense;
  final FormFieldValidator? validator;

  //final String hintText;
  final TextStyle? hintStyle;
  final Color? fillColor;

  const PrimaryDropDownField(
      {required this.onChanged,
      this.items = const [],
      this.alignment = Alignment.centerLeft,
      this.dropdownColor,
      this.hint,
      this.options,
      this.style,
      this.value,
      this.icon,
      this.iconEnabledColor,
      this.validator,
      this.iconDisabledColor,
      this.onTap,
      //required this.hintText,
      this.hintStyle,
      this.fillColor,
      this.isDense = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      onTap: onTap,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      iconDisabledColor: iconDisabledColor,
      iconEnabledColor: iconEnabledColor,
      value: value,
      icon: icon,
      style: style,
      hint: hint,
      validator: validator,
      borderRadius: BorderRadius.circular(8),
      dropdownColor: dropdownColor,
      alignment: alignment,
      items: options?.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: PrimaryText(
            fontWeight: AppThemes.fontRegular,
            (value),
            fontColor: AppColors.black800Color,
            fontSize: 18,
          ),
        );
      }).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        isDense: isDense,
        filled: true,
        fillColor: fillColor,
        // hintText: hintText,
        // hintStyle: hintStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.gray200Color,
          ),
        ),
      ),
    );
  }
}
