import 'package:go_desk_workplace/common/base/abstracts/services/i_base_service.dart';
import 'package:go_desk_workplace/common/base/models/base_response_model.dart';
import 'package:go_desk_workplace/common/constants/api_endpoints.dart';
import 'package:go_desk_workplace/models/assets/asset_in_use_list_model.dart';
import 'package:go_desk_workplace/models/assets/asset_master_list_model.dart';
import 'package:go_desk_workplace/models/assets/asset_model_list_model.dart';
import 'package:go_desk_workplace/models/assets/asset_sub_type_list_model.dart';
import 'package:go_desk_workplace/models/assets/asset_type_list_model.dart';
import 'package:go_desk_workplace/models/assets/issue_types_list_model.dart';
import 'package:go_desk_workplace/services/api/assets/i_assets_api_service.dart';

class AssetsApiService extends IAssetsApiService {
  @override
  Future<BaseResponseModel<AssetTypeListModel?>> getAssetTypeList() async {
    var token = await getToken();

    if (token == null) {
      return BaseResponseModel(
        status: 401,
        message: "Failed to fetch token",
        success: false,
      );
    }

    var response = await get(
      ApiEndpoints.getAssetTypeList,
      headers: {"Authorization": "Bearer $token"},
    );

    var body = response.body ?? {};
    var data = body["data"];
    var success = body["success"];
    if (response.status.hasError ||
        success == null && !(success as bool) ||
        data == null) {
      return handleErrorResponse<AssetTypeListModel>(body);
    } else {
      return BaseResponseModel(
        data: AssetTypeListModel.fromList(data),
      );
    }
  }

  @override
  Future<BaseResponseModel<AssetSubTypeListModel?>>
      getAssetSubTypeList() async {
    var token = await getToken();

    if (token == null) {
      return BaseResponseModel(
        status: 401,
        message: "Failed to fetch token",
        success: false,
      );
    }

    var response = await get(
      ApiEndpoints.getAssetSubTypeList,
      headers: {"Authorization": "Bearer $token"},
    );

    var body = response.body ?? {};
    var data = body["data"];
    var success = body["success"];
    if (response.status.hasError ||
        success == null && !(success as bool) ||
        data == null) {
      return handleErrorResponse<AssetSubTypeListModel>(body);
    } else {
      return BaseResponseModel(
        data: AssetSubTypeListModel.fromList(data),
      );
    }
  }

  @override
  Future<BaseResponseModel<AssetInUseListModel?>> getAssetInUseList(String customerId) async {
    var token = await getToken();

    if (token == null) {
      return BaseResponseModel(
        status: 401,
        message: "Failed to fetch token",
        success: false,
      );
    }

    var params = "customerId=$customerId";

    var response = await get(
      "${ApiEndpoints.getAssetIsUseList}?$params",
      headers: {"Authorization": "Bearer $token"},
    );

    var body = response.body ?? {};
    var data = body["data"];
    var success = body["success"];
    if (response.status.hasError ||
        success == null && !(success as bool) ||
        data == null) {
      return handleErrorResponse<AssetInUseListModel>(body);
    } else {
      return BaseResponseModel(
        data: AssetInUseListModel.fromList(data),
      );
    }
  }

  @override
  Future<BaseResponseModel<AssetMasterListModel?>> getAssetMasterList() async {
    var token = await getToken();

    if (token == null) {
      return BaseResponseModel(
        status: 401,
        message: "Failed to fetch token",
        success: false,
      );
    }

    var response = await get(
      ApiEndpoints.getAssetMasterList,
      headers: {"Authorization": "Bearer $token"},
    );

    var body = response.body ?? {};
    var data = body["data"];
    var success = body["success"];
    if (response.status.hasError ||
        success == null && !(success as bool) ||
        data == null) {
      return handleErrorResponse<AssetMasterListModel>(body);
    } else {
      return BaseResponseModel(
        data: AssetMasterListModel.fromList(data),
      );
    }
  }

  @override
  Future<BaseResponseModel<AssetModelListModel?>> getAssetModelList() async {
    var token = await getToken();

    if (token == null) {
      return BaseResponseModel(
        status: 401,
        message: "Failed to fetch token",
        success: false,
      );
    }

    var response = await get(
      ApiEndpoints.getAssetModelList,
      headers: {"Authorization": "Bearer $token"},
    );

    var body = response.body ?? {};
    var data = body["data"];
    var success = body["success"];
    if (response.status.hasError ||
        success == null && !(success as bool) ||
        data == null) {
      return handleErrorResponse<AssetModelListModel>(body);
    } else {
      return BaseResponseModel(
        data: AssetModelListModel.fromList(data),
      );
    }
  }

  @override
  Future<BaseResponseModel<IssueTypesListModel?>> getIssueTypesList() async {
    var token = await getToken();

    if (token == null) {
      return BaseResponseModel(
        status: 401,
        message: "Failed to fetch token",
        success: false,
      );
    }

    var response = await get(
      ApiEndpoints.getIssueTypesList,
      headers: {"Authorization": "Bearer $token"},
    );

    var body = response.body ?? {};
    var data = body["data"];
    var success = body["success"];
    if (response.status.hasError ||
        success == null && !(success as bool) ||
        data == null) {
      return handleErrorResponse<IssueTypesListModel>(body);
    } else {
      return BaseResponseModel(
        data: IssueTypesListModel.fromList(data['content']),
      );
    }
  }
}
