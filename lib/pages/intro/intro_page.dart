import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/constants/app_images.dart';
import 'package:go_desk_workplace/common/constants/app_texts.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';
import 'package:go_desk_workplace/common/constants/storage_constants.dart';
import 'package:go_desk_workplace/common/texts/primary_text.dart';
import 'package:go_desk_workplace/common/widgets/buttons/primary_button.dart';
import 'package:go_desk_workplace/pages/login/login_page.dart';

class IntroPage extends GetView {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                AppImages.bgTemplate,
              ),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: Center(
                      child: SvgPicture.asset(
                        AppImages.introBg,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const PrimaryText(
                    AppTexts.introTitle,
                    fontSize: 30,
                    fontWeight: AppThemes.fontBold,
                    lineHeight: 1.5,
                    textOverflow: TextOverflow.clip,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const PrimaryText(
                    "Say goodbye to hassle and hello to convenience with our vast network",
                    fontSize: 20,
                    fontWeight: AppThemes.fontSemiBold,
                    fontColor: AppColors.textColor,
                    letterSpacing: .1,
                    textOverflow: TextOverflow.clip,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: PrimaryButton(
                      widthFactor: 0.75,
                      innerVerticalPadding: 20,
                      title: AppTexts.getStarted,
                      fontColor: AppColors.whiteColor,
                      onTap: () async {
                        await const FlutterSecureStorage().write(
                            key: StorageConstants.isCustomerActive,
                            value: "logged");
                        Get.off(() => const LoginPage());
                      },
                      trailingIcon: const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
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
