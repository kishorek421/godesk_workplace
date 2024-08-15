import 'package:go_desk_workplace/models/assets/asset_type_list_model.dart';

class AssetSubTypeListModel {
  AssetSubTypeListModel({
    List<AssetSubTypeListItemModel>? data,
  }) {
    _data = data;
  }

  AssetSubTypeListModel.fromList(List<dynamic>? lst) {
    if (lst != null && lst.isNotEmpty) {
      _data = [];
      for (var v in lst) {
        _data?.add(AssetSubTypeListItemModel.fromJson(v));
      }
    }
  }

  AssetSubTypeListModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(AssetSubTypeListItemModel.fromJson(v));
      });
    }
  }

  List<AssetSubTypeListItemModel>? _data;

  List<AssetSubTypeListItemModel>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class AssetSubTypeListItemModel {
  AssetSubTypeListItemModel({
      this.id, 
      this.name, 
      this.code, 
      this.description, 
      this.assetTypeId, 
      this.createdAt, 
      this.modifiedAt, 
      this.createdBy, 
      this.modifiedBy, 
      this.isActive,
  });

  AssetSubTypeListItemModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    description = json['description'];
    assetTypeId = json['assetTypeId'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'];
    isActive = json['isActive'];
    if (json['assetTypeDetails'] != null) {
      assetTypeDetails = AssetTypeListItemModel.fromJson(json['assetTypeDetails']);
    }
  }
  String? id;
  String? name;
  String? code;
  String? description;
  String? assetTypeId;
  AssetTypeListItemModel? assetTypeDetails;
  String? createdAt;
  String? modifiedAt;
  String? createdBy;
  String? modifiedBy;
  String? isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['code'] = code;
    map['description'] = description;
    map['assetTypeId'] = assetTypeId;
    map['createdAt'] = createdAt;
    map['modifiedAt'] = modifiedAt;
    map['createdBy'] = createdBy;
    map['modifiedBy'] = modifiedBy;
    map['isActive'] = isActive;
    return map;
  }

}