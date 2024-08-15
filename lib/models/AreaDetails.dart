class AreaDetails {
  AreaDetails({
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
      this.pincodeId, 
      this.pincode, 
      this.areaName,});

  AreaDetails.fromJson(dynamic json) {
    id = json['id'];
    cityId = json['cityId'];
    cityName = json['cityName'];
    cityCode = json['cityCode'];
    stateId = json['stateId'];
    stateName = json['stateName'];
    stateCode = json['stateCode'];
    countryId = json['countryId'];
    countryName = json['countryName'];
    countryCode = json['countryCode'];
    pincodeId = json['pincodeId'];
    pincode = json['pincode'];
    areaName = json['areaName'];
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
  String? pincodeId;
  String? pincode;
  String? areaName;

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
    map['pincodeId'] = pincodeId;
    map['pincode'] = pincode;
    map['areaName'] = areaName;
    return map;
  }

}