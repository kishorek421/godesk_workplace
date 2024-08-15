import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/base/models/base_response_model.dart';
import 'package:go_desk_workplace/common/constants/configurations_constants.dart';
import 'package:go_desk_workplace/models/configurations/configuration_model.dart';
import 'package:go_desk_workplace/models/customer_lead/customer_leads_list_model.dart';
import 'package:go_desk_workplace/models/customer_lead/customer_lead_details_model.dart';
import 'package:go_desk_workplace/models/customer_lead/details/type_of_org_details_model.dart';
import 'package:go_desk_workplace/services/api/configurations/configuration_api_service.dart';
import 'package:go_desk_workplace/services/api/customer_lead/customer_lead_api_service.dart';
import 'package:go_desk_workplace/services/api/geo_location/geo_location_api_servie.dart';

class CustomerLeadController extends GetxController {
  final isLoading = true.obs;

  final apiService = CustomerLeadApiService();
  var configurationApiService = ConfigurationApiService();
  var geoLocationApiService = GeoLocationApiService();

  // text editing controller
  final firstNameTEController = TextEditingController();
  final lastNameTEController = TextEditingController();
  final emailTEController = TextEditingController();
  final mobileTEController = TextEditingController();
  final alternateTEController = TextEditingController();
  final orgNameTEController = TextEditingController();
  final orgMobileTEController = TextEditingController();
  final gstinTEController = TextEditingController();
  final msmeTEController = TextEditingController();
  final descTEController = TextEditingController();
  final orgAddressTEController = TextEditingController();

  var selectedTypeOfOrgId = "".obs;
  var selectedCatOfOrgId = "".obs;
  var selectedSizeOfOrgId = "".obs;
  var pincodeId = "".obs;
  var areaId = "".obs;
  var cityId = "".obs;
  var stateId = "".obs;
  var countryId = "".obs;

  var selectedOrgImagePath = "".obs;

  final countryOptionsValueAndId = <String, String>{}.obs;
  final countryOptionsIdAndValue = <String, String>{}.obs;
  final areaOptionsValueAndId = <String, String>{}.obs;
  final areaOptionsIdAndValue = <String, String>{}.obs;
  final cityOptionsValueAndId = <String, String>{}.obs;
  final cityOptionsIdAndValue = <String, String>{}.obs;
  final stateOptionsValueAndId = <String, String>{}.obs;
  final stateOptionsIdAndValue = <String, String>{}.obs;
  final typeOfOrgOptionsValueAndId = <String, String>{}.obs;
  final typeOfOrgOptionsIdAndValue = <String, String>{}.obs;
  final categoryOfOrgOptionsValueAndId = <String, String>{}.obs;
  final categoryOfOrgOptionsIdAndValue = <String, String>{}.obs;
  final sizeOfOrgOptionsValueAndId = <String, String>{}.obs;
  final sizeOfOrgOptionsIdAndValue = <String, String>{}.obs;
  final pincodeOptionsValueAndId = <String, String>{}.obs;
  final pincodeOptionsIdAndValue = <String, String>{}.obs;

  var customerLeadDetails = CustomerLeadDetailsModel().obs;

  fetchDropdownsData() async {
    isLoading.value = true;
    await fetchTypeOfOrgList();
    await fetchCategoryOfOrgList();
    await fetchSizeOfOrgList();
    await fetchCountries();
    await fetchAreasList();
    await fetchCitiesList();
    await fetchStatesList();
    await fetchPincodesList();
    isLoading.value = false;
  }

  setInitialFormData(CustomerLeadDetailsModel customerLeadDetailsModel) {
    firstNameTEController.text = customerLeadDetailsModel.firstName ?? "";
    lastNameTEController.text = customerLeadDetailsModel.lastName ?? "";
    emailTEController.text = customerLeadDetailsModel.email ?? "";
    mobileTEController.text = customerLeadDetailsModel.mobile ?? "";
    alternateTEController.text = customerLeadDetailsModel.alternateMobile ?? "";
    orgNameTEController.text = customerLeadDetailsModel.orgName ?? "";
    orgMobileTEController.text = customerLeadDetailsModel.orgMobile ?? "";

    selectedTypeOfOrgId.value =
        customerLeadDetailsModel.typeOfOrgDetails?.id ?? "";
    selectedCatOfOrgId.value =
        customerLeadDetailsModel.categoryOfOrgDetails?.id ?? "";
    selectedSizeOfOrgId.value =
        customerLeadDetailsModel.sizeOfOrgDetails?.id ?? "";

    gstinTEController.text = customerLeadDetailsModel.gstin ?? "";
    msmeTEController.text = customerLeadDetailsModel.msmeNo ?? "";
    descTEController.text = customerLeadDetailsModel.description ?? "";
    orgAddressTEController.text = customerLeadDetailsModel.address ?? "";

    pincodeId.value = customerLeadDetailsModel.pincodeDetails?.id ?? "";
    areaId.value = customerLeadDetailsModel.areaDetails?.id ?? "";
    cityId.value = customerLeadDetailsModel.cityDetails?.id ?? "";
    stateId.value = customerLeadDetailsModel.stateDetails?.id ?? "";
    countryId.value = customerLeadDetailsModel.countryDetails?.id ?? "";

    selectedOrgImagePath.value = customerLeadDetailsModel.orgImage ?? "";
  }

