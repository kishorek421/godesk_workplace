import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/constants/app_texts.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';
import 'package:go_desk_workplace/common/enums/card_mode_enum.dart';
import 'package:go_desk_workplace/common/texts/primary_text.dart';
import 'package:go_desk_workplace/common/widgets/buttons/primary_button.dart';
import 'package:go_desk_workplace/common/widgets/fields/primary_text_field.dart';
import 'package:go_desk_workplace/pages/user_profile/password_created_sucessful_page.dart';

class CreateNewPasswordPage extends StatelessWidget {
  const CreateNewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const PrimaryText(
                    AppTexts.createNewPassword,
                    fontSize: 24,
                    fontWeight: AppThemes.fontBold,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const PrimaryText(
                    AppTexts.yourNewPasswordMustBeDifferent,
                    fontSize: 18,
                    fontWeight: AppThemes.fontRegular,
                    fontColor: AppColors.textColor,
                    textOverflow: TextOverflow.clip,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  PrimaryTextField(
                    obscureText: true.obs,
                    labelFontSize: 15,
                    verticalContentPadding: 10,
                    label: AppTexts.enterNewPassword,
                    editLabelWeight: AppThemes.fontRegular,
                    cardMode: CardMode.none.obs,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  PrimaryTextField(
                    obscureText: true.obs,
                    verticalContentPadding: 10,
                    label: AppTexts.enterConfirmPassword,
                    labelFontSize: 15,
                    editLabelWeight: AppThemes.fontRegular,
                    cardMode: CardMode.none.obs,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  PrimaryButton(
                    title: AppTexts.save,
                    fontColor: AppColors.whiteColor,
                    fontWeight: AppThemes.fontRegular,
                    fontSize: 20,
                    widthFactor: 1,
                    buttonColor: AppColors.primaryColor,
                    onTap: () {
                      Get.to(
                       const  PasswordCreatedSuccessfulPage(),
                      );
                    },
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
