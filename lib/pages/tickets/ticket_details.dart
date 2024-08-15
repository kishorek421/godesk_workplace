import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/constants/app_images.dart';
import 'package:go_desk_workplace/common/constants/app_texts.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';
import 'package:go_desk_workplace/common/texts/primary_text.dart';
import 'package:go_desk_workplace/common/widgets/divider/divider.dart';
import 'package:go_desk_workplace/pages/organization/organization_profile_page.dart';

class SubmittedTicketDetailsPage extends StatelessWidget {
  const SubmittedTicketDetailsPage({super.key});

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
            AppTexts.ticketDetails,
            fontSize: 25,
            fontWeight: AppThemes.fontBold,
          ),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                Get.to(
                  () => const OrganizationPage(),
                );
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: AppColors.gray500Color.withOpacity(0.35),
                    borderRadius: BorderRadius.circular(20)),
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
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                const PrimaryText(
                  AppTexts.generalDetails,
                  fontWeight: AppThemes.fontBold,
                  fontSize: 20,
                ),
                const SizedBox(
                  height: 15,
                ),
                const PrimaryDivider(
                  height: 2,
                  color: AppColors.gray500Color,
                  thickness: 0.9,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const PrimaryText(
                      AppTexts.statusSemicolon,
                      fontSize: 18,
                      fontWeight: AppThemes.fontSemiBold,
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xffE1ECFD),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PrimaryText(
                            AppTexts.raised,
                            fontSize: 18,
                            fontWeight: AppThemes.fontRegular,
                            fontColor: AppColors.blueColor,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PrimaryText(
                      AppTexts.raisedDateSemicolon,
                      fontSize: 18,
                      fontWeight: AppThemes.fontSemiBold,
                    ),
                    PrimaryText(
                      "22/05/2024",
                      fontSize: 18,
                      fontWeight: AppThemes.fontRegular,
                      fontColor: AppColors.textColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PrimaryText(
                      AppTexts.ticketIdSemicolon,
                      fontSize: 18,
                      fontWeight: AppThemes.fontSemiBold,
                    ),
                    PrimaryText(
                      "DGC14162R4",
                      fontSize: 18,
                      fontWeight: AppThemes.fontRegular,
                      fontColor: AppColors.textColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const PrimaryDivider(
                  height: 2,
                  color: AppColors.gray500Color,
                  thickness: 0.9,
                ),
                const SizedBox(
                  height: 20,
                ),
                const PrimaryText(
                  AppTexts.issueDetails,
                  fontSize: 20,
                  fontWeight: AppThemes.fontBold,
                ),
                const SizedBox(
                  height: 20,
                ),
                const PrimaryText(
                  AppTexts.issueDevice,
                  fontSize: 20,
                  fontWeight: AppThemes.fontSemiBold,
                ),
                const SizedBox(
                  height: 3,
                ),
                const PrimaryText(
                  "72527252926276",
                  fontSize: 18,
                  fontWeight: AppThemes.fontRegular,
                  fontColor: AppColors.textColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                const PrimaryText(
                  AppTexts.issueType,
                  fontSize: 20,
                  fontWeight: AppThemes.fontSemiBold,
                ),
                const SizedBox(
                  height: 3,
                ),
                const PrimaryText(
                  "Display",
                  fontSize: 18,
                  fontWeight: AppThemes.fontRegular,
                  fontColor: AppColors.textColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                const PrimaryText(
                  AppTexts.issueSubType,
                  fontSize: 20,
                  fontWeight: AppThemes.fontSemiBold,
                ),
                const SizedBox(
                  height: 3,
                ),
                const PrimaryText(
                  "Dispaly Not Working",
                  fontSize: 18,
                  fontWeight: AppThemes.fontRegular,
                  fontColor: AppColors.textColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                const PrimaryText(
                  AppTexts.description,
                  fontSize: 20,
                  fontWeight: AppThemes.fontSemiBold,
                ),
                const SizedBox(
                  height: 3,
                ),
                const PrimaryText(
                  "Lorem ipsum dolor sit amet dolor  adipiscing",
                  fontSize: 18,
                  fontWeight: AppThemes.fontRegular,
                  fontColor: AppColors.textColor,
                  textAlign: TextAlign.start,
                  textOverflow: TextOverflow.clip,
                ),
                const SizedBox(
                  height: 20,
                ),
                const PrimaryText(
                  AppTexts.issueVisual,
                  fontSize: 20,
                  fontWeight: AppThemes.fontBold,
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
