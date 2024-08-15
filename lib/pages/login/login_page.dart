import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/constants/app_images.dart';
import 'package:go_desk_workplace/common/constants/app_reg_exp.dart';
import 'package:go_desk_workplace/common/constants/app_texts.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';
import 'package:go_desk_workplace/common/constants/configurations_constants.dart';
import 'package:go_desk_workplace/common/constants/storage_constants.dart';
import 'package:go_desk_workplace/common/texts/primary_text.dart';
import 'package:go_desk_workplace/common/enums/card_mode_enum.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_desk_workplace/common/widgets/buttons/primary_button.dart';
import 'package:go_desk_workplace/common/widgets/fields/primary_text_field.dart';
import 'package:go_desk_workplace/controllers/customer_lead/customer_lead_controller.dart';
import 'package:go_desk_workplace/controllers/login/login_controller.dart';
import 'package:go_desk_workplace/pages/home/base_home_page.dart';
import 'package:go_desk_workplace/pages/home/home_page.dart';
import 'package:go_desk_workplace/pages/organization/children/organization_edit_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController loginController = Get.put(LoginController());

  final CustomerLeadController customerLeadController =
      Get.put(CustomerLeadController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
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
          body: Form(
            key: _formKey,
            child: Container(
              height: screenHeight,
              width: screenWidth,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    AppImages.bgTemplate,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              children: [
                                PrimaryText(
                                  AppTexts.welcome,
                                  fontSize: 34,
                                  fontWeight: AppThemes.fontSemiBold,
                                ),
                                SizedBox(width: 4),
                                PrimaryText(
                                  AppTexts.backEmoji,
                                  fontSize: 34,
                                  fontWeight: AppThemes.fontSemiBold,
                                  fontColor: AppColors.primaryColor,
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            const PrimaryText(
                              AppTexts.enterYourDetails,
                              fontSize: 18,
                              fontColor: AppColors.textColor,
                              textOverflow: TextOverflow.clip,
                            ),
                            const SizedBox(height: 50),
                            PrimaryTextField(
                              isDense: false,
                              borderRadius: 10,
                              obscureText: false.obs,
                              keyboardType: TextInputType.emailAddress,
                              verticalContentPadding: 20,
                              label: 'Email',
                              cardMode: CardMode.none.obs,
                              onChanged: (String? value) {
                                if (value != null) {
                                  loginController.email.value = value;
                                }
                              },
                              labelFontSize: 15,
                              editTextSize: 18,
                              labelColor: AppColors.textColor,
                              labelFontWeight: AppThemes.fontRegular,
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your Email ID';
                                } else if (!AppRegExp.mailRegExp
                                    .hasMatch(value)) {
                                  return 'Please enter a valid EmailID';
                                }
                                return null;
                              },
                              hintText: '',
                              hintStyle: null,
                            ),
                            const SizedBox(height: 20),
                            PrimaryTextField(
                              isDense: false,
                              verticalContentPadding: 15,
                              label: "Password",
                              obscureText: loginController.hidePassword,
                              labelFontSize: 15,
                              editTextSize: 18,
                              labelColor: AppColors.textColor,
                              labelFontWeight: AppThemes.fontRegular,
                              onChanged: (String? value) {
                                if (value != null) {
                                  loginController.password.value = value;
                                }
                              },
                              cardMode: CardMode.none.obs,
                              suffix: Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Obx(() {
                                  return InkWell(
                                    onTap: () {
                                      loginController.hidePassword.value =
                                          !loginController.hidePassword.value;
                                    },
                                    child: Icon(
                                      loginController.hidePassword.value
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: AppColors.gray500Color,
                                      size: 18,
                                    ),
                                  );
                                }),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your Password';
                                }
                                // else if (!AppRegExp.password
                                //     .hasMatch(value)) {
                                //   return 'Please enter your Correct Password';
                                // }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
                            const PrimaryText(
                              'forgotPassword',
                              fontSize: 18,
                              fontWeight: AppThemes.fontSemiBold,
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            PrimaryButton(
                              widthFactor: 1,
                              innerVerticalPadding: 15,
                              title: "Login",
                              fontColor: AppColors.whiteColor,
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  _login();
                                }
                              },
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const PrimaryText(
                          AppTexts.haveAccount,
                          fontSize: 18,
                          fontWeight: AppThemes.fontRegular,
                        ),
                        const SizedBox(width: 4),
                        InkWell(
                          onTap: () {
                            Get.to(
                              () => OrganizationEditProfilePage(
                                isNew: true,
                              ),
                            );
                          },
                          child: const PrimaryText(
                            AppTexts.registerNow,
                            fontSize: 18,
                            fontWeight: AppThemes.fontRegular,
                            fontColor: AppColors.blueColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        final loginResponse = await loginController.login(
            loginController.email.value, loginController.password.value);

        if (loginResponse.success) {
          var token = loginResponse.data?.token;
          var refreshToken = loginResponse.data?.refreshToken;

          if (token == null) {
            Fluttertoast.showToast(
                msg: loginResponse.message ?? 'Failed to login');
            return;
          }

          // Navigate to the correct page based on the token
          const FlutterSecureStorage flutterSecureStorage =
              FlutterSecureStorage();
          await flutterSecureStorage.write(
            key: StorageConstants.jwtToken,
            value: token,
          );
          await flutterSecureStorage.write(
            key: StorageConstants.refreshToken,
            value: refreshToken,
          );

          var customerLeadResponse =
              await customerLeadController.fetchCustomerLeadsById(false);

          if (customerLeadResponse != null) {
            if (customerLeadResponse.onBoardingStatusDetails?.key ==
                ConfigurationsConstants.customerLeadActiveKey) {
              await flutterSecureStorage.write(
                  key: StorageConstants.isCustomerActive,
                  value: true.toString());
              Get.off(
                () => const BaseHomePage(),
              );
            } else {
              await flutterSecureStorage.write(
                  key: StorageConstants.isCustomerActive,
                  value: false.toString());
              var customerId = customerLeadResponse.id;
              if (customerId != null) {
                await flutterSecureStorage.write(
                  key: StorageConstants.customerLeadIdKey,
                  value: customerId,
                );
              }
              Get.to(() => OrganizationEditProfilePage(
                    isNew: customerId == null,
                  ));
            }
          } else {
            Get.off(() => OrganizationEditProfilePage(
                  isNew: true,
                ));
          }
        } else {
          // Handle login failure
          Fluttertoast.showToast(
              msg: loginResponse.message ?? 'check the mail are password');
        }
      } catch (e) {
        // Handle any exceptions
        Fluttertoast.showToast(msg: 'Error,An error occurred during login');
      }
    }
  }
}
