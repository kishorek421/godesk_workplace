import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/constants/app_images.dart';
import 'package:go_desk_workplace/common/constants/app_texts.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';
import 'package:go_desk_workplace/common/enums/card_mode_enum.dart';
import 'package:go_desk_workplace/common/widgets/fields/primary_drop_down_field.dart';
import 'package:go_desk_workplace/common/texts/primary_text.dart';
import 'package:go_desk_workplace/common/widgets/buttons/primary_button.dart';
import 'package:go_desk_workplace/common/widgets/fields/primary_text_field.dart';
import 'package:go_desk_workplace/controllers/base_controller.dart';

class OrganizationPage extends StatelessWidget {
  OrganizationPage({super.key});

  final controller = Get.put(
    BaseHomePageController(),
  );

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
                          size: 20,
                        ),
                      ),
                      const Expanded(
                        child: PrimaryText(
                          AppTexts.organization,
                          fontSize: 25,
                          fontWeight: AppThemes.fontBold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          width: double.infinity,
                          height: 160,
                          child: Center(
                            child: Image.asset(
                              AppImages.dummyImageField,
                              width: double.infinity,
                              height: 160,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 45,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          color: Colors.white,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: PrimaryButton(
                              title: AppTexts.reUpload,
                              fontSize: 18,
                              fontWeight: AppThemes.fontRegular,
                              fontColor: AppColors.primaryColor,
                              buttonColor: AppColors.cardColor,
                              onTap: () {},
                              widthFactor: 0.35,
                              borderSide: const BorderSide(
                                color: AppColors.primaryColor,
                                width: 1,
                              ),
                              elevation: 0,
                              borderRadius: 5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const PrimaryText(
                    AppTexts.organizationName,
                    fontWeight: AppThemes.fontSemiBold,
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  PrimaryTextField(
                    hintText: AppTexts.organizationName,
                    label: '',
                    hintStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: AppThemes.fontRegular,
                      fontFamily: AppThemes.fontFamilyOpenSans,
                    ),
                    fillColor: AppColors.gray100Color.withOpacity(0.3),
                    cardMode: CardMode.none.obs,
                    obscureText: false.obs,
                    verticalContentPadding: 0,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const PrimaryText(
                    AppTexts.adminName,
                    fontWeight: AppThemes.fontSemiBold,
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  PrimaryTextField(
                    hintText: AppTexts.adminName,
                    label: '',
                    hintStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: AppThemes.fontRegular,
                      fontFamily: AppThemes.fontFamilyOpenSans,
                    ),
                    fillColor: AppColors.gray100Color.withOpacity(0.3),
                    cardMode: CardMode.none.obs,
                    obscureText: false.obs,
                    verticalContentPadding: 0,
                  ),
                  PrimaryDropDownField(
                    fillColor: AppColors.whiteColor,
                    onChanged: (val) {},
                    hint: const Text(
                      AppTexts.selectArea,
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
                    dropdownColor: AppColors.gray200Color,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
