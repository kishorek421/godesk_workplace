import 'dart:io';

import 'package:get/get.dart';
import 'package:go_desk_workplace/common/base/abstracts/services/i_base_service.dart';
import 'package:go_desk_workplace/common/base/models/base_response_model.dart';
import 'package:go_desk_workplace/common/constants/api_endpoints.dart';
import 'package:go_desk_workplace/models/customer_lead/customer_lead_details_model.dart';
import 'package:go_desk_workplace/services/api/customer_lead/i_customer_lead_api_service.dart';

class CustomerLeadApiService extends ICustomerLeadApiService {
  @override
  Future<BaseResponseModel<CustomerLeadDetailsModel?>>
      getCustomerLeadDetailsById() async {
    var token = await getToken();

    if (token == null) {
      return BaseResponseModel(
        status: 401,
        message: "Failed to fetch token",
        success: false,
      );
    }
    var response = await get(
      ApiEndpoints.getCustomerLeadDetailsById,
      headers: {"Authorization": "Bearer $token"},
    );
    var body = response.body ?? {};
    var success = body["success"];
    var data = body["data"];

    if (response.hasError ||
        success == null ||
        data == null ||
        !(success as bool)) {
      return handleErrorResponse<CustomerLeadDetailsModel>(body);
    } else {
      return BaseResponseModel<CustomerLeadDetailsModel?>(
        success: true,
        data: CustomerLeadDetailsModel.fromJson(data),
      );
    }
  }

  @override
  Future<BaseResponseModel<CustomerLeadDetailsModel?>>
      updateCustomerLeadDetails(CustomerLeadDetailsModel updateCustomerLeadData,
          String? orgImagePath, bool isNew) async {
    var token = await getToken();

    if (token == null) {
      return BaseResponseModel(
        status: 401,
        message: "Failed to fetch token",
        success: false,
      );
    }

    var customerLeadId = await getCustomerLeadId();

    if (customerLeadId == null) {
      return BaseResponseModel(
        status: 401,
        message: "Failed to fetch customer details",
        success: false,
      );
    }

    var requestData = FormData({
      "firstName": updateCustomerLeadData.firstName,
      "lastName": updateCustomerLeadData.lastName,
      "email": updateCustomerLeadData.email,
      "mobile": updateCustomerLeadData.mobile,
      "alternateMobile": updateCustomerLeadData.alternateMobile,
      "orgName": updateCustomerLeadData.orgName,
      "orgMobile": updateCustomerLeadData.orgMobile,
      "address": updateCustomerLeadData.address,
      "areaId": updateCustomerLeadData.areaId,
      "cityId": updateCustomerLeadData.cityId,
      "stateId": updateCustomerLeadData.stateId,
      "pincodeId": updateCustomerLeadData.pincodeId,
      "countryId": updateCustomerLeadData.countryId,
      "categoryOfOrg": updateCustomerLeadData.categoryOfOrgId,
      "sizeOfOrg": updateCustomerLeadData.sizeOfOrgId,
      "typeOfOrg": updateCustomerLeadData.typeOfOrgId,
      "gstin": updateCustomerLeadData.gstin,
      "msmeNo": updateCustomerLeadData.msmeNo,
      "description": updateCustomerLeadData.description,
      "orgImageFile": orgImagePath != null
          ? MultipartFile(
              File(orgImagePath),
              filename: 'orgImage.png',
              contentType: "multipart/form-data",
            )
          : null,
      "isCustomerLead": !isNew,
    });

    try {
      // var params = "id=$customerLeadId";
      var response = await post(
        ApiEndpoints.createCustomer,
        requestData,
        headers: {"Authorization": "Bearer $token"},
      );
      var body = response.body ?? {};
      var success = body["success"];
      var data = body["data"];

      if (response.hasError ||
          success == null ||
          data == null ||
          !(success as bool)) {
        return handleErrorResponse<CustomerLeadDetailsModel>(body);
      } else {
        return BaseResponseModel<CustomerLeadDetailsModel?>(
          success: true,
          data: CustomerLeadDetailsModel.fromJson(data),
        );
      }
    } catch (e) {
      e.printError();
      return handleErrorResponse<CustomerLeadDetailsModel>(
          {"message": "Failed to update your details"});
    }
  }
}
