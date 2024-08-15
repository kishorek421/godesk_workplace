import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/constants/app_images.dart';
import 'package:go_desk_workplace/common/constants/app_texts.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';
import 'package:go_desk_workplace/common/enums/card_mode_enum.dart';
import 'package:go_desk_workplace/common/widgets/fields/primary_drop_down.dart';
import 'package:go_desk_workplace/common/texts/primary_text.dart';
import 'package:go_desk_workplace/common/widgets/buttons/primary_button.dart';
import 'package:go_desk_workplace/common/widgets/card/flexible_card.dart';
import 'package:go_desk_workplace/common/widgets/fields/primary_text_field.dart';
import 'package:go_desk_workplace/common/widgets/icon/primary_icon.dart';
import 'package:go_desk_workplace/controllers/base_controller.dart';
import 'package:go_desk_workplace/controllers/customer/customer_controller.dart';
import 'package:go_desk_workplace/pages/devices/devices_page.dart';

class OrganizationPage extends StatefulWidget {
  const OrganizationPage({super.key});

  @override
  State<OrganizationPage> createState() => _OrganizationPageState();
}

class _OrganizationPageState extends State<OrganizationPage> {
  // CustomerLeadController customerLeadController =
  //    Get.put(CustomerLeadController());
  CustomerController customerController = Get.put(CustomerController());
  BaseHomePageController controller = Get.put(BaseHomePageController());

