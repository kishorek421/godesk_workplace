class OrgDepartmentMappingDetails {
  OrgDepartmentMappingDetails({
      this.id, 
      this.name, 
      this.code,});

  OrgDepartmentMappingDetails.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
  }
  String? id;
  String? name;
  String? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['code'] = code;
    return map;
  }

}