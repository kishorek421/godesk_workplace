class OrgDesignationMappingDetails {
  OrgDesignationMappingDetails({
      this.id, 
      this.name, 
      this.code, 
      this.levelId,});

  OrgDesignationMappingDetails.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    levelId = json['levelId'];
  }
  String? id;
  String? name;
  String? code;
  String? levelId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['code'] = code;
    map['levelId'] = levelId;
    return map;
  }

}