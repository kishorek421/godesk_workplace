class PincodeListModel {
  PincodeListModel({
    List<PincodeListItemModel>? data,
  }) {
    _data = data;
  }

  PincodeListModel.fromList(List<dynamic>? lst) {
    if (lst != null && lst.isNotEmpty) {
      _data = [];
      for (var v in lst) {
        _data?.add(PincodeListItemModel.fromJson(v));
      }
    }
  }

  PincodeListModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(PincodeListItemModel.fromJson(v));
      });
    }
  }

  List<PincodeListItemModel>? _data;

  List<PincodeListItemModel>? get data => _data;

  Map<dynamic, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class PincodeListItemModel {
  PincodeListItemModel({
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
    this.pincode,
  });

  PincodeListItemModel.fromJson(dynamic json) {
    id = json['id'] ?? json['pincodeId'];
    cityId = json['cityId'];
    cityName = json['cityName'];
    cityCode = json['cityCode'];
    stateId = json['stateId'];
    stateName = json['stateName'];
    stateCode = json['stateCode'];
    countryId = json['countryId'];
    countryName = json['countryName'];
    countryCode = json['countryCode'];
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
    map['pincode'] = pincode;
    return map;
  }
}
