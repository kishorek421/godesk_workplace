class AssetInUseCustomerDetailsModel {
  AssetInUseCustomerDetailsModel({
      String? orgName, 
      String? branchName, 
      String? firstName, 
      String? lastName,}){
    _orgName = orgName;
    _branchName = branchName;
    _firstName = firstName;
    _lastName = lastName;
}

  AssetInUseCustomerDetailsModel.fromJson(dynamic json) {
    _orgName = json['orgName'];
    _branchName = json['branchName'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
  }
  String? _orgName;
  String? _branchName;
  String? _firstName;
  String? _lastName;

  String? get orgName => _orgName;
  String? get branchName => _branchName;
  String? get firstName => _firstName;
  String? get lastName => _lastName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['orgName'] = _orgName;
    map['branchName'] = _branchName;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    return map;
  }

}