import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/constants/app_icons.dart';
import 'package:go_desk_workplace/common/constants/app_texts.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';
import 'package:go_desk_workplace/common/texts/primary_text.dart';
import 'package:go_desk_workplace/pages/organization/organization_profile_page.dart';
import 'package:go_desk_workplace/pages/user_profile/change_password_page.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          AppTexts.profile,
                          fontSize: 25,
                          fontWeight: AppThemes.fontBold,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor.withOpacity(0.35),
                      borderRadius: const BorderRadius.all(Radius.circular(70)),
                      border: Border.all(
                        color: Colors.red,
                      ),
                    ),
                    child: const Center(
                      child: PrimaryText("P"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: PrimaryText(
                    "User Name",
                    fontWeight: AppThemes.fontSemiBold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      AppIcons.emailIcon,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const PrimaryText(
                      AppTexts.email,
                      fontSize: 20,
                      fontWeight: AppThemes.fontRegular,
                    ),
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: PrimaryText(
                          "robert@gmail.com",
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
                      AppIcons.phoneIcon,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const PrimaryText(
                      AppTexts.phoneNumber,
                      fontSize: 20,
                      fontWeight: AppThemes.fontRegular,
                    ),
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: PrimaryText(
                          "9877645367",
                          fontWeight: AppThemes.fontRegular,
                          fontColor: AppColors.textColor,
                          fontSize: 20,
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
                      AppIcons.phoneIcon,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const PrimaryText(
                      AppTexts.secondaryNumber,
                      fontSize: 20,
                      fontWeight: AppThemes.fontRegular,
                    ),
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: PrimaryText(
                          "8764563778",
                          fontWeight: AppThemes.fontRegular,
                          fontColor: AppColors.textColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                InkWell(
                  onTap: () {
                    Get.to(
                      () => const OrganizationPage(),
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppIcons.viewOrganizationIcon,
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const PrimaryText(
                        AppTexts.viewOrganization,
                        fontSize: 20,
                        fontWeight: AppThemes.fontRegular,
                      ),
                      const Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Get.to(
                      ChangePasswordPage(),
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppIcons.changePasswordIcon,
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const PrimaryText(
                        AppTexts.changePassword,
                        fontSize: 20,
                        fontWeight: AppThemes.fontRegular,
                      ),
                      const Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.arrow_forward_ios,
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
