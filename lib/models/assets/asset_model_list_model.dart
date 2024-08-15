
import 'package:go_desk_workplace/models/assets/asset_type_list_model.dart';

class AssetModelListModel {
  AssetModelListModel({
    List<AssetModelListItemModel>? data,
  }) {
    _data = data;
  }

  AssetModelListModel.fromList(List<dynamic>? lst) {
    if (lst != null && lst.isNotEmpty) {
      _data = [];
      for (var v in lst) {
        _data?.add(AssetModelListItemModel.fromJson(v));
      }
    }
  }

  AssetModelListModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(AssetModelListItemModel.fromJson(v));
      });
    }
  }

  List<AssetModelListItemModel>? _data;

  List<AssetModelListItemModel>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class AssetModelListItemModel {
  AssetModelListItemModel({
      String? id, 
      String? modelName, 
      String? modelNumber, 
      String? modelDescription, 
      AssetTypeListItemModel? assetModelParentAssetTypeDetails,}){
    _id = id;
    _modelName = modelName;
    _modelNumber = modelNumber;
    _modelDescription = modelDescription;
    _assetModelParentAssetTypeDetails = assetModelParentAssetTypeDetails;
}

  AssetModelListItemModel.fromJson(dynamic json) {
    _id = json['id'];
    _modelName = json['modelName'];
    _modelNumber = json['modelNumber'];
    _modelDescription = json['modelDescription'];
    _assetModelParentAssetTypeDetails = json['assetModelParentAssetTypeDetails'] != null ? AssetTypeListItemModel.fromJson(json['assetModelParentAssetTypeDetails']) : null;
  }
  String? _id;
  String? _modelName;
  String? _modelNumber;
  String? _modelDescription;
  AssetTypeListItemModel? _assetModelParentAssetTypeDetails;

  String? get id => _id;
  String? get modelName => _modelName;
  String? get modelNumber => _modelNumber;
  String? get modelDescription => _modelDescription;
  AssetTypeListItemModel? get assetModelParentAssetTypeDetails => _assetModelParentAssetTypeDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['modelName'] = _modelName;
    map['modelNumber'] = _modelNumber;
    map['modelDescription'] = _modelDescription;
    if (_assetModelParentAssetTypeDetails != null) {
      map['assetModelParentAssetTypeDetails'] = _assetModelParentAssetTypeDetails?.toJson();
    }
    return map;
  }

}