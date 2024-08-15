import 'package:go_desk_workplace/common/base/abstracts/services/i_base_service.dart';
import 'package:go_desk_workplace/common/base/models/base_response_model.dart';
import 'package:go_desk_workplace/models/Asset_list_model.dart';
import 'package:go_desk_workplace/models/add_asset_request_model.dart';
import 'package:go_desk_workplace/models/assets/asset_master_list_model.dart';

abstract class IDevicesApiService extends IBaseService{
  Future <BaseResponseModel<AssetMasterListItemModel?>> getAssetDetails(String serialNo);

  Future<BaseResponseModel<AddAssetItemModel?>> addAsset(addAssetModel);
}