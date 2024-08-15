import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/constants/app_images.dart';
import 'package:go_desk_workplace/common/constants/app_texts.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';
import 'package:go_desk_workplace/common/models/organization_device_details_model.dart';
import 'package:go_desk_workplace/common/texts/primary_text.dart';
import 'package:go_desk_workplace/pages/organization/organization_profile_page.dart';

class DeviceOverallDetailPage extends StatelessWidget {
  const DeviceOverallDetailPage({Key? key, required this.device})
      : super(key: key);
  final Device device;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              size: 20,
            ),
          ),
          title: const PrimaryText(
            AppTexts.deviceDetails,
            fontSize: 25,
            fontWeight: AppThemes.fontBold,
          ),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                Get.to(
                  () => OrganizationPage(
                      // moveCallback: () {},
                      // saveBtnCallback: (
                      //     {required canGoNext, required visibility}) {},
                      // showToastCallback: ({required msg}) {},
                      // isUpdate: true,
                      // isNextDetailsFilled: true,
                      ),
                );
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: AppColors.gray500Color.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text("P"),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const PrimaryText(
                  AppTexts.deviceType,
                  fontWeight: AppThemes.fontSemiBold,
                  fontSize: 20,
                ),
                Text(
                  '${device.type}',
                  style: const TextStyle(
                    fontWeight: AppThemes.fontRegular,
                    color: AppColors.textColor,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const PrimaryText(
                  AppTexts.brand,
                  fontWeight: AppThemes.fontSemiBold,
                  fontSize: 20,
                ),
                Text(
                  '${device.brand}',
                  style: const TextStyle(
                    fontWeight: AppThemes.fontRegular,
                    color: AppColors.textColor,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const PrimaryText(
                  AppTexts.model,
                  fontWeight: AppThemes.fontSemiBold,
                  fontSize: 20,
                ),
                Text(
                  '${device.model}',
                  style: const TextStyle(
                    fontWeight: AppThemes.fontRegular,
                    color: AppColors.textColor,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const PrimaryText(
                  AppTexts.serialNo,
                  fontWeight: AppThemes.fontSemiBold,
                  fontSize: 20,
                ),
                Text(
                  '${device.serialNo}',
                  style: const TextStyle(
                    fontWeight: AppThemes.fontRegular,
                    color: AppColors.textColor,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const PrimaryText(
                  AppTexts.uniqueIdNo,
                  fontWeight: AppThemes.fontSemiBold,
                  fontSize: 20,
                ),
                // Text(
                //   '${device.uniqueIdNo}',
                //   style: const TextStyle(
                //     fontWeight: AppThemes.fontRegular,
                //     color: AppColors.textColor,
                //     fontSize: 18,
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                const PrimaryText(
                  AppTexts.warranty,
                  fontWeight: AppThemes.fontSemiBold,
                  fontSize: 20,
                ),
                // Text(
                //   '${device.warranty}',
                //   style: const TextStyle(
                //     fontWeight: AppThemes.fontRegular,
                //     color: AppColors.textColor,
                //     fontSize: 18,
                //   ),
                // ),
                SizedBox(
                  height: 15,
                ),
                PrimaryText(
                  AppTexts.deviceVisual,
                  fontWeight: AppThemes.fontSemiBold,
                  fontSize: 20,
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 0.8,
                            color: AppColors.black800Color.withOpacity(0.4),
                          ),
                        ),
                        child: Image.asset(
                          AppImages.boardDummyImage,
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 0.8,
                            color: AppColors.black800Color.withOpacity(0.4),
                          ),
                        ),
                        child: Image.asset(
                          AppImages.boardDummyImage,
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 0.8,
                            color: AppColors.black800Color.withOpacity(0.4),
                          ),
                        ),
                        child: Image.asset(
                          AppImages.boardDummyImage,
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
