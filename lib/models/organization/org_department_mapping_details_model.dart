class OrgDepartmentMappingDetailsModel {
  OrgDepartmentMappingDetailsModel({
      String? id, 
      String? name, 
      String? code,}){
    _id = id;
    _name = name;
    _code = code;
}

  OrgDepartmentMappingDetailsModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
  }
  String? _id;
  String? _name;
  String? _code;

  String? get id => _id;
  String? get name => _name;
  String? get code => _code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['code'] = _code;
    return map;
  }

}