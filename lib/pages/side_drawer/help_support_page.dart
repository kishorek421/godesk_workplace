import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/constants/app_icons.dart';
import 'package:go_desk_workplace/common/constants/app_images.dart';
import 'package:go_desk_workplace/common/constants/app_texts.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';
import 'package:go_desk_workplace/common/texts/primary_text.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 25,
                      ),
                    ),
                    const Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: PrimaryText(
                          AppTexts.helpAndSupport,
                          fontSize: 25,
                          fontWeight: AppThemes.fontBold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    AppImages.helpAndSupportImage,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      AppIcons.phoneIcon,
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const PrimaryText(
                      AppTexts.callUs,
                      fontSize: 20,
                      fontWeight: AppThemes.fontRegular,
                    ),
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: PrimaryText(
                          "9784356378",
                          fontWeight: AppThemes.fontRegular,
                          fontColor: AppColors.textColor,
                          fontSize: 20,
                          textOverflow: TextOverflow.clip,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      AppIcons.emailIcon,
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const PrimaryText(
                      AppTexts.mailUs,
                      fontSize: 20,
                      fontWeight: AppThemes.fontRegular,
                    ),
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: PrimaryText(
                          "support.coworks@gmail.com",
                          fontWeight: AppThemes.fontRegular,
                          fontColor: AppColors.textColor,
                          fontSize: 20,
                          textOverflow: TextOverflow.clip,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                const PrimaryText(
                  AppTexts.faqs,
                  fontSize: 25,
                  fontWeight: AppThemes.fontSemiBold,
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {},
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryText(
                        "How do I raise a new ticket?",
                        fontSize: 20,
                        fontWeight: AppThemes.fontRegular,
                        textOverflow: TextOverflow.clip,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {},
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryText(
                        "How do I cancel a ticket request?",
                        fontSize: 20,
                        fontWeight: AppThemes.fontRegular,
                        textOverflow: TextOverflow.clip,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {},
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryText(
                        "How is my data protected?",
                        fontSize: 20,
                        fontWeight: AppThemes.fontRegular,
                        textOverflow: TextOverflow.clip,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
