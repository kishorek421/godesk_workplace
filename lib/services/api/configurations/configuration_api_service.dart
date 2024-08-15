import 'package:go_desk_workplace/common/base/abstracts/services/i_base_service.dart';
import 'package:go_desk_workplace/common/base/models/base_response_model.dart';
import 'package:go_desk_workplace/common/constants/api_endpoints.dart';
import 'package:go_desk_workplace/models/configurations/configurations_list_by_category_key_in_model.dart';
import 'package:go_desk_workplace/models/configurations/configurations_list_by_category_key_model.dart';
import 'package:go_desk_workplace/services/api/configurations/i_configuration_api_service.dart';

class ConfigurationApiService extends IConfigurationsApiService {
  @override
  Future<BaseResponseModel<ConfigurationsListByCategoryInModel?>>
      getConfigurationsListByCategoryKeyIn(List<String> categoryKeys) async {
    var token = await getToken();

    if (token == null) {
      return BaseResponseModel(
        status: 401,
        message: "Failed to fetch token",
        success: false,
      );
    }

    var params = "categories=$categoryKeys";

    var response = await get(
      "${ApiEndpoints.getConfigurationsListByCategoryIn}?$params",
      headers: {"Authorization": "Bearer $token"},
    );
    var body = response.body ?? {};
    var data = body["data"];
    var success = body["success"];
    if (response.status.hasError ||
        success == null && !(success as bool) ||
        data == null) {
      return handleErrorResponse<ConfigurationsListByCategoryInModel>(body);
    } else {
      return BaseResponseModel(
        data: ConfigurationsListByCategoryInModel.fromList(data),
      );
    }
  }

  @override
  Future<BaseResponseModel<ConfigurationsListByCategoryKeyModel?>>
      getConfigurationsByCategoryKey(String categoryKey) async {
    var token = await getToken();

    if (token == null) {
      return BaseResponseModel(
        status: 401,
        message: "Failed to fetch token",
        success: false,
      );
    }

    var params = "category=$categoryKey";

    var response = await get(
      "${ApiEndpoints.getConfigurationsByCategory}?$params",
      headers: {"Authorization": "Bearer $token"},
    );
    var body = response.body ?? {};
    var data = body["data"];
    var success = body["success"];
    if (response.status.hasError ||
        success == null && !(success as bool) ||
        data == null) {
      return handleErrorResponse<ConfigurationsListByCategoryKeyModel>(body);
    } else {
      return BaseResponseModel(
        data: ConfigurationsListByCategoryKeyModel.fromList(data),
      );
    }
  }
}
