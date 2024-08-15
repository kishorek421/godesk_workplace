import 'package:go_desk_workplace/models/assets/asset_model_list_model.dart';
import 'package:go_desk_workplace/models/assets/asset_type_list_model.dart';
import 'package:go_desk_workplace/models/configurations/configuration_model.dart';

class AssetMasterListModel {
  AssetMasterListModel({
    List<AssetMasterListItemModel>? data,
  }) {
    _data = data;
  }

  AssetMasterListModel.fromList(List<dynamic>? lst) {
    if (lst != null && lst.isNotEmpty) {
      _data = [];
      for (var v in lst) {
        _data?.add(AssetMasterListItemModel.fromJson(v));
      }
    }
  }

  AssetMasterListModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(AssetMasterListItemModel.fromJson(v));
      });
    }
  }

  List<AssetMasterListItemModel>? _data;

  List<AssetMasterListItemModel>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class AssetMasterListItemModel {
  AssetMasterListItemModel({
      String? id, 
      String? serialNo, 
      bool? asWarranty, 
      String? purchaseId, 
      String? oemWarrantyDate, 
      String? extendedWarrantyDate, 
      String? uniqueIdentifier, 
      AssetTypeListItemModel? assetTypeDetails,
      AssetModelListItemModel? assetModelDetails,
      ConfigurationModel? impactDetails,
      ConfigurationModel? assetStatusDetails,
      ConfigurationModel? uniqueIdentifierTypeDetails,
      ConfigurationModel? licensedTypeDetails,}){
    _id = id;
    _serialNo = serialNo;
    _asWarranty = asWarranty;
    _purchaseId = purchaseId;
    _oemWarrantyDate = oemWarrantyDate;
    _extendedWarrantyDate = extendedWarrantyDate;
    _uniqueIdentifier = uniqueIdentifier;
    _assetTypeDetails = assetTypeDetails;
    _assetModelDetails = assetModelDetails;
    _impactDetails = impactDetails;
    _assetStatusDetails = assetStatusDetails;
    _uniqueIdentifierTypeDetails = uniqueIdentifierTypeDetails;
    _licensedTypeDetails = licensedTypeDetails;
}

  AssetMasterListItemModel.fromJson(dynamic json) {
    _id = json['id'];
    _serialNo = json['serialNo'];
    _asWarranty = json['asWarranty'];
    _purchaseId = json['purchaseId'];
    _oemWarrantyDate = json['oemWarrantyDate'];
    _extendedWarrantyDate = json['extendedWarrantyDate'];
    _uniqueIdentifier = json['uniqueIdentifier'];
    _assetTypeDetails = json['assetTypeDetails'] != null ? AssetTypeListItemModel.fromJson(json['assetTypeDetails']) : null;
    _assetModelDetails = json['assetModelDetails'] != null ? AssetModelListItemModel.fromJson(json['assetModelDetails']) : null;
    _impactDetails = json['impactDetails'] != null ? ConfigurationModel.fromJson(json['impactDetails']) : null;
    _assetStatusDetails = json['assetStatusDetails'] != null ? ConfigurationModel.fromJson(json['assetStatusDetails']) : null;
    _uniqueIdentifierTypeDetails = json['uniqueIdentifierTypeDetails'] != null ? ConfigurationModel.fromJson(json['uniqueIdentifierTypeDetails']) : null;
    _licensedTypeDetails = json['licensedTypeDetails'] != null ? ConfigurationModel.fromJson(json['licensedTypeDetails']) : null;
  }
  String? _id;
  String? _serialNo;
  bool? _asWarranty;
  String? _purchaseId;
  String? _oemWarrantyDate;
  String? _extendedWarrantyDate;
  String? _uniqueIdentifier;
  AssetTypeListItemModel? _assetTypeDetails;
  AssetModelListItemModel? _assetModelDetails;
  ConfigurationModel? _impactDetails;
  ConfigurationModel? _assetStatusDetails;
  ConfigurationModel? _uniqueIdentifierTypeDetails;
  ConfigurationModel? _licensedTypeDetails;

  String? get id => _id;
  String? get serialNo => _serialNo;
  bool? get asWarranty => _asWarranty;
  String? get purchaseId => _purchaseId;
  String? get oemWarrantyDate => _oemWarrantyDate;
  String? get extendedWarrantyDate => _extendedWarrantyDate;
  String? get uniqueIdentifier => _uniqueIdentifier;
  AssetTypeListItemModel? get assetTypeDetails => _assetTypeDetails;
  AssetModelListItemModel? get assetModelDetails => _assetModelDetails;
  ConfigurationModel? get impactDetails => _impactDetails;
  ConfigurationModel? get assetStatusDetails => _assetStatusDetails;
  ConfigurationModel? get uniqueIdentifierTypeDetails => _uniqueIdentifierTypeDetails;
  ConfigurationModel? get licensedTypeDetails => _licensedTypeDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['serialNo'] = _serialNo;
    map['asWarranty'] = _asWarranty;
    map['purchaseId'] = _purchaseId;
    map['oemWarrantyDate'] = _oemWarrantyDate;
    map['extendedWarrantyDate'] = _extendedWarrantyDate;
    map['uniqueIdentifier'] = _uniqueIdentifier;
    if (_assetTypeDetails != null) {
      map['assetTypeDetails'] = _assetTypeDetails?.toJson();
    }
    if (_assetModelDetails != null) {
      map['assetModelDetails'] = _assetModelDetails?.toJson();
    }
    if (_impactDetails != null) {
      map['impactDetails'] = _impactDetails?.toJson();
    }
    if (_assetStatusDetails != null) {
      map['assetStatusDetails'] = _assetStatusDetails?.toJson();
    }
    if (_uniqueIdentifierTypeDetails != null) {
      map['uniqueIdentifierTypeDetails'] = _uniqueIdentifierTypeDetails?.toJson();
    }
    if (_licensedTypeDetails != null) {
      map['licensedTypeDetails'] = _licensedTypeDetails?.toJson();
    }
    return map;
  }

}