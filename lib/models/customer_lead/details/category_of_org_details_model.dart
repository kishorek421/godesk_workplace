class CategoryOfOrgDetailsModel {
  CategoryOfOrgDetailsModel({
    this.categoryOfOrgId,
    this.categoryOfOrgName,
  });

  CategoryOfOrgDetailsModel.fromJson(dynamic json) {
    categoryOfOrgId = json['categoryOfOrgId'];
    categoryOfOrgName = json['categoryOfOrgName'];
  }

  String? categoryOfOrgId;
  String? categoryOfOrgName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['categoryOfOrgId'] = categoryOfOrgId;
    map['categoryOfOrgName'] = categoryOfOrgName;
    return map;
  }
}
