class OrgDesignationMappingDetailsModel {
  OrgDesignationMappingDetailsModel({
      String? id, 
      String? name, 
      String? code, 
      String? levelId,}){
    _id = id;
    _name = name;
    _code = code;
    _levelId = levelId;
}

  OrgDesignationMappingDetailsModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
    _levelId = json['levelId'];
  }
  String? _id;
  String? _name;
  String? _code;
  String? _levelId;

  String? get id => _id;
  String? get name => _name;
  String? get code => _code;
  String? get levelId => _levelId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['code'] = _code;
    map['levelId'] = _levelId;
    return map;
  }

}