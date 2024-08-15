import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';
import 'package:go_desk_workplace/common/texts/primary_text.dart';
import 'package:go_desk_workplace/common/widgets/buttons/primary_button.dart';
import 'package:permission_handler/permission_handler.dart';

void showPermissionAlertDialog({
  String title = "Need Permission",
  required String requestMsg,
  bool barrierDismissible = true,
}) {
  Get.defaultDialog(
    title: title,
    middleText: "",
    backgroundColor: Colors.white,
    contentPadding: const EdgeInsets.only(top: 30, bottom: 30.0),
    radius: 10,
    barrierDismissible: barrierDismissible,
    titlePadding: const EdgeInsets.only(top: 15),
    titleStyle: const TextStyle(
      color: AppColors.gray600Color,
      fontFamily: AppThemes.fontFamilyOpenSans,
      fontSize:18,
      fontWeight: FontWeight.w600,
    ),
    /*cancel: PrimaryButton(
                              title: "DISMISS",
                              onPressed: () {},
                              textSize: AppSizes.font_13,
                              bgColor: AppColors.grey500Color,
                            ),*/
    confirm: PrimaryButton(
      title: "GO TO SETTINGS",
      onTap: () {
        openAppSettings();
        Get.back();
      },
      fontSize: 13,
    ),
    content: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: PrimaryText(
        requestMsg,
        textAlign: TextAlign.center,
        fontColor: AppColors.gray600Color,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
