class AreaListDropDownModel {
  AreaListDropDownModel({
    List<AreaListItemModel>? details,
  }) {
    _details = details;
  }

  AreaListDropDownModel.fromList(List<dynamic>? lst) {
    if (lst != null && lst.isNotEmpty) {
      _details = [];
      for (var v in lst) {
        _details?.add(AreaListItemModel.fromJson(v));
      }
    }
  }

  AreaListDropDownModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _details = [];
      json['data'].forEach((v) {
        _details?.add(AreaListItemModel.fromJson(v));
      });
    }
  }

  List<AreaListItemModel>? _details;

  List<AreaListItemModel>? get details => _details;

  Map<dynamic, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_details != null) {
      map['data'] = _details?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class AreaListItemModel {
  AreaListItemModel({
    this.id,
    this.cityId,
    this.cityName,
    this.cityCode,
    this.stateId,
    this.stateName,
    this.stateCode,
    this.countryId,
    this.countryName,
    this.countryCode,
    this.areaName,
    this.pincodeId,
    this.pincode,
  });

  AreaListItemModel.fromJson(dynamic json) {
    id = json['id'] ?? json['areaId'];
    cityId = json['cityId'];
    cityName = json['cityName'];
    cityCode = json['cityCode'];
    stateId = json['stateId'];
    stateName = json['stateName'];
    stateCode = json['stateCode'];
    countryId = json['countryId'];
    countryName = json['countryName'];
    countryCode = json['countryCode'];
    areaName = json['areaName'];
    pincodeId = json['pincodeId'];
    pincode = json['pincode']?.toString();
  }

  String? id;
  String? cityId;
  String? cityName;
  String? cityCode;
  String? stateId;
  String? stateName;
  String? stateCode;
  String? countryId;
  String? countryName;
  String? countryCode;
  String? areaName;
  String? pincodeId;
  String? pincode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['cityId'] = cityId;
    map['cityName'] = cityName;
    map['cityCode'] = cityCode;
    map['stateId'] = stateId;
    map['stateName'] = stateName;
    map['stateCode'] = stateCode;
    map['countryId'] = countryId;
    map['countryName'] = countryName;
    map['countryCode'] = countryCode;
    map['areaName'] = areaName;
    map['pincodeId'] = pincodeId;
    map['pincode'] = pincode;
    return map;
  }
}
