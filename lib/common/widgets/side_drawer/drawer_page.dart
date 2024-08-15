import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/constants/app_icons.dart';
import 'package:go_desk_workplace/common/constants/app_images.dart';
import 'package:go_desk_workplace/common/constants/app_texts.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';
import 'package:go_desk_workplace/common/constants/storage_constants.dart';
import 'package:go_desk_workplace/common/texts/primary_text.dart';
import 'package:go_desk_workplace/pages/login/login_page.dart';
import 'package:go_desk_workplace/pages/side_drawer/help_support_page.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.whiteColor,
      elevation: 0.3,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 150,
              child: Stack(
                children: [
                  SvgPicture.asset(
                    AppImages.sideBarRectangle,
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                  Center(
                    child: SvgPicture.asset(
                      AppImages.goDeskLogo,
                      width: double.infinity,
                      height: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(AppIcons.privacyPolicyIcon),
              title: const Align(
                alignment: Alignment.centerLeft,
                child: PrimaryText(
                  AppTexts.privacyPolicy,
                  fontWeight: AppThemes.fontRegular,
                  fontSize: 18,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: SvgPicture.asset(AppIcons.helpAndSupportIcon),
              title: const Align(
                alignment: Alignment.centerLeft,
                child: PrimaryText(
                  AppTexts.helpAndSupport,
                  fontWeight: AppThemes.fontRegular,
                  fontSize: 18,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
              onTap: () {
                Get.to(
                  const HelpAndSupport(),
                );
              },
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: SvgPicture.asset(AppIcons.referFriendIcon),
                title: const Align(
                  alignment: Alignment.centerLeft,
                  child: PrimaryText(
                    AppTexts.referFriend,
                    fontWeight: AppThemes.fontRegular,
                    fontSize: 18,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            // Use Expanded to push the logout button to the bottom
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: InkWell(
                  onTap: () async {
                    var ss = const FlutterSecureStorage();
                    // don't delete isIntroClicked to redirect to login page
                    await ss.delete(key: StorageConstants.jwtToken);
                    await ss.delete(key: StorageConstants.refreshToken);
                    await ss.delete(key: StorageConstants.isCustomerActive);
                    await ss.delete(key: StorageConstants.customerLeadIdKey);
                    Get.off(() => const LoginPage());
                  },
                  child: ListTile(
                    leading: SvgPicture.asset(
                      AppIcons.logoutIcon,
                      width: 20,
                      height: 20,
                    ),
                    title: const PrimaryText(
                      AppTexts.logout,
                      fontSize: 18,
                      fontColor: AppColors.errorColor,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