  Future<CustomerLeadDetailsModel?> fetchCustomerLeadsById(
      bool isSetData) async {
    try {
      var response = await apiService.getCustomerLeadDetailsById();
      var data = response.data;
      if (response.success && data != null) {
        customerLeadDetails.value = data;
        if (isSetData) {
          setInitialFormData(data);
        }
        return data;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  fetchSizeOfOrgList() async {
    sizeOfOrgOptionsValueAndId.clear();
    sizeOfOrgOptionsIdAndValue.clear();
    var response = await configurationApiService.getConfigurationsByCategoryKey(
        ConfigurationsConstants.sizeOfOrgCategory);
    if (response.success) {
      var data = response.data?.data;
      if (data != null) {
        try {
          for (var sizeOfOrgDetails in data) {
            var id = sizeOfOrgDetails.id;
            var title = sizeOfOrgDetails.value;
            if (id != null &&
                title != null &&
                !sizeOfOrgOptionsValueAndId.keys.contains(title)) {
              sizeOfOrgOptionsValueAndId[title] = id;
              sizeOfOrgOptionsIdAndValue[id] = title;
            }
          }
        } catch (e) {
          log(e.toString());
        }
      }
    }
  }

  fetchCategoryOfOrgList() async {
    categoryOfOrgOptionsValueAndId.clear();
    categoryOfOrgOptionsIdAndValue.clear();
    var response = await configurationApiService.getConfigurationsByCategoryKey(
        ConfigurationsConstants.categoryOfOrgCategory);
    if (response.success) {
      var data = response.data?.data;
      if (data != null) {
        try {
          for (var categoryOfOrgDetails in data) {
            var id = categoryOfOrgDetails.id;
            var title = categoryOfOrgDetails.value;
            if (id != null &&
                title != null &&
                !categoryOfOrgOptionsValueAndId.keys.contains(title)) {
              categoryOfOrgOptionsValueAndId[title] = id;
              categoryOfOrgOptionsIdAndValue[id] = title;
            }
          }
        } catch (e) {
          log(e.toString());
        }
      } else {
        log("No data found.");
      }
    } else {
      log("Failed to fetch countries: ${response.message}");
    }
  }

  fetchTypeOfOrgList() async {
    typeOfOrgOptionsValueAndId.clear();
    typeOfOrgOptionsIdAndValue.clear();
    var response = await configurationApiService.getConfigurationsByCategoryKey(
        ConfigurationsConstants.typeOfOrgCategory);
    // log('API Response: ${response.toString()}');
    if (response.success) {
      var data = response.data?.data;
      if (data != null) {
        try {
          for (var typeOfOrgDetails in data) {
            var id = typeOfOrgDetails.id;
            var title = typeOfOrgDetails.value;
            if (id != null &&
                title != null &&
                !typeOfOrgOptionsValueAndId.keys.contains(title)) {
              typeOfOrgOptionsValueAndId[title] = id;
              typeOfOrgOptionsIdAndValue[id] = title;
            }
          }
        } catch (e) {
          log(e.toString());
        }
      } else {
        log("No data found.");
      }
    } else {
      log("Failed to fetch countries: ${response.message}");
    }
  }

  fetchStatesList() async {
    stateOptionsValueAndId.clear();
    stateOptionsIdAndValue.clear();
    var response = await geoLocationApiService.getStateList();
    if (response.success) {
      var data = response.data?.data;
      if (data != null) {
        try {
          for (var stateDetails in data) {
            var id = stateDetails.id;
            var title = stateDetails.stateName;
            if (id != null &&
                title != null &&
                !stateOptionsValueAndId.keys.contains(title)) {
              stateOptionsValueAndId[title] = id;
              stateOptionsIdAndValue[id] = title;
            }
          }
        } catch (e) {
          log(e.toString());
        }
      } else {
        log("No data found.");
      }
    } else {
      log("Failed to fetch countries: ${response.message}");
    }
  }

  fetchCitiesList() async {
    cityOptionsValueAndId.clear();
    cityOptionsIdAndValue.clear();
    var response = await geoLocationApiService.getCityList();
    if (response.success) {
      var data = response.data?.data;
      if (data != null) {
        try {
          for (var cityDetails in data) {
            var id = cityDetails.id;
            var title = cityDetails.cityName;
            if (id != null &&
                title != null &&
                !cityOptionsValueAndId.keys.contains(title)) {
              cityOptionsValueAndId[title] = id;
              cityOptionsIdAndValue[id] = title;
            }
          }
        } catch (e) {
          log(e.toString());
        }
      } else {
        log("No data found.");
      }
    } else {
      log("Failed to fetch countries: ${response.message}");
    }
  }

  fetchCountries() async {
    countryOptionsValueAndId.clear();
    countryOptionsIdAndValue.clear();
    var response = await geoLocationApiService.getCountryList();
    if (response.success) {
      var data = response.data?.data;
      if (data != null) {
        try {
          for (var countryDetails in data) {
            var id = countryDetails.id;
            var title = countryDetails.countryName;
            if (id != null &&
                title != null &&
                !countryOptionsValueAndId.keys.contains(title)) {
              countryOptionsValueAndId[title] = id;
              countryOptionsIdAndValue[id] = title;
            }
          }
        } catch (e) {
          log(e.toString());
        }
      } else {
        log("No data found.");
      }
    } else {
      log("Failed to fetch countries: ${response.message}");
    }
  }

  fetchAreasList() async {
    areaOptionsValueAndId.clear();
    areaOptionsIdAndValue.clear();
    var response = await geoLocationApiService.getAreaList();
    if (response.success) {
      var data = response.data?.details;
      if (data != null) {
        try {
          for (var areaDetails in data) {
            var id = areaDetails.id;
            var title = areaDetails.areaName;
            if (id != null &&
                title != null &&
                !areaOptionsValueAndId.keys.contains(title)) {
              areaOptionsValueAndId[title] = id;
              areaOptionsIdAndValue[id] = title;
            }
          }
        } catch (e) {
          log(e.toString());
        }
      } else {
        log("No data found.");
      }
    } else {
      log("Failed to fetch countries: ${response.message}");
    }
  }

  fetchPincodesList() async {
    pincodeOptionsValueAndId.clear();
    pincodeOptionsIdAndValue.clear();
    var response = await geoLocationApiService.getPincodeList();
    if (response.success) {
      var data = response.data?.data;
      if (data != null) {
        try {
          for (var pincodeDetails in data) {
            var id = pincodeDetails.id;
            var title = pincodeDetails.pincode?.toString();
            if (id != null &&
                title != null &&
                !pincodeOptionsValueAndId.keys.contains(title)) {
              pincodeOptionsValueAndId[title] = id;
              pincodeOptionsIdAndValue[id] = title;
            }
          }
          // Notify listeners
          // update(); // Call this method to notify all listeners
        } catch (e) {
          log(e.toString());
        }
      }
    }
  }

  Future<BaseResponseModel<CustomerLeadDetailsModel?>>
      updateCustomerLeadDetails() {
    isLoading.value = true;
    var customerLeadModel = CustomerLeadDetailsModel(
      firstName: firstNameTEController.text,
      lastName: lastNameTEController.text,
      email: emailTEController.text,
      mobile: mobileTEController.text,
      alternateMobile: alternateTEController.text,
      orgName: orgNameTEController.text,
      orgMobile: orgMobileTEController.text,
      gstin: gstinTEController.text,
      msmeNo: msmeTEController.text,
      description: descTEController.text,
      address: orgAddressTEController.text,
      typeOfOrgId: selectedTypeOfOrgId.value,
      sizeOfOrgId: selectedSizeOfOrgId.value,
      categoryOfOrgId: selectedCatOfOrgId.value,
      pincodeId: pincodeId.value,
      areaId: areaId.value,
      cityId: cityId.value,
      stateId: stateId.value,
      countryId: countryId.value,
    );
    return apiService.updateCustomerLeadDetails(
      customerLeadModel,
      selectedOrgImagePath.value.startsWith("https://")
          ? null
          : selectedOrgImagePath.value,
    );
  }
}
