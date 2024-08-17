import 'dart:developer';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/constants/app_icons.dart';
import 'package:go_desk_workplace/common/constants/app_images.dart';
import 'package:go_desk_workplace/common/constants/app_reg_exp.dart';
import 'package:go_desk_workplace/common/constants/app_texts.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';
import 'package:go_desk_workplace/common/constants/storage_constants.dart';
import 'package:go_desk_workplace/common/enums/card_mode_enum.dart';
import 'package:go_desk_workplace/common/widgets/camera/file_picker_bottomsheet.dart';
import 'package:go_desk_workplace/common/widgets/fields/primary_drop_down_field.dart';
import 'package:go_desk_workplace/common/texts/primary_text.dart';
import 'package:go_desk_workplace/common/widgets/buttons/primary_button.dart';
import 'package:go_desk_workplace/pages/home/base_home_page.dart';
import 'package:go_desk_workplace/common/widgets/fields/primary_text_field.dart';
import 'package:go_desk_workplace/controllers/customer_lead/customer_lead_controller.dart';
import 'package:go_desk_workplace/pages/home/home_page.dart';

class OrganizationEditProfilePage extends GetView<CustomerLeadController> {
  final bool isNew;

  OrganizationEditProfilePage({super.key, required this.isNew}) {
    Get.put(CustomerLeadController());
    controller.fetchDropdownsData();
    if (!isNew) {
      controller.fetchCustomerLeadsById(true);
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
        child: Obx(() {
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            body: controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 25,
                            ),
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PrimaryText(
                                  AppTexts.almost,
                                  fontSize: 25,
                                  fontWeight: AppThemes.fontBold,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                PrimaryText(
                                  AppTexts.there,
                                  fontSize: 25,
                                  fontWeight: AppThemes.fontBold,
                                  fontColor: AppColors.primaryColor,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            const PrimaryText(
                              AppTexts.completeYourOrganization,
                              fontSize: 18,
                              fontWeight: AppThemes.fontRegular,
                              fontColor: AppColors.textColor,
                              textOverflow: TextOverflow.clip,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const PrimaryText(
                                  AppTexts.personalDetails,
                                  fontSize: 25,
                                  fontWeight: AppThemes.fontBold,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset(AppImages.smallDividerImage),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const PrimaryText(
                              AppTexts.firstName,
                              fontSize: 20,
                              fontWeight: AppThemes.fontRegular,
                            ),
                            const SizedBox(height: 8),
                            PrimaryTextField(
                              hintText: AppTexts.yourFirstName,
                              label: '',
                              controller: controller.firstNameTEController,
                              hintStyle: const TextStyle(
                                fontFamily: AppThemes.fontFamilyOpenSans,
                                fontWeight: AppThemes.fontRegular,
                                fontSize: 18,
                                color: AppColors.textColor,
                              ),
                              cardMode: CardMode.none.obs,
                              obscureText: false.obs,
                              verticalContentPadding: 0,
                              validator: (value) {
                                if (value == null) {
                                  return 'Please enter your first name';
                                } else if (value.length < 3) {
                                  return 'First name should be at least 3 characters';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 24),
                            const PrimaryText(
                              AppTexts.lastName,
                              fontSize: 20,
                              fontWeight: AppThemes.fontRegular,
                            ),
                            const SizedBox(height: 8),
                            PrimaryTextField(
                              hintText: AppTexts.yourLastName,
                              label: '',
                              hintStyle: const TextStyle(
                                fontFamily: AppThemes.fontFamilyOpenSans,
                                fontWeight: AppThemes.fontRegular,
                                fontSize: 18,
                                color: AppColors.textColor,
                              ),
                              controller: controller.lastNameTEController,
                              validator: (value) {
                                if (value == null || value.length < 3) {
                                  return 'Last name should be at least 3 characters';
                                }
                                return null;
                              },
                              cardMode: CardMode.none.obs,
                              obscureText: false.obs,
                              verticalContentPadding: 0,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const PrimaryText(
                              AppTexts.emailId,
                              fontWeight: AppThemes.fontRegular,
                              fontSize: 20,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            PrimaryTextField(
                              hintText: AppTexts.enterYourEmailId,
                              label: '',
                              hintStyle: const TextStyle(
                                fontFamily: AppThemes.fontFamilyOpenSans,
                                fontWeight: AppThemes.fontRegular,
                                fontSize: 18,
                                color: AppColors.textColor,
                              ),
                              controller: controller.emailTEController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your mail id';
                                } else if (!AppRegExp.mailRegExp
                                    .hasMatch(value)) {
                                  return 'Please enter a valid mail id';
                                }
                                return null;
                              },
                              cardMode: CardMode.none.obs,
                              obscureText: false.obs,
                              verticalContentPadding: 0,
                              textInputType: TextInputType.emailAddress,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const PrimaryText(
                              AppTexts.personalMobileNo,
                              fontWeight: AppThemes.fontRegular,
                              fontSize: 20,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            PrimaryTextField(
                              hintText: AppTexts.enterYourMobileNo,
                              label: '',
                              hintStyle: const TextStyle(
                                fontFamily: AppThemes.fontFamilyOpenSans,
                                fontWeight: AppThemes.fontRegular,
                                fontSize: 18,
                                color: AppColors.textColor,
                              ),
                              cardMode: CardMode.none.obs,
                              obscureText: false.obs,
                              verticalContentPadding: 0,
                              controller: controller.mobileTEController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your mobile no.';
                                } else if (!AppRegExp.mobileRegExp
                                    .hasMatch(value)) {
                                  return 'Please enter a valid mobile no.';
                                }
                                return null;
                              },
                              textInputType: TextInputType.phone,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const PrimaryText(
                              AppTexts.enterAlternativeMobileNo,
                              fontWeight: AppThemes.fontRegular,
                              fontSize: 20,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            PrimaryTextField(
                              hintText: AppTexts.enterAlternativeMobileNo,
                              label: '',
                              hintStyle: const TextStyle(
                                fontFamily: AppThemes.fontFamilyOpenSans,
                                fontWeight: AppThemes.fontRegular,
                                fontSize: 18,
                                color: AppColors.textColor,
                              ),
                              cardMode: CardMode.none.obs,
                              obscureText: false.obs,
                              verticalContentPadding: 0,
                              controller: controller.alternateTEController,
                              textInputType: TextInputType.phone,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const PrimaryText(
                                  AppTexts.organizationDetails,
                                  fontSize: 25,
                                  fontWeight: AppThemes.fontBold,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset(AppImages.smallDividerImage),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const PrimaryText(
                              AppTexts.organizationName,
                              fontSize: 20,
                              fontWeight: AppThemes.fontRegular,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            PrimaryTextField(
                              hintText: AppTexts.enterYourOrganizationName,
                              label: '',
                              hintStyle: const TextStyle(
                                fontFamily: AppThemes.fontFamilyOpenSans,
                                fontWeight: AppThemes.fontRegular,
                                fontSize: 18,
                                color: AppColors.textColor,
                              ),
                              cardMode: CardMode.none.obs,
                              obscureText: false.obs,
                              verticalContentPadding: 0,
                              controller: controller.orgNameTEController,
                              validator: (value) {
                                if (value == null || value.length < 2) {
                                  return 'Org name should be at least 2 characters';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const PrimaryText(
                              AppTexts.organizationMobileNo,
                              fontSize: 20,
                              fontWeight: AppThemes.fontRegular,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            PrimaryTextField(
                              hintText: AppTexts.enterYourOrganizationMobileNo,
                              label: '',
                              hintStyle: const TextStyle(
                                fontFamily: AppThemes.fontFamilyOpenSans,
                                fontWeight: AppThemes.fontRegular,
                                fontSize: 18,
                                color: AppColors.textColor,
                              ),
                              cardMode: CardMode.none.obs,
                              obscureText: false.obs,
                              verticalContentPadding: 0,
                              controller: controller.orgMobileTEController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your org mobile no.';
                                } else if (!AppRegExp.mobileRegExp
                                    .hasMatch(value)) {
                                  return 'Please enter a valid org mobile no.';
                                }
                                return null;
                              },
                              textInputType: TextInputType.phone,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const PrimaryText(
                              AppTexts.type,
                              fontSize: 20,
                              fontWeight: AppThemes.fontRegular,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Obx(() {
                              return PrimaryDropDownField(
                                onChanged: (value) {
                                  if (value != null) {
                                    controller.selectedTypeOfOrgId.value =
                                        controller.typeOfOrgOptionsValueAndId[
                                                value] ??
                                            "";
                                  }
                                },
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColors.gray500Color,
                                ),
                                dropdownColor: AppColors.whiteColor,
                                value: controller.typeOfOrgOptionsIdAndValue[
                                    controller.selectedTypeOfOrgId.value],
                                options: controller
                                    .typeOfOrgOptionsValueAndId.keys
                                    .toList(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please choose a type of org";
                                  }
                                  return null;
                                },
                                hint: const Text(
                                  "Select Type",
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 16,
                                    fontWeight: AppThemes.fontRegular,
                                  ),
                                ),
                                // isDense: true,
                                fillColor: AppColors.whiteColor,
                              );
                            }),
                            const SizedBox(
                              height: 24,
                            ),
                            const PrimaryText(
                              AppTexts.category,
                              fontSize: 20,
                              fontWeight: AppThemes.fontRegular,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Obx(() {
                              return PrimaryDropDownField(
                                fillColor: AppColors.whiteColor,
                                onChanged: (value) {
                                  if (value != null) {
                                    controller
                                        .selectedCatOfOrgId.value = controller
                                                .categoryOfOrgOptionsValueAndId[
                                            value] ??
                                        "";
                                  }
                                },
                                hint: const Text(
                                  AppTexts.selectCategory,
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 16,
                                    fontWeight: AppThemes.fontRegular,
                                  ),
                                ),
                                value:
                                    controller.categoryOfOrgOptionsIdAndValue[
                                        controller.selectedCatOfOrgId.value],
                                options: controller
                                    .categoryOfOrgOptionsValueAndId.keys
                                    .toList(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please choose a category of org";
                                  }
                                  return null;
                                },
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColors.gray500Color,
                                ),
                                dropdownColor: AppColors.whiteColor,
                              );
                            }),
                            const SizedBox(
                              height: 24,
                            ),
                            const PrimaryText(
                              AppTexts.size,
                              fontSize: 20,
                              fontWeight: AppThemes.fontRegular,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Obx(() {
                              return PrimaryDropDownField(
                                fillColor: AppColors.whiteColor,
                                onChanged: (value) {
                                  if (value != null) {
                                    controller.selectedSizeOfOrgId.value =
                                        controller.sizeOfOrgOptionsValueAndId[
                                                value] ??
                                            "";
                                  }
                                },
                                hint: const Text(
                                  AppTexts.selectSize,
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 16,
                                    fontWeight: AppThemes.fontRegular,
                                  ),
                                ),
                                value: controller.sizeOfOrgOptionsIdAndValue[
                                    controller.selectedSizeOfOrgId.value],
                                options: controller
                                    .sizeOfOrgOptionsValueAndId.keys
                                    .toList(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please choose a size of org";
                                  }
                                  return null;
                                },
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColors.gray500Color,
                                ),
                                dropdownColor: AppColors.whiteColor,
                              );
                            }),
                            const SizedBox(
                              height: 20,
                            ),
                            const PrimaryText(
                              AppTexts.gstNo,
                              fontSize: 20,
                              fontWeight: AppThemes.fontRegular,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            PrimaryTextField(
                              hintText: AppTexts.enterYourGstNo,
                              label: '',
                              hintStyle: const TextStyle(
                                fontFamily: AppThemes.fontFamilyOpenSans,
                                fontWeight: AppThemes.fontRegular,
                                fontSize: 16,
                                color: AppColors.textColor,
                              ),
                              cardMode: CardMode.none.obs,
                              obscureText: false.obs,
                              verticalContentPadding: 0,
                              controller: controller.gstinTEController,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const PrimaryText(
                              AppTexts.msmeNo,
                              fontWeight: AppThemes.fontRegular,
                              fontSize: 20,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            PrimaryTextField(
                              hintText: AppTexts.enterYourMsmeNo,
                              label: '',
                              hintStyle: const TextStyle(
                                fontFamily: AppThemes.fontFamilyOpenSans,
                                fontWeight: AppThemes.fontRegular,
                                fontSize: 16,
                                color: AppColors.textColor,
                              ),
                              controller: controller.msmeTEController,
                              cardMode: CardMode.none.obs,
                              obscureText: false.obs,
                              verticalContentPadding: 0,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const PrimaryText(
                              AppTexts.description,
                              fontSize: 20,
                              fontWeight: AppThemes.fontRegular,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            PrimaryTextField(
                              hintText:
                                  AppTexts.shortDescriptionOfYourOrganization,
                              label: '',
                              hintStyle: const TextStyle(
                                fontFamily: AppThemes.fontFamilyOpenSans,
                                fontWeight: AppThemes.fontRegular,
                                fontSize: 18,
                                color: AppColors.textColor,
                              ),
                              cardMode: CardMode.none.obs,
                              obscureText: false.obs,
                              verticalContentPadding: 0,
                              controller: controller.descTEController,
                              validator: (value) {
                                if (value == null || value.length < 10) {
                                  return 'Description should be at least 10 characters';
                                }
                                return null;
                              },
                              maxLines: 4,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const PrimaryText(
                              AppTexts.organizationAddress,
                              fontSize: 20,
                              fontWeight: AppThemes.fontRegular,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            PrimaryTextField(
                              hintText: AppTexts.enterAddressLine1,
                              label: '',
                              hintStyle: const TextStyle(
                                fontFamily: AppThemes.fontFamilyOpenSans,
                                fontWeight: AppThemes.fontRegular,
                                fontSize: 18,
                                color: AppColors.textColor,
                              ),
                              cardMode: CardMode.none.obs,
                              obscureText: false.obs,
                              verticalContentPadding: 0,
                              controller: controller.orgAddressTEController,
                              validator: (value) {
                                if (value == null || value.length < 10) {
                                  return 'Address should be at least 10 characters';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const PrimaryText(
                              AppTexts.pincode,
                              fontSize: 20,
                              fontWeight: AppThemes.fontRegular,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Autocomplete<String>(
                              initialValue: TextEditingValue(
                                  text: controller.pincodeOptionsIdAndValue[
                                          controller.pincodeId.value] ??
                                      ""),
                              optionsBuilder:
                                  (TextEditingValue textEditingValue) {
                                if (textEditingValue.text.isEmpty) {
                                  return const Iterable<String>.empty();
                                }
                                return controller.pincodeOptionsValueAndId.keys
                                    .where(
                                  (pincode) => pincode.toLowerCase().contains(
                                        textEditingValue.text.toLowerCase(),
                                      ),
                                );
                              },
                              onSelected: (String selection) {
                                controller.pincodeId.value = selection;
                              },
                              fieldViewBuilder: (context, controller, focusNode,
                                  onFieldSubmitted) {
                                return TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select a pincode';
                                    }
                                    return null;
                                  },
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: AppThemes.fontFamilyOpenSans,
                                    color: AppColors.black800Color,
                                  ),
                                  keyboardType: TextInputType.number,
                                  controller: controller,
                                  focusNode: focusNode,
                                  decoration: InputDecoration(
                                    hintText: "Enter pincode",
                                    hintStyle: const TextStyle(
                                      fontFamily: AppThemes.fontFamilyOpenSans,
                                      fontWeight: AppThemes.fontRegular,
                                      fontSize: 18,
                                      color: AppColors.textColor,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                        color: AppColors.primaryColor,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              optionsViewBuilder:
                                  (context, onSelected, options) {
                                return Align(
                                  alignment: Alignment.topLeft,
                                  child: Material(
                                    child: Container(
                                      color: Colors.white,
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: options.length,
                                        itemBuilder: (context, index) {
                                          final option =
                                              options.elementAt(index);
                                          return ListTile(
                                            title: Text(
                                              option,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontFamily: AppThemes
                                                    .fontFamilyOpenSans,
                                                color: AppColors.black800Color,
                                              ),
                                            ),
                                            onTap: () => onSelected(option),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            const PrimaryText(
                              AppTexts.area,
                              fontSize: 20,
                              fontWeight: AppThemes.fontRegular,
                            ),
                            const SizedBox(height: 8),
                            Obx(() {
                              return PrimaryDropDownField(
                                fillColor: AppColors.whiteColor,
                                onChanged: (value) {
                                  if (value != null) {
                                    controller.areaId.value = controller
                                            .areaOptionsValueAndId[value] ??
                                        "";
                                  }
                                },
                                value: controller.areaOptionsIdAndValue[
                                    controller.areaId.value],
                                options: controller.areaOptionsValueAndId.keys
                                    .toList(),
                                hint: const Text(
                                  AppTexts.selectArea,
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 18,
                                    fontWeight: AppThemes.fontRegular,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please select a area";
                                  }
                                  return null;
                                },
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColors.gray500Color,
                                ),
                                dropdownColor: AppColors.whiteColor,
                              );
                            }),
                            const SizedBox(height: 24),
                            const PrimaryText(
                              AppTexts.city,
                              fontSize: 20,
                              fontWeight: AppThemes.fontRegular,
                            ),
                            const SizedBox(height: 8),
                            Obx(() {
                              return PrimaryDropDownField(
                                fillColor: AppColors.whiteColor,
                                onChanged: (value) {
                                  if (value != null) {
                                    controller.cityId.value = controller
                                            .cityOptionsValueAndId[value] ??
                                        "";
                                  }
                                },
                                value: controller.cityOptionsIdAndValue[
                                    controller.cityId.value],
                                // value: controller
                                //     .cityOptionsIdAndValue[controller.cityName.value],
                                options: controller.cityOptionsValueAndId.keys
                                    .toList(),
                                hint: const Text(
                                  AppTexts.city,
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 18,
                                    fontWeight: AppThemes.fontRegular,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please select a city";
                                  }
                                  return null;
                                },
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColors.gray500Color,
                                ),
                                dropdownColor: AppColors.whiteColor,
                              );
                            }),
                            const SizedBox(
                              height: 24,
                            ),
                            const PrimaryText(
                              AppTexts.state,
                              fontSize: 20,
                              fontWeight: AppThemes.fontRegular,
                            ),
                            const SizedBox(height: 8),
                            Obx(() {
                              return PrimaryDropDownField(
                                fillColor: AppColors.whiteColor,
                                onChanged: (value) {
                                  if (value != null) {
                                    controller.stateId.value = controller
                                            .stateOptionsValueAndId[value] ??
                                        "";
                                  }
                                },
                                hint: const Text(
                                  AppTexts.state,
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 18,
                                    fontWeight: AppThemes.fontRegular,
                                  ),
                                ),
                                value: controller.stateOptionsIdAndValue[
                                    controller.stateId.value],
                                options: controller.stateOptionsValueAndId.keys
                                    .toList(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please select a state";
                                  }
                                  return null;
                                },
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColors.gray500Color,
                                ),
                                dropdownColor: AppColors.whiteColor,
                              );
                            }),
                            const SizedBox(height: 24),
                            const PrimaryText(
                              AppTexts.country,
                              fontSize: 20,
                              fontWeight: AppThemes.fontRegular,
                            ),
                            const SizedBox(height: 8),
                            Obx(() {
                              return PrimaryDropDownField(
                                fillColor: AppColors.whiteColor,
                                onChanged: (value) {
                                  //log(value ?? "nothing");
                                  if (value != null) {
                                    controller.countryId.value = controller
                                            .countryOptionsValueAndId[value] ??
                                        "";
                                  }
                                },
                                value: controller.countryOptionsIdAndValue[
                                    controller.countryId.value],
                                options: controller
                                    .countryOptionsValueAndId.keys
                                    .toList(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please select a country";
                                  }
                                  return null;
                                },
                                hint: const Text(
                                  AppTexts.country,
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 18,
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
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const PrimaryText(
                                  AppTexts.organizationImage,
                                  fontSize: 20,
                                  fontWeight: AppThemes.fontSemiBold,
                                ),
                                InkWell(
                                  onTap: () {
                                    showFilePickerBottomSheet(context);
                                  },
                                  child: const Icon(
                                    Icons.change_circle_outlined,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Obx(() {
                              return DottedBorder(
                                color: AppColors.primaryColor,
                                strokeWidth: 1.5,
                                dashPattern: [8, 8],
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(8),
                                child: controller
                                        .selectedOrgImagePath.value.isNotEmpty
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: controller
                                                  .selectedOrgImagePath.value
                                                  .startsWith("https://")
                                              ? Image.network(
                                                  controller
                                                      .selectedOrgImagePath
                                                      .value,
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
                                                          Icons
                                                              .wallpaper_rounded,
                                                          color: Colors.grey,
                                                          size: 80,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                )
                                              : Image.file(
                                                  File(controller
                                                      .selectedOrgImagePath
                                                      .value),
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
                                                          Icons
                                                              .wallpaper_rounded,
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
                                              fontWeight:
                                                  AppThemes.fontSemiBold,
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
                              height: 25,
                            ),
                            PrimaryButton(
                              title: AppTexts.submit,
                              buttonColor: AppColors.primaryColor,
                              widthFactor: 1,
                              fontSize: 18,
                              fontWeight: AppThemes.fontSemiBold,
                              fontColor: AppColors.whiteColor,
                              onTap: () async {
                                var formState = _formKey.currentState;
                                if (formState != null && formState.validate()) {
                                  controller
                                      .updateCustomerLeadDetails(isNew)
                                      .then((value) async {
                                    var id = value.data?.id;
                                    if (value.success && id != null) {
                                      var ss = const FlutterSecureStorage();
                                      await ss.write(
                                        key: StorageConstants.customerLeadIdKey,
                                        value: id,
                                      );
                                      await ss.write(
                                          key:
                                              StorageConstants.isCustomerActive,
                                          value: true.toString());
                                      Get.off(() => const BaseHomePage());
                                    } else {
                                      var errors = value.errors?.data;
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
                                      controller.isLoading.value = false;
                                    }
                                  });
                                } else {
                                  // Get.snackbar(
                                  //   "Error",
                                  //   "Please fill all the forms",
                                  // );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        }),
      ),
    );
  }

  Future<void> showFilePickerBottomSheet(context) async {
    try {
      final result = await showModalBottomSheet<File>(
        context: context,
        builder: (context) => const FilePickerBottomSheet(),
      );
      if (result != null) {
        controller.selectedOrgImagePath.value = result.path;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
