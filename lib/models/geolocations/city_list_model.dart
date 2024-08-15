class CityListModel {
  CityListModel({
    List<CityListItemModel>? data,
  }) {
    _data = data;
  }

  CityListModel.fromList(List<dynamic>? lst) {
    if (lst != null && lst.isNotEmpty) {
      _data = [];
      for (var v in lst) {
        _data?.add(CityListItemModel.fromJson(v));
      }
    }
  }

 CityListModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(CityListItemModel.fromJson(v));
      });
    }
  }

  List<CityListItemModel>? _data;

  List<CityListItemModel>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class CityListItemModel {
  CityListItemModel({
    this.id,
    this.cityName,
    this.cityCode,
    this.stateId,
    this.stateName,
    this.stateCode,
    this.countryId,
    this.countryName,
    this.countryCode,
  });

  CityListItemModel.fromJson(dynamic json) {
    id = json['id'] ?? json['cityId'];
    cityName = json['cityName'];
    cityCode = json['cityCode'];
    stateId = json['stateId'];
    stateName = json['stateName'];
    stateCode = json['stateCode'];
    countryId = json['countryId'];
    countryName = json['countryName'];
    countryCode = json['countryCode'];
  }

  String? id;
  String? cityName;
  String? cityCode;
  String? stateId;
  String? stateName;
  String? stateCode;
  String? countryId;
  String? countryName;
  String? countryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['cityName'] = cityName;
    map['cityCode'] = cityCode;
    map['stateId'] = stateId;
    map['stateName'] = stateName;
    map['stateCode'] = stateCode;
    map['countryId'] = countryId;
    map['countryName'] = countryName;
    map['countryCode'] = countryCode;
    return map;
  }
}
