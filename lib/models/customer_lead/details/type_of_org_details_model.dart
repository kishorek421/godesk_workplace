class TypeOfOrgDetailsModel {
  TypeOfOrgDetailsModel({
    this.typeOfOrgId,
    this.typeOfOrgName,
  });

  TypeOfOrgDetailsModel.fromJson(dynamic json) {
    typeOfOrgId = json['typeOfOrgId'];
    typeOfOrgName = json['typeOfOrgName'];
  }

  String? typeOfOrgId;
  String? typeOfOrgName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['typeOfOrgId'] = typeOfOrgId;
    map['typeOfOrgName'] = typeOfOrgName;
    return map;
  }
}
