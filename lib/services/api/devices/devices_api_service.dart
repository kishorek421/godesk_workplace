import 'dart:io';

import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:go_desk_workplace/common/base/abstracts/services/i_base_service.dart';
import 'package:go_desk_workplace/common/base/models/base_response_model.dart';
import 'package:go_desk_workplace/common/constants/api_endpoints.dart';
import 'package:go_desk_workplace/models/assets/asset_master_list_model.dart';
import 'package:go_desk_workplace/services/api/devices/i_devices_api_service.dart';

class DevicesApiService extends IDevicesApiService {
  @override
  Future<BaseResponseModel<AssetMasterListItemModel?>> getAssetDetails(
      String serialNo) async {
    var token = await getToken();

    if (token == null) {
      return BaseResponseModel(
        status: 401,
        message: "Failed to fetch token",
        success: false,
      );
    }
    var params = "status=$serialNo";
    var response = await get(
      "${ApiEndpoints.getAssetDetails}?$params",
      headers: {"Authorization": "Bearer $token"},
    );
    var body = response.body ?? {};
    var data = body["data"];
    var success = body["success"];

    if (response.status.hasError ||
        success == null && !(success as bool) ||
        data == null) {
      return handleErrorResponse<AssetMasterListItemModel>(body);
    } else {
      return BaseResponseModel(
        data: AssetMasterListItemModel.fromJson(data),
      );
    }
  }

  @override
  Future<BaseResponseModel<AddAssetItemModel?>> addAsset(addAssetModel) async {
    var token = await getToken();

    if (token == null) {
      return BaseResponseModel(
        status: 401,
        message: "Failed to fetch token",
        success: false,
      );
    }
    var iFormData = addAssetModel.toJson();
    var assetImages = addAssetModel.assetImages;
    var files = List<Map<String, MultipartFile>>.empty(growable: true);
    if (assetImages != null && assetImages.isNotEmpty) {
      for (int i = 0; i < assetImages.length; i++) {
        var img = assetImages[i];
        files.add({
          "assetImages": MultipartFile(File(img),
              filename: 'assetImg$i.jpg', contentType: "multipart/form-data")
        });
      }
    }
    iFormData['assetImages'] = files;

    var formData = FormData(iFormData);

    var headers = {"Authorization": "Bearer $token"};

    var response = await post(
      ApiEndpoints.addAsset,
      formData,
      headers: headers,
    );

    var body = response.body ?? {};
    var success = body['success'];
    var data = body['data'];

    if (response.hasError ||
        body == null ||
        success ||
        !(success as bool) ||
        data == null) {
      return handleErrorResponse(body);
    } else {
      return BaseResponseModel(
        status: 201,
        data: AddAssetItemModel.fromJson(data),
      );
    }
  }
}