  @override
  Widget build(BuildContext context) {
    customerController.fetchCustomerById();
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
            title: const Text(
              AppTexts.organizationDetails,
              style: TextStyle(
                fontWeight: AppThemes.fontBold,
                fontSize: 25,
                fontFamily: AppThemes.fontFamilyOpenSans,
              ),
            ),
            centerTitle: true,
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back,
                size: 20,
              ),
            ),
            actions: [
              PrimaryIcon(
                Icons.edit,
                mode: customerController.organizationDetailsMode,
                editOnClickCallback: onClick,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ImageField(
                  //   onTap: () {},
                  //   path: customerController.profilePath,
                  //   isPathValid: customerController.isProfilePathValid,
                  //   label: '',
                  //   cardMode: customerController.organizationDetailsMode,
                  //   isUpdatable: true.obs,
                  //   width: double.infinity,
                  //   elevation: 0,
                  //   height: 150,
                  //   boxFit: BoxFit.fill,
                  // ),
                  const SizedBox(
                    height: 24,
                  ),
                  PrimaryTextField(
                    label: AppTexts.organizationName,
                    editLabelSize: 20,
                    labelFontSize: 15,
                    isDense: true,
                    obscureText: false.obs,
                    labelColor: AppColors.textColor,
                    cardMode: customerController.organizationDetailsMode,
                    verticalContentPadding: 20,
                    fillColor: AppColors.primaryColor,
                    editTextSize: 18,
                    editLabelWeight: AppThemes.fontSemiBold,
                    controller: customerController.orgNameTEController,
                    // controller: TextEditingController(
                    //   text: customerController.orgName.value,
                    // ),
                    onChanged: (value) {
                      customerController.orgName.value = value;
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  PrimaryTextField(
                    label: AppTexts.adminFirstName,
                    editLabelSize: 20,
                    obscureText: false.obs,
                    labelFontSize: 15,
                    isDense: true,
                    labelColor: AppColors.textColor,
                    cardMode: customerController.organizationDetailsMode,
                    verticalContentPadding: 20,
                    fillColor: AppColors.primaryColor,
                    editTextSize: 18,
                    editLabelWeight: AppThemes.fontSemiBold,
                    controller: customerController.adminFirstNameTEController,
                    onChanged: (value) {
                      customerController.adminFirstName.value = value;
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  PrimaryTextField(
                    label: AppTexts.adminLastName,
                    editLabelSize: 20,
                    labelFontSize: 15,
                    obscureText: false.obs,
                    isDense: true,
                    labelColor: AppColors.textColor,
                    cardMode: customerController.organizationDetailsMode,
                    verticalContentPadding: 20,
                    fillColor: AppColors.primaryColor,
                    editTextSize: 18,
                    editLabelWeight: AppThemes.fontSemiBold,
                    controller: customerController.adminLastNameTEController,
                    onChanged: (value) {
                      customerController.adminLastName.value = value;
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Obx(() {
                    return PrimaryDropDownButton(
                      cardMode: customerController.organizationDetailsMode,
                      onChanged: (val) {
                        // controller.type.value = val;
                      },
                      items: controller.orgTypeDropDownItems
                          .map(
                            (e) => DropdownMenuItem(
                              alignment: Alignment.centerLeft,
                              value: e,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: PrimaryText(
                                  e,
                                  fontColor: AppColors.textColor,
                                  fontSize: 18,
                                  fontWeight: AppThemes.fontRegular,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      iconEnabledColor: AppColors.primaryColor,
                      iconDisabledColor: AppColors.whiteColor,
                      dropdownColor: AppColors.whiteColor,
                      label: AppTexts.type,
                      isDense: true,
                      editLabelSize: 18,
                      viewLabelSize: 20,
                      viewLabelWeight: AppThemes.fontSemiBold,
                    );
                  }),
                  const SizedBox(
                    height: 24,
                  ),
                  Obx(() {
                    return PrimaryDropDownButton(
                      cardMode: customerController.organizationDetailsMode,
                      onChanged: (val) {
                        // controller.category.value = val;
                      },
                      items: controller.orgCategoryDropDownItems
                          .map(
                            (e) => DropdownMenuItem(
                              alignment: Alignment.centerLeft,
                              value: e,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: PrimaryText(
                                  e,
                                  fontColor: AppColors.textColor,
                                  fontSize: 18,
                                  fontWeight: AppThemes.fontRegular,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      iconEnabledColor: AppColors.primaryColor,
                      iconDisabledColor: AppColors.whiteColor,
                      dropdownColor: AppColors.whiteColor,
                      label: AppTexts.category,
                      isDense: true,
                      editLabelSize: 18,
                      viewLabelSize: 20,
                      viewLabelWeight: AppThemes.fontSemiBold,
                    );
                  }),
                  const SizedBox(
                    height: 24,
                  ),
                  Obx(() {
                    return PrimaryDropDownButton(
                      cardMode: customerController.organizationDetailsMode,
                      onChanged: (val) {
                        // controller.size.value = val;
                      },
                      items: controller.orgSizeDropDownItems
                          .map(
                            (e) => DropdownMenuItem(
                              alignment: Alignment.centerLeft,
                              value: e,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: PrimaryText(
                                  e,
                                  fontColor: AppColors.textColor,
                                  fontSize: 18,
                                  fontWeight: AppThemes.fontRegular,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      iconEnabledColor: AppColors.primaryColor,
                      iconDisabledColor: AppColors.whiteColor,
                      dropdownColor: AppColors.whiteColor,
                      label: AppTexts.size,
                      isDense: true,
                      editLabelSize: 18,
                      viewLabelSize: 20,
                      viewLabelWeight: AppThemes.fontSemiBold,
                    );
                  }),
                  const SizedBox(
                    height: 24,
                  ),
                  PrimaryTextField(
                    label: AppTexts.gstNo,
                    editLabelSize: 20,
                    labelFontSize: 15,
                    obscureText: false.obs,
                    isDense: true,
                    labelColor: AppColors.textColor,
                    cardMode: customerController.organizationDetailsMode,
                    verticalContentPadding: 20,
                    fillColor: AppColors.primaryColor,
                    editTextSize: 18,
                    editLabelWeight: AppThemes.fontSemiBold,
                    controller: customerController.gstInTEController,
                    // controller: TextEditingController(
                    //   text: customerController.gstIn.value,
                    // ),
                    onChanged: (value) {
                      customerController.gstIn.value = value;
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  PrimaryTextField(
                    label: AppTexts.description,
                    maxLines: 5,
                    editLabelSize: 20,
                    labelFontSize: 15,
                    obscureText: false.obs,
                    isDense: true,
                    labelColor: AppColors.textColor,
                    cardMode: customerController.organizationDetailsMode,
                    verticalContentPadding: 0,
                    fillColor: AppColors.primaryColor,
                    editTextSize: 18,
                    editLabelWeight: AppThemes.fontSemiBold,
                    controller: customerController.descriptionTEController,
                    // controller: TextEditingController(
                    //   text: customerController.description.value,
                    // ),
                    onChanged: (value) {
                      customerController.description.value = value;
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const PrimaryText(
                    AppTexts.contactDetails,
                    fontWeight: AppThemes.fontBold,
                    fontSize: 25,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  PrimaryTextField(
                    label: AppTexts.organizationMobileNo,
                    editLabelSize: 20,
                    labelFontSize: 15,
                    obscureText: false.obs,
                    isDense: true,
                    labelColor: AppColors.textColor,
                    cardMode: customerController.organizationDetailsMode,
                    verticalContentPadding: 0,
                    editTextSize: 18,
                    editLabelWeight: AppThemes.fontSemiBold,
                    keyboardType: TextInputType.phone,
                    controller: customerController.orgMobTEController,
                    // controller: TextEditingController(
                    //     text: ' ${customerController.orgMobile.value}'),
                    onChanged: (value) {
                      customerController.orgMobile.value = value;
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Obx(() {
                    return Visibility(
                      visible:
                          customerController.organizationDetailsMode.value ==
                              CardMode.edit,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PrimaryText(
                            AppTexts.address,
                            fontSize: 20,
                            fontWeight: AppThemes.fontSemiBold,
                          ),
                        ],
                      ),
                    );
                  }),
                  Obx(() {
                    return Visibility(
                      visible:
                          customerController.organizationDetailsMode.value ==
                              CardMode.edit,
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          PrimaryText(
                            ' ${customerController.address.value}',
                            textOverflow: TextOverflow.clip,
                            fontSize: 18,
                            fontWeight: AppThemes.fontRegular,
                            fontColor: AppColors.textColor,
                          ),
                          PrimaryText(
                            ' ${controller.pincodeController.text}',
                            textOverflow: TextOverflow.clip,
                            fontSize: 18,
                            fontWeight: AppThemes.fontRegular,
                            fontColor: AppColors.textColor,
                          ),
                          PrimaryText(
                            ' ${controller.selectedArea.value}',
                            textOverflow: TextOverflow.clip,
                            fontSize: 18,
                            fontWeight: AppThemes.fontRegular,
                            fontColor: AppColors.textColor,
                          ),
                          PrimaryText(
                            ' ${controller.selectedCity.value}',
                            textOverflow: TextOverflow.clip,
                            fontSize: 18,
                            fontWeight: AppThemes.fontRegular,
                            fontColor: AppColors.textColor,
                          ),
                          PrimaryText(
                            ' ${controller.selectedState.value}',
                            textOverflow: TextOverflow.clip,
                            fontSize: 18,
                            fontWeight: AppThemes.fontRegular,
                            fontColor: AppColors.textColor,
                          ),
                          PrimaryText(
                            ' ${controller.selectedCountry.value}',
                            textOverflow: TextOverflow.clip,
                            fontSize: 18,
                            fontWeight: AppThemes.fontRegular,
                            fontColor: AppColors.textColor,
                          ),
                        ],
                      ),
                    );
                  }),
                  Obx(() {
                    return Visibility(
                      visible:
                          customerController.organizationDetailsMode.value ==
                              CardMode.save,
                      child: const PrimaryText(
                        AppTexts.address,
                        fontSize: 25,
                        fontWeight: AppThemes.fontBold,
                      ),
                    );
                  }),
                  Obx(() {
                    return Visibility(
                      visible:
                          customerController.organizationDetailsMode.value ==
                              CardMode.save,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          PrimaryTextField(
                            label: AppTexts.streetAddressAreaName,
                            controller: TextEditingController(
                              text: customerController.address.value,
                            ),
                            editLabelSize: 20,
                            labelFontSize: 15,
                            isDense: true,
                            obscureText: false.obs,
                            labelColor: AppColors.textColor,
                            cardMode:
                                customerController.organizationDetailsMode,
                            verticalContentPadding: 0,
                            fillColor: AppColors.primaryColor,
                            editTextSize: 18,
                            editLabelWeight: AppThemes.fontSemiBold,
                            keyboardType: TextInputType.phone,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          PrimaryTextField(
                            label: AppTexts.pincode,
                            editLabelSize: 20,
                            controller: controller.pincodeController,
                            labelFontSize: 15,
                            isDense: true,
                            obscureText: false.obs,
                            labelColor: AppColors.textColor,
                            cardMode:
                                customerController.organizationDetailsMode,
                            verticalContentPadding: 0,
                            fillColor: AppColors.primaryColor,
                            editTextSize: 18,
                            editLabelWeight: AppThemes.fontSemiBold,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: const PrimaryText(
                              AppTexts.area,
                              fontSize: 20,
                              fontWeight: AppThemes.fontRegular,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Obx(() {
                            return PrimaryDropDownButton(
                              cardMode:
                                  customerController.organizationDetailsMode,
                              onChanged: (val) {
                                controller.selectedArea.value = val;
                              },
                              items: controller.orgAreaDropDownItems
                                  .map(
                                    (e) => DropdownMenuItem(
                                      alignment: Alignment.centerLeft,
                                      value: e,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: PrimaryText(
                                          e,
                                          fontColor: AppColors.textColor,
                                          fontSize: 18,
                                          fontWeight: AppThemes.fontRegular,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              dropdownColor: AppColors.whiteColor,
                              label: AppTexts.area,
                              editLabelColor: AppColors.textColor,
                              isDense: true,
                              editLabelSize: 18,
                              viewLabelSize: 20,
                              viewLabelWeight: AppThemes.fontSemiBold,
                            );
                          }),
                          const SizedBox(height: 16),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: PrimaryText(
                              AppTexts.city,
                              fontSize: 20,
                              fontWeight: AppThemes.fontRegular,
                            ),
                          ),
                          const SizedBox(height: 8),
                          PrimaryDropDownButton(
                            cardMode:
                                customerController.organizationDetailsMode,
                            onChanged: (val) {
                              controller.selectedCity.value = val;
                            },
                            items: controller.orgCityDropDownItems
                                .map(
                                  (e) => DropdownMenuItem(
                                    alignment: Alignment.centerLeft,
                                    value: e,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: PrimaryText(
                                        e,
                                        fontColor: AppColors.textColor,
                                        fontSize: 18,
                                        fontWeight: AppThemes.fontRegular,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            dropdownColor: AppColors.whiteColor,
                            label: AppTexts.city,
                            isDense: true,
                            editLabelColor: AppColors.textColor,
                            editLabelSize: 18,
                            viewLabelSize: 20,
                            viewLabelWeight: AppThemes.fontSemiBold,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: PrimaryText(
                              AppTexts.state,
                              fontSize: 20,
                              fontWeight: AppThemes.fontRegular,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Obx(() {
                            return PrimaryDropDownButton(
                              cardMode:
                                  customerController.organizationDetailsMode,
                              onChanged: (val) {
                                controller.selectedState.value = val;
                              },
                              items: controller.orgStateDropDownItems
                                  .map(
                                    (e) => DropdownMenuItem(
                                      alignment: Alignment.centerLeft,
                                      value: e,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: PrimaryText(
                                          e,
                                          fontColor: AppColors.textColor,
                                          fontSize: 18,
                                          fontWeight: AppThemes.fontRegular,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              dropdownColor: AppColors.whiteColor,
                              label: AppTexts.state,
                              editLabelColor: AppColors.textColor,
                              isDense: true,
                              editLabelSize: 18,
                              viewLabelSize: 20,
                              viewLabelWeight: AppThemes.fontSemiBold,
                            );
                          }),
                          const SizedBox(height: 16),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: PrimaryText(
                              AppTexts.country,
                              fontSize: 20,
                              fontWeight: AppThemes.fontRegular,
                            ),
                          ),
                          const SizedBox(height: 8),
                          PrimaryDropDownButton(
                            cardMode:
                                customerController.organizationDetailsMode,
                            onChanged: (val) {
                              controller.selectedCountry.value = val;
                            },
                            items: controller.orgCountryDropDownItems
                                .map(
                                  (e) => DropdownMenuItem(
                                    alignment: Alignment.centerLeft,
                                    value: e,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: PrimaryText(
                                        e,
                                        fontColor: AppColors.textColor,
                                        fontSize: 18,
                                        fontWeight: AppThemes.fontRegular,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            dropdownColor: AppColors.whiteColor,
                            label: AppTexts.country,
                            isDense: true,
                            editLabelColor: AppColors.textColor,
                            editLabelSize: 18,
                            viewLabelSize: 20,
                            viewLabelWeight: AppThemes.fontSemiBold,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          PrimaryButton(
                            title: AppTexts.save,
                            fontColor: AppColors.whiteColor,
                            fontWeight: AppThemes.fontRegular,
                            fontSize: 20,
                            buttonColor: AppColors.primaryColor,
                            widthFactor: 1,
                            onTap: () {
                              customerController.organizationDetailsMode.value =
                                  CardMode.save;
                            },
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  Obx(() {
                    return Visibility(
                      visible:
                          customerController.organizationDetailsMode.value ==
                              CardMode.edit,
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PrimaryText(
                            AppTexts.branchesDetail,
                            fontWeight: AppThemes.fontBold,
                            fontSize: 25,
                          ),
                          PrimaryText(
                            "1/1",
                            fontWeight: AppThemes.fontBold,
                            fontSize: 20,
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  Obx(() {
                    return Visibility(
                      visible:
                          customerController.organizationDetailsMode.value ==
                              CardMode.edit,
                      child: FlexibleCard(
                        cardColor: AppColors.whiteColor,
                        elevation: 0.8,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 15,
                            color: AppColors.gray200Color,
                          ),
                        ],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    AppImages.dummyImageRectangle,
                                    width: 85,
                                    height: 85,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      PrimaryText(
                                        customerController.branchName.value,
                                        fontWeight: AppThemes.fontRegular,
                                        fontSize: 20,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      PrimaryText(
                                        ' ${controller.organizationName.text}',
                                        fontWeight: AppThemes.fontRegular,
                                        fontSize: 18,
                                        fontColor: AppColors.textColor,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const PrimaryText(
                                  AppTexts.adminSemicolon,
                                  fontSize: 20,
                                  fontWeight: AppThemes.fontRegular,
                                ),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  children: [
                                    PrimaryText(
                                      ' ${customerController.adminFirstName.value}',
                                      fontSize: 20,
                                      fontWeight: AppThemes.fontRegular,
                                      fontColor: AppColors.textColor,
                                    ),
                                    PrimaryText(
                                      ' ${customerController.adminLastName.value}',
                                      fontSize: 20,
                                      fontWeight: AppThemes.fontRegular,
                                      fontColor: AppColors.textColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const PrimaryText(
                                  AppTexts.contactNoSemicolon,
                                  fontSize: 20,
                                  fontWeight: AppThemes.fontRegular,
                                ),
                                PrimaryText(
                                  ' ${customerController.branchMobile.value}',
                                  fontSize: 20,
                                  fontWeight: AppThemes.fontRegular,
                                  fontColor: AppColors.textColor,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const PrimaryText(
                                  AppTexts.sizeSemicolon,
                                  fontSize: 20,
                                  fontWeight: AppThemes.fontRegular,
                                ),
                                PrimaryText(
                                  // ' ${controller.size.value}',
                                  "",
                                  fontSize: 20,
                                  fontWeight: AppThemes.fontRegular,
                                  fontColor: AppColors.textColor,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const PrimaryText(
                                  AppTexts.gstNoSemicolon,
                                  fontSize: 20,
                                  fontWeight: AppThemes.fontRegular,
                                ),
                                PrimaryText(
                                  ' ${customerController.gstIn.value}',
                                  fontSize: 20,
                                  fontWeight: AppThemes.fontRegular,
                                  fontColor: AppColors.textColor,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: AppColors.primaryColor,
                                ),
                                PrimaryText(
                                  ' ${customerController.branchAddress.value}',
                                  fontSize: 20,
                                  fontWeight: AppThemes.fontRegular,
                                  textOverflow: TextOverflow.clip,
                                  fontColor: AppColors.textColor,
                                ),
                                PrimaryText(
                                  ' ${controller.selectedState.value}',
                                  fontSize: 20,
                                  fontWeight: AppThemes.fontRegular,
                                  textOverflow: TextOverflow.clip,
                                  fontColor: AppColors.textColor,
                                ),
                                PrimaryText(
                                  ' ${controller.pincodeController.text}',
                                  fontSize: 20,
                                  fontWeight: AppThemes.fontRegular,
                                  textOverflow: TextOverflow.clip,
                                  fontColor: AppColors.textColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  Obx(() {
                    return Visibility(
                      visible:
                          customerController.organizationDetailsMode.value ==
                              CardMode.edit,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => DevicesPage());
                        },
                        child: const ListTile(
                          title: PrimaryText(
                            AppTexts.viewDevice,
                            fontWeight: AppThemes.fontBold,
                            fontSize: 25,
                            textAlign: TextAlign.left,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.black800Color,
                          ),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
              //
            ),
          ),
        ),
      ),
    );
  }

  void onClick() {
    if (customerController.organizationDetailsMode.value == CardMode.edit) {
      customerController.organizationDetailsMode.value = CardMode.save;
      saveBtnCallback(
        visibility: true,
        canGoNext: isNextDetailsFilled,
      );
    } else if (customerController.organizationDetailsMode.value ==
        CardMode.save) {
      //undoFormChanges();
      customerController.organizationDetailsMode.value = CardMode.edit;
      saveBtnCallback(
        visibility: false,
        canGoNext: isNextDetailsFilled,
      );
    }
  }

  void saveBtnCallback({required bool visibility, required canGoNext}) {}

  get isNextDetailsFilled => null;
}
