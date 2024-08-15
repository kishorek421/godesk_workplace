import 'package:go_desk_workplace/common/base/abstracts/services/i_base_service.dart';
import 'package:go_desk_workplace/common/base/models/base_response_model.dart';
import 'package:go_desk_workplace/models/configurations/configurations_list_by_category_key_in_model.dart';
import 'package:go_desk_workplace/models/configurations/configurations_list_by_category_key_model.dart';

abstract class IConfigurationsApiService extends IBaseService {
  Future<BaseResponseModel<ConfigurationsListByCategoryInModel?>> getConfigurationsListByCategoryKeyIn(List<String> categoryKeys);

  Future<BaseResponseModel<ConfigurationsListByCategoryKeyModel?>> getConfigurationsByCategoryKey(String categoryKey);
}
