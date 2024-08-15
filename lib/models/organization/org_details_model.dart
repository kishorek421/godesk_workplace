import 'package:go_desk_workplace/models/configurations/configuration_model.dart';
import 'package:go_desk_workplace/models/geolocations/area_list_model.dart';
import 'package:go_desk_workplace/models/geolocations/city_list_model.dart';
import 'package:go_desk_workplace/models/geolocations/country_list_model.dart';
import 'package:go_desk_workplace/models/geolocations/pincode_list_model.dart';
import 'package:go_desk_workplace/models/geolocations/state_list_model.dart';

class OrgDetailsModel {
  OrgDetailsModel({
      String? id, 
      String? name, 
      String? description, 
      String? partnerType, 
      String? contactPersonId,
      String? headOfficeId, 
      String? email, 
      String? mobile, 
      String? alternateNumber, 
      ConfigurationModel? categoryOfOrgDetails,
      ConfigurationModel? sizeOfOrgDetails,
      ConfigurationModel? typeOfOrgDetails,
      String? address,
      CountryListItemModel? countryDetails,
      CityListItemModel? cityDetails,
      StateListItemModel? stateDetails,
      PincodeListItemModel? pincodeDetails,
      AreaListItemModel? areaDetails,
      String? createdAt, 
      String? createdBy,}){
    _id = id;
    _name = name;
    _description = description;
    _partnerType = partnerType;
    _contactPersonId = contactPersonId;
    _headOfficeId = headOfficeId;
    _email = email;
    _mobile = mobile;
    _alternateNumber = alternateNumber;
    _categoryOfOrgDetails = categoryOfOrgDetails;
    _sizeOfOrgDetails = sizeOfOrgDetails;
    _typeOfOrgDetails = typeOfOrgDetails;
    _address = address;
    _countryDetails = countryDetails;
    _cityDetails = cityDetails;
    _stateDetails = stateDetails;
    _pincodeDetails = pincodeDetails;
    _areaDetails = areaDetails;
    _createdAt = createdAt;
    _createdBy = createdBy;
}

  OrgDetailsModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _partnerType = json['partnerType'];
    _contactPersonId = json['contactPersonId'];
    _headOfficeId = json['headOfficeId'];
    _email = json['email'];
    _mobile = json['mobile'];
    _alternateNumber = json['alternateNumber'];
    _categoryOfOrgDetails = json['categoryOfOrgDetails'] != null ? ConfigurationModel.fromJson(json['categoryOfOrgDetails']) : null;
    _sizeOfOrgDetails = json['sizeOfOrgDetails'] != null ? ConfigurationModel.fromJson(json['sizeOfOrgDetails']) : null;
    _typeOfOrgDetails = json['typeOfOrgDetails'] != null ? ConfigurationModel.fromJson(json['typeOfOrgDetails']) : null;
    _address = json['address'];
    _countryDetails = json['countryDetails'] != null ? CountryListItemModel.fromJson(json['countryDetails']) : null;
    _cityDetails = json['cityDetails'] != null ? CityListItemModel.fromJson(json['cityDetails']) : null;
    _stateDetails = json['stateDetails'] != null ? StateListItemModel.fromJson(json['stateDetails']) : null;
    _pincodeDetails = json['pincodeDetails'] != null ? PincodeListItemModel.fromJson(json['pincodeDetails']) : null;
    _areaDetails = json['areaDetails'] != null ? AreaListItemModel.fromJson(json['areaDetails']) : null;
    _createdAt = json['createdAt'];
    _createdBy = json['createdBy'];
  }
  String? _id;
  String? _name;
  String? _description;
  String? _partnerType;
  String? _contactPersonId;
  String? _headOfficeId;
  String? _email;
  String? _mobile;
  String? _alternateNumber;
  ConfigurationModel? _categoryOfOrgDetails;
  ConfigurationModel? _sizeOfOrgDetails;
  ConfigurationModel? _typeOfOrgDetails;
  String? _address;
  CountryListItemModel? _countryDetails;
  CityListItemModel? _cityDetails;
  StateListItemModel? _stateDetails;
  PincodeListItemModel? _pincodeDetails;
  AreaListItemModel? _areaDetails;
  String? _createdAt;
  String? _createdBy;

  String? get id => _id;
  String? get name => _name;
  String? get description => _description;
  String? get partnerType => _partnerType;
  dynamic get contactPersonId => _contactPersonId;
  String? get headOfficeId => _headOfficeId;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get alternateNumber => _alternateNumber;
  ConfigurationModel? get categoryOfOrgDetails => _categoryOfOrgDetails;
  ConfigurationModel? get sizeOfOrgDetails => _sizeOfOrgDetails;
  ConfigurationModel? get typeOfOrgDetails => _typeOfOrgDetails;
  String? get address => _address;
  CountryListItemModel? get countryDetails => _countryDetails;
  CityListItemModel? get cityDetails => _cityDetails;
  StateListItemModel? get stateDetails => _stateDetails;
  PincodeListItemModel? get pincodeDetails => _pincodeDetails;
  AreaListItemModel? get areaDetails => _areaDetails;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['partnerType'] = _partnerType;
    map['contactPersonId'] = _contactPersonId;
    map['headOfficeId'] = _headOfficeId;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['alternateNumber'] = _alternateNumber;
    if (_categoryOfOrgDetails != null) {
      map['categoryOfOrgDetails'] = _categoryOfOrgDetails?.toJson();
    }
    if (_sizeOfOrgDetails != null) {
      map['sizeOfOrgDetails'] = _sizeOfOrgDetails?.toJson();
    }
    if (_typeOfOrgDetails != null) {
      map['typeOfOrgDetails'] = _typeOfOrgDetails?.toJson();
    }
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
    map['createdAt'] = _createdAt;
    map['createdBy'] = _createdBy;
    return map;
  }

}