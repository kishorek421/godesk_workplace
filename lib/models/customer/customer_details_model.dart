import 'package:go_desk_workplace/models/branch/branch_details_model.dart';
import 'package:go_desk_workplace/models/geolocations/area_list_model.dart';
import 'package:go_desk_workplace/models/organization/org_department_mapping_details_model.dart';
import 'package:go_desk_workplace/models/organization/org_designation_mapping_details.dart';
import 'package:go_desk_workplace/models/organization/org_details_model.dart';

class CustomerDetailsModel {
  CustomerDetailsModel({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? alternateNumber,
    String? mobileNumber,
    String? address,
    OrgDepartmentMappingDetailsModel? orgDepartmentMappingDetails,
    OrgDesignationMappingDetailsModel? orgDesignationMappingDetails,
    AreaListItemModel? areaDetails,
    BranchDetailsModel? branchDetails,
    OrgDetailsModel? orgDetails,
  }) {
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _alternateNumber = alternateNumber;
    _mobileNumber = mobileNumber;
    _address = address;
    _orgDepartmentMappingDetails = orgDepartmentMappingDetails;
    _orgDesignationMappingDetails = orgDesignationMappingDetails;
    _areaDetails = areaDetails;
    _branchDetails = branchDetails;
    _orgDetails = orgDetails;
  }

  CustomerDetailsModel.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _alternateNumber = json['alternateNumber'];
    _mobileNumber = json['mobileNumber'];
    _address = json['address'];
    _orgDepartmentMappingDetails = json['orgDepartmentMappingDetails'] != null
        ? OrgDepartmentMappingDetailsModel.fromJson(
            json['orgDepartmentMappingDetails'])
        : null;
    _orgDesignationMappingDetails = json['orgDesignationMappingDetails'] != null
        ? OrgDesignationMappingDetailsModel.fromJson(
            json['orgDesignationMappingDetails'])
        : null;
    _areaDetails = json['areaDetails'] != null
        ? AreaListItemModel.fromJson(json['areaDetails'])
        : null;
    _branchDetails = json['branchDetails'] != null
        ? BranchDetailsModel.fromJson(json['branchDetails'])
        : null;
    _orgDetails = json['orgDetails'] != null
        ? OrgDetailsModel.fromJson(json['orgDetails'])
        : null;
  }

  String? _id;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _alternateNumber;
  String? _mobileNumber;
  String? _address;
  OrgDepartmentMappingDetailsModel? _orgDepartmentMappingDetails;
  OrgDesignationMappingDetailsModel? _orgDesignationMappingDetails;
  AreaListItemModel? _areaDetails;
  BranchDetailsModel? _branchDetails;
  OrgDetailsModel? _orgDetails;

  String? get id => _id;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get email => _email;

  String? get alternateNumber => _alternateNumber;

  String? get mobileNumber => _mobileNumber;

  String? get address => _address;

  OrgDepartmentMappingDetailsModel? get orgDepartmentMappingDetails =>
      _orgDepartmentMappingDetails;

  OrgDesignationMappingDetailsModel? get orgDesignationMappingDetails =>
      _orgDesignationMappingDetails;

  AreaListItemModel? get areaDetails => _areaDetails;

  BranchDetailsModel? get branchDetails => _branchDetails;

  OrgDetailsModel? get orgDetails => _orgDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['alternateNumber'] = _alternateNumber;
    map['mobileNumber'] = _mobileNumber;
    map['address'] = _address;
    if (_orgDepartmentMappingDetails != null) {
      map['orgDepartmentMappingDetails'] =
          _orgDepartmentMappingDetails?.toJson();
    }
    if (_orgDesignationMappingDetails != null) {
      map['orgDesignationMappingDetails'] =
          _orgDesignationMappingDetails?.toJson();
    }
    if (_areaDetails != null) {
      map['areaDetails'] = _areaDetails?.toJson();
    }
    if (_branchDetails != null) {
      map['branchDetails'] = _branchDetails?.toJson();
    }
    if (_orgDetails != null) {
      map['orgDetails'] = _orgDetails?.toJson();
    }
    return map;
  }
}
