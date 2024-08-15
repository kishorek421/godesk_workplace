class AssetTypeListModel {
  AssetTypeListModel({
    List<AssetTypeListItemModel>? data,
  }) {
    _data = data;
  }

  AssetTypeListModel.fromList(List<dynamic>? lst) {
    if (lst != null && lst.isNotEmpty) {
      _data = [];
      for (var v in lst) {
        _data?.add(AssetTypeListItemModel.fromJson(v));
      }
    }
  }

  AssetTypeListModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(AssetTypeListItemModel.fromJson(v));
      });
    }
  }

  List<AssetTypeListItemModel>? _data;

  List<AssetTypeListItemModel>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class AssetTypeListItemModel {
  AssetTypeListItemModel({
      String? id, 
      String? name, 
      String? code, 
      String? description,}){
    _id = id;
    _name = name;
    _code = code;
    _description = description;
}

  AssetTypeListItemModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
    _description = json['description'];
  }
  String? _id;
  String? _name;
  String? _code;
  String? _description;

  String? get id => _id;
  String? get name => _name;
  String? get code => _code;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['code'] = _code;
    map['description'] = _description;
    return map;
  }

}