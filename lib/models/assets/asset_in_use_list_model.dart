
import 'package:go_desk_workplace/models/assets/asset_master_list_model.dart';
import 'package:go_desk_workplace/models/assets/asset_master_list_model.dart';
import 'package:go_desk_workplace/models/assets/asset_master_list_model.dart';
import 'package:go_desk_workplace/models/assets/asset_master_list_model.dart';
import 'package:go_desk_workplace/models/configurations/configuration_model.dart';

import 'package:go_desk_workplace/models/configurations/configuration_model.dart';
import 'package:go_desk_workplace/models/assets/asset_in_use_customer_details_model.dart';

class AssetInUseListModel {
  AssetInUseListModel({
    List<AssetInUseListItemModel>? data,
  }) {
    _data = data;
  }

  AssetInUseListModel.fromList(List<dynamic>? lst) {
    if (lst != null && lst.isNotEmpty) {
      _data = [];
      for (var v in lst) {
        _data?.add(AssetInUseListItemModel.fromJson(v));
      }
    }
  }

  AssetInUseListModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(AssetInUseListItemModel.fromJson(v));
      });
    }
  }

  List<AssetInUseListItemModel>? _data;

  List<AssetInUseListItemModel>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class AssetInUseListItemModel {
  AssetInUseListItemModel({
      String? id, 
      String? serialNo, 
      AssetMasterListItemModel? assetMasterDetails,
      ConfigurationModel? statusDetails,
      AssetInUseCustomerDetailsModel? customerDetails,
      String? createdAt,}){
    _id = id;
    _serialNo = serialNo;
    _assetMasterDetails = assetMasterDetails;
    _statusDetails = statusDetails;
    _customerDetails = customerDetails;
    _createdAt = createdAt;
}

  AssetInUseListItemModel.fromJson(dynamic json) {
    _id = json['id'];
    _serialNo = json['serialNo'];
    _assetMasterDetails = json['assetMasterDetails'] != null ? AssetMasterListItemModel.fromJson(json['assetMasterDetails']) : null;
    _statusDetails = json['statusDetails'] != null ? ConfigurationModel.fromJson(json['statusDetails']) : null;
    _customerDetails = json['customerDetails'];
    _createdAt = json['createdAt'];
  }
  String? _id;
  String? _serialNo;
  AssetMasterListItemModel? _assetMasterDetails;
  ConfigurationModel? _statusDetails;
  AssetInUseCustomerDetailsModel? _customerDetails;
  String? _createdAt;

  String? get id => _id;
  String? get serialNo => _serialNo;
  AssetMasterListItemModel? get assetMasterDetails => _assetMasterDetails;
  ConfigurationModel? get statusDetails => _statusDetails;
  AssetInUseCustomerDetailsModel? get customerDetails => _customerDetails;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['serialNo'] = _serialNo;
    if (_assetMasterDetails != null) {
      map['assetMasterDetails'] = _assetMasterDetails?.toJson();
    }
    if (_statusDetails != null) {
      map['statusDetails'] = _statusDetails?.toJson();
    }
    map['customerDetails'] = _customerDetails;
    map['createdAt'] = _createdAt;
    return map;
  }

}