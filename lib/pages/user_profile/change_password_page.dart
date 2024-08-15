import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/constants/app_texts.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';
import 'package:go_desk_workplace/common/enums/card_mode_enum.dart';
import 'package:go_desk_workplace/common/texts/primary_text.dart';
import 'package:go_desk_workplace/common/widgets/buttons/primary_button.dart';
import 'package:go_desk_workplace/common/widgets/fields/primary_text_field.dart';
import 'package:go_desk_workplace/pages/user_profile/create_new_password_page.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const PrimaryText(
                      AppTexts.changePassword,
                      fontSize: 24,
                      fontWeight: AppThemes.fontBold,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const PrimaryText(
                      AppTexts.pleaseEnterTheCurrentPassword,
                      fontSize: 18,
                      fontWeight: AppThemes.fontRegular,
                      fontColor: AppColors.textColor,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    PrimaryTextField(
                      obscureText: true.obs,
                      verticalContentPadding: 10,
                      label: AppTexts.enterPassword,
                      editLabelSize: 18,
                      editLabelWeight: AppThemes.fontRegular,
                      cardMode: CardMode.none.obs,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    PrimaryButton(
                      title: AppTexts.setNewPassword,
                      fontColor: AppColors.whiteColor,
                      fontWeight: AppThemes.fontRegular,
                      fontSize: 20,
                      widthFactor: 1,
                      buttonColor: AppColors.primaryColor,
                      onTap: () {
                        Get.to(
                          const CreateNewPasswordPage(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
