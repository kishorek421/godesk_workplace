import 'package:get/get.dart';
import 'package:go_desk_workplace/models/assets/asset_master_list_model.dart';
import 'package:go_desk_workplace/services/api/devices/devices_api_service.dart';

class AssetsController extends GetxController {
  var assetsList = List<AssetMasterListItemModel>.empty(growable: true).obs;
  var apiService = DevicesApiService();

  fetchAssetsList(String serialNo) {
    apiService.getAssetDetails(serialNo).then((value) {
      var data = value.data;
      if (data != null) {
        assetsList.value = data as List<AssetMasterListItemModel>;
      }
    });
  }
}
