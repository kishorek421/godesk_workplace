import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/constants/app_images.dart';
import 'package:go_desk_workplace/common/constants/storage_constants.dart';
import 'package:go_desk_workplace/controllers/intro/splash_controller.dart';
import 'package:go_desk_workplace/pages/home/base_home_page.dart';
import 'package:go_desk_workplace/pages/intro/intro_page.dart';
import 'package:go_desk_workplace/pages/login/login_page.dart';
import 'package:go_desk_workplace/pages/organization/children/organization_edit_page.dart';

class SplashPage extends GetView<SplashController> {
  SplashPage({super.key}) {
    Get.put(SplashController());
    const ss = FlutterSecureStorage();
    // ss.deleteAll();
    controller.fetchToken().then((token) {
      Timer(const Duration(seconds: 2), () {
        if (token != null) {
          ss.read(key: StorageConstants.isCustomerActive).then((value) {
            if (value == "true") {
              Get.off(() => const BaseHomePage());
            } else {
              ss.read(key: StorageConstants.customerLeadIdKey).then((value) {
                Get.off(
                    () => OrganizationEditProfilePage(isNew: value == null));
              });
            }
          });
        } else {
          ss.read(key: StorageConstants.isIntroClicked).then((value) {
            if (value == null) {
              Get.off(() => const IntroPage());
            } else {
              Get.off(() => const LoginPage());
            }
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: 150,
            height: 150,
            child: Image.asset(
              AppImages.goDeskLogoPng,
              width: 150,
              height: 150,
            ),
          ),
        ),
      ),
    );
  }
}
