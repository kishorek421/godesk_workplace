import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/constants/app_images.dart';
import 'package:go_desk_workplace/common/constants/app_texts.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';
import 'package:go_desk_workplace/common/texts/primary_text.dart';
import 'package:go_desk_workplace/common/widgets/buttons/primary_button.dart';

class PasswordCreatedSuccessfulPage extends StatelessWidget {
  const PasswordCreatedSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 150,
              ),
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  AppImages.passwordImage,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Align(
                alignment: Alignment.center,
                child: PrimaryText(
                  AppTexts.yourPasswordHasBeenReset,
                  fontWeight: AppThemes.fontSemiBold,
                  fontSize: 20,
                  fontColor: AppColors.gray600Color,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.center,
                child: PrimaryText(
                  AppTexts.successfully,
                  fontWeight: AppThemes.fontBold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.center,
                child: PrimaryButton(
                  title: AppTexts.continueText,
                  fontColor: AppColors.whiteColor,
                  fontWeight: AppThemes.fontRegular,
                  fontSize: 20,
                  widthFactor: 0.7,
                  buttonColor: AppColors.primaryColor,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
