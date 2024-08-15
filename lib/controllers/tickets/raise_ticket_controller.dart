import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/base/models/base_response_model.dart';
import 'package:go_desk_workplace/models/tickets/raise_ticket_request_model.dart';
import 'package:go_desk_workplace/models/tickets/ticket_list_model.dart';
import 'package:go_desk_workplace/services/api/assets/assets_api_service.dart';
import 'package:go_desk_workplace/services/api/tickets/tickets_api_service.dart';

class RaiseTicketController extends GetxController {
  var apiService = TicketsApiService();
  var assetApiService = AssetsApiService();

  var descTEController = TextEditingController();

  var assetImagePaths = List<String>.empty(growable: true).obs;

  final assetsInUseOptionsValueAndId = <String, String>{}.obs;
  final assetsInUseOptionsIdAndValue = <String, String>{}.obs;

  final assetTypesOptionsValueAndId = <String, String>{}.obs;
  final assetTypesOptionsIdAndValue = <String, String>{}.obs;

  final assetModelsOptionsValueAndId = <String, String>{}.obs;
  final assetModelsOptionsIdAndValue = <String, String>{}.obs;

  final issueTypesOptionsValueAndId = <String, String>{}.obs;
  final issueTypesOptionsIdAndValue = <String, String>{}.obs;

  final selectedAssetId = "".obs;
  final selectedAssetTypeId = "".obs;
  final selectedAssetModelId = "".obs;
  final selectedIssueTypeId = "".obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAssets();
    fetchIssueTypes();
  }

  String? validateFields() {
    if (selectedAssetId.isEmpty) {
      return "Please choose a asset";
    }

    if (selectedIssueTypeId.isEmpty) {
      return "Please choose a issue type";
    }

    if (assetImagePaths.isEmpty) {
      return "Please choose a asset image";
    }

    if (descTEController.text.isEmpty || descTEController.text.length <= 20) {
      return "Description must be at least 20 characters";
    }

    return null;
  }

  Future<BaseResponseModel<TicketListItemModel?>> raiseTicket() async {
    isLoading.value = true;
    return apiService.raiseTicket(RaiseTicketRequestModel(
      assetId: selectedAssetId.value,
      issueType: selectedIssueTypeId.value,
      description: descTEController.text,
      assetImages: assetImagePaths,
    ));
  }

  fetchAssets() async {
    assetsInUseOptionsValueAndId.clear();
    assetsInUseOptionsIdAndValue.clear();
    var response = await assetApiService.getAssetInUseList();
    if (response.success) {
      var data = response.data?.data;
      if (data != null) {
        for (var assetSubTypeItemModel in data) {
          var id = assetSubTypeItemModel.id;
          var serialNo = assetSubTypeItemModel.serialNo;

          if (id != null && serialNo != null) {
            assetsInUseOptionsValueAndId[serialNo] = id;
            assetsInUseOptionsIdAndValue[id] = serialNo;
          }
        }
      }
    }
  }

  fetchAssetTypes() async {
    assetTypesOptionsValueAndId.clear();
    assetTypesOptionsIdAndValue.clear();
    var response = await assetApiService.getAssetTypeList();
    if (response.success) {
      var data = response.data?.data;
      if (data != null) {
        for (var d in data) {
          var id = d.id;
          var name = d.name;
          if (id != null && name != null) {
            assetTypesOptionsValueAndId[name] = id;
            assetTypesOptionsIdAndValue[id] = name;
          }
        }
      }
    }
  }

  fetchAssetModels() async {
    assetModelsOptionsValueAndId.clear();
    assetModelsOptionsIdAndValue.clear();
    var response = await assetApiService.getAssetTypeList();
    if (response.success) {
      var data = response.data?.data;
      if (data != null) {
        for (var d in data) {
          var id = d.id;
          var name = d.name;
          if (id != null && name != null) {
            assetModelsOptionsValueAndId[name] = id;
            assetModelsOptionsIdAndValue[id] = name;
          }
        }
      }
    }
  }

  fetchIssueTypes() async {
    issueTypesOptionsValueAndId.clear();
    issueTypesOptionsIdAndValue.clear();
    var response = await assetApiService.getIssueTypesList();
    if (response.success) {
      var data = response.data?.data;
      if (data != null) {
        for (var d in data) {
          var id = d.id;
          var name = d.name;
          if (id != null && name != null) {
            issueTypesOptionsValueAndId[name] = id;
            issueTypesOptionsIdAndValue[id] = name;
          }
        }
      }
    }
  }
}
