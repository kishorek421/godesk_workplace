import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/constants/app_icons.dart';
import 'package:go_desk_workplace/common/constants/app_images.dart';
import 'package:go_desk_workplace/common/constants/app_texts.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';
import 'package:go_desk_workplace/common/texts/primary_text.dart';
import 'package:go_desk_workplace/common/widgets/buttons/primary_button.dart';
import 'package:go_desk_workplace/controllers/home/home_controller.dart';
import 'package:go_desk_workplace/pages/devices/devices_page.dart';
import 'package:go_desk_workplace/pages/organization/organization_profile_page.dart';
import 'package:go_desk_workplace/pages/tickets/rasie_ticket_page.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key}) {
    Get.put(HomeController());

    controller.fetchCustomerDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PrimaryText(
                      AppTexts.heloo,
                      fontSize: 25,
                      fontWeight: AppThemes.fontBold,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        PrimaryText(
                          ' ${controller.customerDetailsModel.value.firstName ?? "-"}',
                          //textOverflow: TextOverflow.clip,
                          fontSize: 25,
                          fontWeight: AppThemes.fontSemiBold,
                          fontColor: AppColors.black800Color,
                        ),
                        PrimaryText(
                          ' ${controller.customerDetailsModel.value.lastName ?? ""}👋',
                          //textOverflow: TextOverflow.clip,
                          fontSize: 25,
                          fontWeight: AppThemes.fontSemiBold,
                          fontColor: AppColors.black800Color,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                const PrimaryText(
                  AppTexts.howCanWeAssistYouToday,
                  fontSize: 16,
                  fontWeight: AppThemes.fontRegular,
                  fontColor: AppColors.textColor,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: SvgPicture.asset(
                            AppImages.cardManSvg,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PrimaryText(
                                    AppTexts.trouble,
                                    fontSize: 20,
                                    fontWeight: AppThemes.fontBold,
                                    fontColor: AppColors.primaryColor,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  PrimaryText(
                                    AppTexts.withYour,
                                    fontSize: 20,
                                    fontWeight: AppThemes.fontSemiBold,
                                    fontColor: AppColors.black800Color,
                                  ),
                                ],
                              ),
                              const PrimaryText(
                                AppTexts.deviceQuestionMark,
                                fontSize: 20,
                                fontWeight: AppThemes.fontSemiBold,
                                fontColor: AppColors.black800Color,
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              const PrimaryText(
                                AppTexts.letUsAssistYou,
                                fontSize: 18,
                                fontWeight: AppThemes.fontRegular,
                                fontColor: AppColors.black800Color,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              PrimaryButton(
                                buttonColor: AppColors.black800Color,
                                borderRadius: 50,
                                title: AppTexts.raiseATicket,
                                fontColor: AppColors.whiteColor,
                                fontSize: 14,
                                widthFactor: 0.5,
                                fontWeight: AppThemes.fontRegular,
                                onTap: () {
                                  Get.to(
                                    RaiseTicketPage(
                                      customerId: controller
                                              .customerDetailsModel.value.id ??
                                          "",
                                    ),
                                  );
                                },
                                trailingIcon: const Icon(
                                  Icons.arrow_forward_rounded,
                                  color: AppColors.whiteColor,
                                  size: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     InkWell(
                //       onTap: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => const OrganizationPage()
                //               //   moveCallback: () {},
                //               //   saveBtnCallback: (
                //               //       {required canGoNext, required visibility}) {},
                //               //   showToastCallback: ({required msg}) {},
                //               //   isUpdate: true,
                //               //   isNextDetailsFilled: true,
                //               // ),
                //               ),
                //         );
                //       },
                //       child: Container(
                //         height: 120,
                //         width: 150,
                //         decoration: BoxDecoration(
                //           color: AppColors.whiteColor,
                //           borderRadius: BorderRadius.circular(10),
                //           boxShadow: const [
                //             BoxShadow(
                //               color: AppColors.gray200Color,
                //               blurRadius: 10,
                //             ),
                //           ],
                //         ),
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             SvgPicture.asset(
                //               AppIcons.organizationIcon,
                //               width: 25,
                //               height: 25,
                //             ),
                //             const SizedBox(
                //               height: 8,
                //             ),
                //             const PrimaryText(
                //               AppTexts.organization,
                //               fontSize: 20,
                //               fontWeight: AppThemes.fontRegular,
                //               fontColor: AppColors.black800Color,
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     InkWell(
                //       onTap: () {
                //         // Use Navigator.push to navigate to the OrganizationProfilePage
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => DevicesPage(),
                //           ),
                //         );
                //       },
                //       child: Container(
                //         height: 120,
                //         width: 150,
                //         decoration: BoxDecoration(
                //             color: AppColors.whiteColor,
                //             borderRadius: BorderRadius.circular(10),
                //             boxShadow: const [
                //               BoxShadow(
                //                 color: AppColors.gray200Color,
                //                 blurRadius: 10,
                //               ),
                //             ]),
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             SvgPicture.asset(
                //               AppIcons.deviceIcon,
                //               width: 25,
                //               height: 25,
                //             ),
                //             const SizedBox(
                //               height: 8,
                //             ),
                //             const PrimaryText(
                //               AppTexts.device,
                //               fontSize: 20,
                //               fontWeight: AppThemes.fontRegular,
                //               fontColor: AppColors.black800Color,
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset(
                          AppImages.cardLapSvg,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                PrimaryText(
                                  AppTexts.need,
                                  fontSize: 20,
                                  fontWeight: AppThemes.fontBold,
                                  fontColor: AppColors.black800Color,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                PrimaryText(
                                  AppTexts.assistance,
                                  fontSize: 20,
                                  fontWeight: AppThemes.fontBold,
                                  fontColor: AppColors.primaryColor,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                PrimaryText(
                                  AppTexts.reachOutToUs,
                                  fontSize: 16,
                                  fontWeight: AppThemes.fontSemiBold,
                                  fontColor: AppColors.black800Color,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 12,
                                ),
                              ],
                            ),
                          ],
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
