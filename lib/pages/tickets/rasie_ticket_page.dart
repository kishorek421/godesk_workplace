import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/constants/app_icons.dart';
import 'package:go_desk_workplace/common/constants/app_texts.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';
import 'package:go_desk_workplace/common/enums/card_mode_enum.dart';
import 'package:go_desk_workplace/common/widgets/fields/primary_drop_down_field.dart';
import 'package:go_desk_workplace/common/texts/primary_text.dart';
import 'package:go_desk_workplace/common/widgets/camera/file_picker_bottomsheet.dart';
import 'package:go_desk_workplace/common/widgets/buttons/primary_button.dart';
import 'package:go_desk_workplace/common/widgets/fields/primary_text_field.dart';
import 'package:go_desk_workplace/controllers/tickets/raise_ticket_controller.dart';
import 'package:go_desk_workplace/pages/home/base_home_page.dart';
import 'package:go_desk_workplace/pages/organization/organization_profile_page.dart';

class RaiseTicketPage extends GetView<RaiseTicketController> {

  final String customerId;

  RaiseTicketPage({super.key, required this.customerId}) {
    Get.put(RaiseTicketController());
  }

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
              AppTexts.raiseTicket,
              fontSize: 25,
              fontWeight: AppThemes.fontBold,
            ),
            centerTitle: true,
            actions: [
              InkWell(
                onTap: () {
                  Get.to(
                    () => const OrganizationPage(
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
              padding: const EdgeInsets.all(20.0),
              child: Obx(() {
                return controller.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          const PrimaryText(
                            AppTexts.fillTheIssueDetail,
                            fontWeight: AppThemes.fontSemiBold,
                            fontSize: 20,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Obx(() {
                            return PrimaryDropDownField(
                              fillColor: AppColors.whiteColor,
                              onChanged: (value) {
                                //log(value ?? "nothing");
                                if (value != null) {
                                  controller.selectedAssetId.value =
                                      controller
                                                  .assetsInUseOptionsValueAndId[
                                              value] ??
                                          "";
                                }
                              },
                              value: controller
                                      .assetsInUseOptionsIdAndValue[
                                  controller.selectedAssetId.value],
                              options: controller
                                  .assetsInUseOptionsValueAndId.keys
                                  .toList(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please select a asset";
                                }
                                return null;
                              },
                              hint: const Text(
                                "Select asset",
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 16,
                                  fontWeight: AppThemes.fontRegular,
                                ),
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: AppColors.gray500Color,
                              ),
                              dropdownColor: AppColors.whiteColor,
                            );
                          }),
                          const SizedBox(
                            height: 15,
                          ),
                          Obx(() {
                            return PrimaryDropDownField(
                              fillColor: AppColors.whiteColor,
                              onChanged: (value) {
                                //log(value ?? "nothing");
                                if (value != null) {
                                  controller.selectedAssetId
                                      .value = controller
                                          .issueTypesOptionsValueAndId[value] ??
                                      "";
                                }
                              },
                              value: controller
                                      .issueTypesOptionsIdAndValue[
                                  controller.selectedAssetId.value],
                              options: controller
                                  .issueTypesOptionsValueAndId.keys
                                  .toList(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please select a issue type";
                                }
                                return null;
                              },
                              hint: const Text(
                                "Select issue type",
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 16,
                                  fontWeight: AppThemes.fontRegular,
                                ),
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: AppColors.gray500Color,
                              ),
                              dropdownColor: AppColors.whiteColor,
                            );
                          }),
                          const SizedBox(
                            height: 15,
                          ),
                          // Obx(() {
                          //   return PrimaryDropDownField(
                          //     fillColor: AppColors.whiteColor,
                          //     onChanged: (value) {
                          //       //log(value ?? "nothing");
                          //       if (value != null) {
                          //         controller.selectedAssetId.value = controller
                          //             .countryOptionsValueAndId[value] ??
                          //             "";
                          //       }
                          //     },
                          //     // value: controller.countryOptionsIdAndValue[
                          //     // controller.countryId.value],
                          //     options: controller
                          //         .assetTypesOptionsValueAndId.keys
                          //         .toList(),
                          //     validator: (value) {
                          //       if (value == null || value.isEmpty) {
                          //         return "Please select a asset type";
                          //       }
                          //       return null;
                          //     },
                          //     hint: const Text(
                          //       "Select asset type",
                          //       style: TextStyle(
                          //         color: AppColors.textColor,
                          //         fontSize: 16,
                          //         fontWeight: AppThemes.fontRegular,
                          //       ),
                          //     ),
                          //     icon: const Icon(
                          //       Icons.arrow_drop_down,
                          //       color: AppColors.gray500Color,
                          //     ),
                          //     dropdownColor: AppColors.whiteColor,
                          //   );
                          // }),
                          // Obx(() {
                          //   return PrimaryDropDownField(
                          //     onChanged: (val) {},
                          //     items: controller.assetTypesOptionsValueAndId.keys.toList(),
                          //     hint: const Text(
                          //       AppTexts.selectIssueDevice,
                          //       style: TextStyle(
                          //         color: AppColors.textColor,
                          //         fontSize: 16,
                          //         fontWeight: AppThemes.fontRegular,
                          //       ),
                          //     ),
                          //     icon: const Icon(
                          //       Icons.arrow_drop_down,
                          //       color: AppColors.gray500Color,
                          //     ),
                          //     fillColor: AppColors.gray200Color,
                          //     dropdownColor: AppColors.gray200Color,
                          //   );
                          // }),
                          // const SizedBox(
                          //   height: 15,
                          // ),
                          // Obx(() {
                          //   return PrimaryDropDownField(
                          //     onChanged: (val) {},
                          //     items: controller.orgCategoryDropDownItems
                          //         .map(
                          //           (e) => DropdownMenuItem(
                          //             alignment: Alignment.centerLeft,
                          //             value: e,
                          //             child: PrimaryText(
                          //               e,
                          //               fontWeight: AppThemes.fontSemiBold,
                          //               fontSize: 18,
                          //               fontColor: AppColors.black800Color,
                          //             ),
                          //           ),
                          //         )
                          //         .toList(),
                          //     hint: const Text(
                          //       AppTexts.issueType,
                          //       style: TextStyle(
                          //         color: AppColors.textColor,
                          //         fontSize: 18,
                          //         fontWeight: AppThemes.fontRegular,
                          //       ),
                          //     ),
                          //     icon: const Icon(
                          //       Icons.arrow_drop_down,
                          //       color: AppColors.gray500Color,
                          //     ),
                          //     dropdownColor: AppColors.gray200Color,
                          //     fillColor: AppColors.gray200Color,
                          //   );
                          // }),
                          // const SizedBox(
                          //   height: 15,
                          // ),
                          // Obx(() {
                          //   return PrimaryDropDownField(
                          //     onChanged: (val) {},
                          //     items: controller.orgCategoryDropDownItems
                          //         .map(
                          //           (e) => DropdownMenuItem(
                          //             alignment: Alignment.centerLeft,
                          //             value: e,
                          //             child: PrimaryText(
                          //               e,
                          //               fontWeight: AppThemes.fontSemiBold,
                          //               fontSize: 18,
                          //               fontColor: AppColors.black800Color,
                          //             ),
                          //           ),
                          //         )
                          //         .toList(),
                          //     hint: const Text(
                          //       AppTexts.issueSubType,
                          //       style: TextStyle(
                          //         color: AppColors.textColor,
                          //         fontSize: 18,
                          //         fontWeight: AppThemes.fontRegular,
                          //       ),
                          //     ),
                          //     icon: const Icon(
                          //       Icons.arrow_drop_down,
                          //       color: AppColors.gray500Color,
                          //     ),
                          //     fillColor: AppColors.gray200Color,
                          //     dropdownColor: AppColors.gray200Color,
                          //   );
                          // }),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          const PrimaryText(
                            "Issue Description",
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          PrimaryTextField(
                            label: "Description",
                            cardMode: CardMode.none.obs,
                            obscureText: false.obs,
                            verticalContentPadding: 0,
                            hintText: "Write a issue in short",
                            hintStyle: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const PrimaryText(
                            AppTexts.attachImage,
                            fontSize: 20,
                            fontWeight: AppThemes.fontBold,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const PrimaryText(
                            AppTexts.attachingAnImageWillHelp,
                            fontSize: 18,
                            fontWeight: AppThemes.fontRegular,
                            fontColor: AppColors.textColor,
                            textOverflow: TextOverflow.clip,
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // DottedBorder(
                          //   color: AppColors.primaryColor,
                          //   strokeWidth: 1.5,
                          //   dashPattern: [8, 8],
                          //   borderType: BorderType.RRect,
                          //   radius: const Radius.circular(8),
                          //   child: selectedImage != null
                          //       ? ClipRRect(
                          //           borderRadius: BorderRadius.circular(8),
                          //           child: Container(
                          //             decoration: BoxDecoration(
                          //               borderRadius: BorderRadius.circular(8),
                          //             ),
                          //             child: Image.file(
                          //               selectedImage!,
                          //               width: double.infinity,
                          //               height: 150,
                          //               fit: BoxFit.fill,
                          //             ),
                          //           ),
                          //         )
                          //       : Container(
                          //           height: 150,
                          //           width: double.infinity,
                          //           color: const Color(0xffEBF7F3),
                          //           child: Column(
                          //             crossAxisAlignment: CrossAxisAlignment.center,
                          //             mainAxisAlignment: MainAxisAlignment.center,
                          //             children: [
                          //               SvgPicture.asset(
                          //                 AppIcons.imageUpload,
                          //                 width: 25,
                          //                 height: 25,
                          //               ),
                          //               const SizedBox(
                          //                 height: 10,
                          //               ),
                          //               const PrimaryText(
                          //                 AppTexts.uploadYourFileHere,
                          //                 fontWeight: AppThemes.fontSemiBold,
                          //                 fontSize: 18,
                          //               ),
                          //               const SizedBox(
                          //                 height: 10,
                          //               ),
                          //               PrimaryButton(
                          //                 borderSide: const BorderSide(
                          //                   width: 0.8,
                          //                   color: AppColors.primaryColor,
                          //                 ),
                          //                 title: AppTexts.browse,
                          //                 elevation: 0,
                          //                 fontSize: 18,
                          //                 fontWeight: AppThemes.fontRegular,
                          //                 fontColor: AppColors.primaryColor,
                          //                 widthFactor: 0.3,
                          //                 innerHorizontalPadding: 3,
                          //                 innerVerticalPadding: 3,
                          //                 buttonColor: const Color(0xffD6EFE6),
                          //                 onTap: showFilePickerBottomSheet,
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          // ),
                          Obx(() {
                            return DottedBorder(
                              color: AppColors.primaryColor,
                              strokeWidth: 1.5,
                              dashPattern: [8, 8],
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(8),
                              child: controller
                                      .assetImagePaths.isNotEmpty
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: controller
                                                .assetImagePaths[0]
                                                .startsWith("https://")
                                            ? Image.network(
                                                controller
                                                    .assetImagePaths[0],
                                                width: double.infinity,
                                                height: 150,
                                                fit: BoxFit.cover,
                                                errorBuilder:
                                                    (context, src, e) {
                                                  return Container(
                                                    width: double.infinity,
                                                    height: 150,
                                                    child: const Center(
                                                      child: Icon(
                                                        Icons.wallpaper_rounded,
                                                        color: Colors.grey,
                                                        size: 80,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              )
                                            : Image.file(
                                                File(controller
                                                    .assetImagePaths[0]),
                                                width: double.infinity,
                                                height: 150,
                                                fit: BoxFit.cover,
                                                errorBuilder:
                                                    (context, src, e) {
                                                  return Container(
                                                    width: double.infinity,
                                                    height: 150,
                                                    child: const Center(
                                                      child: Icon(
                                                        Icons.wallpaper_rounded,
                                                        color: Colors.grey,
                                                        size: 80,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                      ),
                                    )
                                  : Container(
                                      height: 150,
                                      width: double.infinity,
                                      color: const Color(0xffEBF7F3),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.imageUpload,
                                            width: 25,
                                            height: 25,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const PrimaryText(
                                            AppTexts.uploadYourFileHere,
                                            fontWeight: AppThemes.fontSemiBold,
                                            fontSize: 18,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          PrimaryButton(
                                            borderSide: const BorderSide(
                                              width: 0.8,
                                              color: AppColors.primaryColor,
                                            ),
                                            title: AppTexts.browse,
                                            elevation: 0,
                                            fontSize: 18,
                                            fontWeight: AppThemes.fontRegular,
                                            fontColor: AppColors.primaryColor,
                                            widthFactor: 0.3,
                                            innerHorizontalPadding: 3,
                                            innerVerticalPadding: 3,
                                            buttonColor:
                                                const Color(0xffD6EFE6),
                                            onTap: () {
                                              showFilePickerBottomSheet(
                                                  context);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                            );
                          }),
                          const SizedBox(
                            height: 40,
                          ),
                          PrimaryButton(
                            title: AppTexts.submit,
                            buttonColor: AppColors.primaryColor,
                            widthFactor: 1,
                            fontSize: 18,
                            fontWeight: AppThemes.fontSemiBold,
                            fontColor: AppColors.whiteColor,
                            onTap: () {
                              var validateMsg =
                                  controller.validateFields();
                              if (validateMsg == null) {
                                controller
                                    .raiseTicket()
                                    .then((response) {
                                  var success = response.success;
                                  if (success) {
                                    Get.off(() => const BaseHomePage());
                                  } else {
                                    var errors = response.errors?.data;
                                    if (errors != null && errors.isNotEmpty) {
                                      var errorMsg = "";
                                      for (var error in errors) {
                                        var param = error.param;
                                        var msg = error.message;
                                        if (param != null && msg != null) {
                                          errorMsg += "$param : $msg,";
                                        }
                                      }
                                      if (errorMsg.isNotEmpty) {
                                        Fluttertoast.showToast(msg: errorMsg);
                                      }
                                    }
                                    controller.isLoading.value =
                                        false;
                                  }
                                });
                              } else {
                                Fluttertoast.showToast(msg: validateMsg);
                              }
                            },
                          ),
                        ],
                      );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> showFilePickerBottomSheet(context) async {
    final result = await showModalBottomSheet<File>(
      context: context,
      builder: (context) => const FilePickerBottomSheet(),
    );
    if (result != null) {
      controller.assetImagePaths.add(result.path);
    }
  }
}
