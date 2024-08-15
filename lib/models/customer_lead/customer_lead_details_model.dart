import 'package:go_desk_workplace/models/configurations/configuration_model.dart';
import 'package:go_desk_workplace/models/customer_lead/details/category_of_org_details_model.dart';
import 'package:go_desk_workplace/models/customer_lead/details/size_of_org_details_model.dart';
import 'package:go_desk_workplace/models/customer_lead/details/type_of_org_details_model.dart';

import 'package:go_desk_workplace/models/geolocations/area_list_model.dart';
import 'package:go_desk_workplace/models/geolocations/city_list_model.dart';
import 'package:go_desk_workplace/models/geolocations/country_list_model.dart';
import 'package:go_desk_workplace/models/geolocations/pincode_list_model.dart';
import 'package:go_desk_workplace/models/geolocations/state_list_model.dart';

class CustomerLeadDetailsModel {
  CustomerLeadDetailsModel({
    this.id,
    this.firstName,
    this.lastName,
    this.orgName,
    this.description,
    this.msmeNo,
    this.orgMobile,
    this.mobile,
    this.alternateMobile,
    this.email,
    this.gstin,
    this.address,
    this.orgImage,
    this.linksGenerated,
    this.downloaded,
    this.createdBy,
    this.createdAt,
    this.categoryOfOrgId,
    this.sizeOfOrgId,
    this.typeOfOrgId,
    this.cityId,
    this.stateId,
    this.countryId,
    this.pincodeId,
    this.areaId,
  });

  CustomerLeadDetailsModel.fromJson(dynamic json) {
    id = json['id'] ?? json['customerLeadsId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    orgName = json['orgName'];
    description = json['description'];
    msmeNo = json['msmeNo'];
    orgMobile = json['orgMobile'];
    mobile = json['mobile'];
    alternateMobile = json['alternateMobile'];
    email = json['email'];
    gstin = json['gstin'];
    address = json['address'];
    orgImage = json['orgImage'];
    linksGenerated = json['linksGenerated'];
    downloaded = json['downloaded'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'] != null
        ? json['createdAt'].runtimeType == double
            ? json['createdAt'].toInt()
            : json['createdAt']
        : null;
    categoryOfOrgDetails = json['categoryOfOrgDetails'] != null
        ? ConfigurationModel.fromJson(json['categoryOfOrgDetails'])
        : null;
    sizeOfOrgDetails = json['sizeOfOrgDetails'] != null
        ? ConfigurationModel.fromJson(json['sizeOfOrgDetails'])
        : null;
    typeOfOrgDetails = json['typeOfOrgDetails'] != null
        ? ConfigurationModel.fromJson(json['typeOfOrgDetails'])
        : null;
    cityDetails = json['cityDetails'] != null
        ? CityListItemModel.fromJson(json['cityDetails'])
        : null;
    stateDetails = json['stateDetails'] != null
        ? StateListItemModel.fromJson(json['stateDetails'])
        : null;
    countryDetails = json['countryDetails'] != null
        ? CountryListItemModel.fromJson(json['countryDetails'])
        : null;
    pincodeDetails = json['pincodeDetails'] != null
        ? PincodeListItemModel.fromJson(json['pincodeDetails'])
        : null;
    areaDetails = json['areaDetails'] != null
        ? AreaListItemModel.fromJson(json['areaDetails'])
        : null;
    onBoardingStatusDetails = json['onBoardingStatusDetails'] != null
        ? ConfigurationModel.fromJson(json['onBoardingStatusDetails'])
        : null;
  }

  String? id;
  String? firstName;
  String? lastName;
  String? orgName;
  String? description;
  String? msmeNo;
  String? orgMobile;
  String? mobile;
  String? alternateMobile;
  String? email;
  String? gstin;
  String? address;
  String? orgImage;
  int? linksGenerated;
  bool? downloaded;
  String? createdBy;
  int? createdAt;
  ConfigurationModel? categoryOfOrgDetails;
  ConfigurationModel? sizeOfOrgDetails;
  ConfigurationModel? typeOfOrgDetails;
  CityListItemModel? cityDetails;
  StateListItemModel? stateDetails;
  CountryListItemModel? countryDetails;
  PincodeListItemModel? pincodeDetails;
  AreaListItemModel? areaDetails;
  String? categoryOfOrgId;
  String? sizeOfOrgId;
  String? typeOfOrgId;
  String? cityId;
  String? stateId;
  String? countryId;
  String? pincodeId;
  String? areaId;
  ConfigurationModel? onBoardingStatusDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['orgName'] = orgName;
    map['description'] = description;
    map['msmeNo'] = msmeNo;
    map['orgMobile'] = orgMobile;
    map['mobile'] = mobile;
    map['alternateMobile'] = alternateMobile;
    map['email'] = email;
    map['gstin'] = gstin;
    map['address'] = address;
    map['orgImage'] = orgImage;
    map['linksGenerated'] = linksGenerated;
    map['downloaded'] = downloaded;
    map['createdBy'] = createdBy;
    map['createdAt'] = createdAt;
    if (categoryOfOrgDetails != null) {
      map['categoryOfOrgDetails'] = categoryOfOrgDetails?.toJson();
    }
    if (sizeOfOrgDetails != null) {
      map['sizeOfOrgDetails'] = sizeOfOrgDetails?.toJson();
    }
    if (typeOfOrgDetails != null) {
      map['typeOfOrgDetails'] = typeOfOrgDetails?.toJson();
    }
    if (cityDetails != null) {
      map['cityDetails'] = cityDetails?.toJson();
    }
    if (stateDetails != null) {
      map['stateDetails'] = stateDetails?.toJson();
    }
    if (countryDetails != null) {
      map['countryDetails'] = countryDetails?.toJson();
    }
    if (pincodeDetails != null) {
      map['pincodeDetails'] = pincodeDetails?.toJson();
    }
    if (areaDetails != null) {
      map['areaDetails'] = areaDetails?.toJson();
    }
    return map;
  }
}
