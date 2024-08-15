class SizeOfOrgDetailsModel {
  SizeOfOrgDetailsModel({
    this.sizeOfOrgId,
    this.sizeOfOrgName,
  });

  SizeOfOrgDetailsModel.fromJson(dynamic json) {
    sizeOfOrgId = json['sizeOfOrgId'];
    sizeOfOrgName = json['sizeOfOrgName'];
  }

  String? sizeOfOrgId;
  String? sizeOfOrgName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sizeOfOrgId'] = sizeOfOrgId;
    map['sizeOfOrgName'] = sizeOfOrgName;
    return map;
  }
}
