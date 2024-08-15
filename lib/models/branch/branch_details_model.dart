class BranchDetailsModel {
  BranchDetailsModel({
    this.id,
    this.name,
    this.orgId,
    this.headOfBranchId,
    this.gstin,
    this.msmeNo,
    this.email,
    this.mobile,
    this.address,
    this.countryId,
    this.cityId,
    this.stateId,
    this.pincodeId,
    this.areaId,
    this.branchPic,
    this.createdAt,
    this.createdBy,
  });

  BranchDetailsModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    orgId = json['orgId'];
    headOfBranchId = json['headOfBranchId'];
    gstin = json['gstin'];
    msmeNo = json['msmeNo'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
    countryId = json['countryId'];
    cityId = json['cityId'];
    stateId = json['stateId'];
    pincodeId = json['pincodeId'];
    areaId = json['areaId'];
    branchPic = json['branchPic'];
    createdAt = json['createdAt'];
    createdBy = json['createdBy'];
  }

  String? id;
  String? name;
  String? orgId;
  String? headOfBranchId;
  String? gstin;
  String? msmeNo;
  String? email;
  String? mobile;
  String? address;
  String? countryId;
  String? cityId;
  String? stateId;
  String? pincodeId;
  String? areaId;
  String? branchPic;
  String? createdAt;
  String? createdBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['orgId'] = orgId;
    map['headOfBranchId'] = headOfBranchId;
    map['gstin'] = gstin;
    map['msmeNo'] = msmeNo;
    map['email'] = email;
    map['mobile'] = mobile;
    map['address'] = address;
    map['countryId'] = countryId;
    map['cityId'] = cityId;
    map['stateId'] = stateId;
    map['pincodeId'] = pincodeId;
    map['areaId'] = areaId;
    map['branchPic'] = branchPic;
    map['createdAt'] = createdAt;
    map['createdBy'] = createdBy;
    return map;
  }
}
