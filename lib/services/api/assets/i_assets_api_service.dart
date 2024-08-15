import 'package:go_desk_workplace/common/base/abstracts/services/i_base_service.dart';
import 'package:go_desk_workplace/common/base/models/base_response_model.dart';
import 'package:go_desk_workplace/models/assets/asset_in_use_list_model.dart';
import 'package:go_desk_workplace/models/assets/asset_master_list_model.dart';
import 'package:go_desk_workplace/models/assets/asset_model_list_model.dart';
import 'package:go_desk_workplace/models/assets/asset_sub_type_list_model.dart';
import 'package:go_desk_workplace/models/assets/asset_type_list_model.dart';
import 'package:go_desk_workplace/models/assets/issue_types_list_model.dart';

abstract class IAssetsApiService extends IBaseService {
  Future<BaseResponseModel<AssetTypeListModel?>> getAssetTypeList();

  Future<BaseResponseModel<AssetSubTypeListModel?>> getAssetSubTypeList();

  Future<BaseResponseModel<AssetModelListModel?>> getAssetModelList();

  Future<BaseResponseModel<AssetInUseListModel?>> getAssetInUseList();

  Future<BaseResponseModel<AssetMasterListModel?>> getAssetMasterList();

  Future<BaseResponseModel<IssueTypesListModel?>> getIssueTypesList();
}
