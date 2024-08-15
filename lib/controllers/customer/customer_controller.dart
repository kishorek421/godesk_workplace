import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/base/models/base_response_model.dart';
import 'package:go_desk_workplace/common/enums/card_mode_enum.dart';
import 'package:go_desk_workplace/services/api/customer/customer_api_service.dart';

class CustomerController extends GetxController {
  final apiService = CustomerApiService();
  var adminFirstName = "".obs;
  var adminLastName = "".obs;
  var catOfOrg = "".obs;
  var sizeOfOrg = "".obs;
  var gstIn = "".obs;
  var orgName = "".obs;
  var orgMobile = "".obs;
  var typeOfOrg = "".obs;
  var description = "".obs;
  var address = "".obs;
  var orgImage = "".obs;
  var branchName = "".obs;
  var branchMobile = "".obs;
  var branchAddress = "".obs;
  final cardMode = CardMode.edit.obs;
  final organizationDetailsMode = CardMode.edit.obs;
  final profilePath = "".obs;
  final isProfilePathValid = true.obs;

  //Text-Editing-Controllers
  final orgNameTEController = TextEditingController();
  final adminFirstNameTEController = TextEditingController();
  final adminLastNameTEController = TextEditingController();
  final gstInTEController = TextEditingController();
  final descriptionTEController = TextEditingController();
  final orgMobTEController = TextEditingController();
  final addressTEController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchCustomerById();
  }

  fetchCustomerById() async {
    try {
      var response = await apiService.getCustomerDetailsById();
      if (response.success) {
        var customerDetails = response.data;
        if (customerDetails == null) {
          return BaseResponseModel(
            success: false,
            message: "Failed to fetch customer leads: ${response.message}",
            status: 400,
          );
        } else {
          adminFirstName.value = customerDetails.firstName ?? "";
          adminLastName.value = customerDetails.lastName ?? "";
          orgName.value = customerDetails.orgDetails?.name ?? "";
          orgMobile.value = customerDetails.orgDetails?.mobile ?? "";
          gstIn.value = customerDetails.branchDetails?.gstin ?? "";
          description.value = customerDetails.orgDetails?.description ?? "";
          address.value = customerDetails.orgDetails?.address ?? "";
          branchName.value = customerDetails.branchDetails?.name ?? "";
          branchAddress.value = customerDetails.branchDetails?.address ?? "";
          branchMobile.value = customerDetails.branchDetails?.mobile ?? "";
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
