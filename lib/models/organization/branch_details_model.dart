import 'package:go_desk_workplace/models/geolocations/area_list_model.dart';
import 'package:go_desk_workplace/models/geolocations/city_list_model.dart';
import 'package:go_desk_workplace/models/geolocations/country_list_model.dart';
import 'package:go_desk_workplace/models/geolocations/pincode_list_model.dart';
import 'package:go_desk_workplace/models/geolocations/state_list_model.dart';

class BranchDetailsModel {
  BranchDetailsModel({
      String? id, 
      String? name, 
      String? orgId, 
      String? headOfBranchId,
      String? gstin, 
      String? msmeNo,
      String? email, 
      String? mobile, 
      String? address, 
      CountryListItemModel? countryDetails,
      CityListItemModel? cityDetails,
      StateListItemModel? stateDetails,
      PincodeListItemModel? pincodeDetails,
      AreaListItemModel? areaDetails,
      String? branchPic, 
      String? createdAt, 
      String? createdBy,}){
    _id = id;
    _name = name;
    _orgId = orgId;
    _headOfBranchId = headOfBranchId;
    _gstin = gstin;
    _msmeNo = msmeNo;
    _email = email;
    _mobile = mobile;
    _address = address;
    _countryDetails = countryDetails;
    _cityDetails = cityDetails;
    _stateDetails = stateDetails;
    _pincodeDetails = pincodeDetails;
    _areaDetails = areaDetails;
    _branchPic = branchPic;
    _createdAt = createdAt;
    _createdBy = createdBy;
}

  BranchDetailsModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _orgId = json['orgId'];
    _headOfBranchId = json['headOfBranchId'];
    _gstin = json['gstin'];
    _msmeNo = json['msmeNo'];
    _email = json['email'];
    _mobile = json['mobile'];
    _address = json['address'];
    _countryDetails = json['countryDetails'] != null ? CountryListItemModel.fromJson(json['countryDetails']) : null;
    _cityDetails = json['cityDetails'] != null ? CityListItemModel.fromJson(json['cityDetails']) : null;
    _stateDetails = json['stateDetails'] != null ? StateListItemModel.fromJson(json['stateDetails']) : null;
    _pincodeDetails = json['pincodeDetails'] != null ? PincodeListItemModel.fromJson(json['pincodeDetails']) : null;
    _areaDetails = json['areaDetails'] != null ? AreaListItemModel.fromJson(json['areaDetails']) : null;
    _branchPic = json['branchPic'];
    _createdAt = json['createdAt'];
    _createdBy = json['createdBy'];
  }
  String? _id;
  String? _name;
  String? _orgId;
  String? _headOfBranchId;
  String? _gstin;
  String? _msmeNo;
  String? _email;
  String? _mobile;
  String? _address;
  CountryListItemModel? _countryDetails;
  CityListItemModel? _cityDetails;
  StateListItemModel? _stateDetails;
  PincodeListItemModel? _pincodeDetails;
  AreaListItemModel? _areaDetails;
  String? _branchPic;
  String? _createdAt;
  String? _createdBy;

  String? get id => _id;
  String? get name => _name;
  String? get orgId => _orgId;
  String? get headOfBranchId => _headOfBranchId;
  String? get gstin => _gstin;
  String? get msmeNo => _msmeNo;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get address => _address;
  CountryListItemModel? get countryDetails => _countryDetails;
  CityListItemModel? get cityDetails => _cityDetails;
  StateListItemModel? get stateDetails => _stateDetails;
  PincodeListItemModel? get pincodeDetails => _pincodeDetails;
  AreaListItemModel? get areaDetails => _areaDetails;
  String? get branchPic => _branchPic;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['orgId'] = _orgId;
    map['headOfBranchId'] = _headOfBranchId;
    map['gstin'] = _gstin;
    map['msmeNo'] = _msmeNo;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['address'] = _address;
    if (_countryDetails != null) {
      map['countryDetails'] = _countryDetails?.toJson();
    }
    if (_cityDetails != null) {
      map['cityDetails'] = _cityDetails?.toJson();
    }
    if (_stateDetails != null) {
      map['stateDetails'] = _stateDetails?.toJson();
    }
    if (_pincodeDetails != null) {
      map['pincodeDetails'] = _pincodeDetails?.toJson();
    }
    if (_areaDetails != null) {
      map['areaDetails'] = _areaDetails?.toJson();
    }
    map['branchPic'] = _branchPic;
    map['createdAt'] = _createdAt;
    map['createdBy'] = _createdBy;
    return map;
  }

}