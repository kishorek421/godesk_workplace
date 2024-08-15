import 'package:go_desk_workplace/models/assets/asset_in_use_list_model.dart';
import 'package:go_desk_workplace/models/assets/asset_sub_type_list_model.dart';
import 'package:go_desk_workplace/models/common/paginator_model.dart';
import 'package:go_desk_workplace/models/configurations/configuration_model.dart';
import 'package:go_desk_workplace/models/assets/asset_in_use_customer_details_model.dart';
import 'package:go_desk_workplace/models/employees/employee_details_model.dart';

class TicketListModel {
  TicketListModel({
    List<TicketListItemModel>? content,
    PaginatorModel? paginator,
  }) {
    _content = content;
    _paginator = paginator;
  }

  TicketListModel.fromJson(dynamic json) {
    if (json['content'] != null) {
      _content = [];
      json['content'].forEach((v) {
        _content?.add(TicketListItemModel.fromJson(v));
      });
    }
    _paginator = json['paginator'] != null
        ? PaginatorModel.fromJson(json['paginator'])
        : null;
  }

  List<TicketListItemModel>? _content;
  PaginatorModel? _paginator;

  List<TicketListItemModel>? get content => _content;

  PaginatorModel? get paginator => _paginator;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_content != null) {
      map['content'] = _content?.map((v) => v.toJson()).toList();
    }
    if (_paginator != null) {
      map['paginator'] = _paginator?.toJson();
    }
    return map;
  }
}

class TicketListItemModel {
  TicketListItemModel({
    String? id,
    String? description,
    String? dueBy,
    AssetInUseListItemModel? assetInUseDetails,
    AssetSubTypeListItemModel? assetSubTypeDetails,
    ConfigurationModel? ticketStatusDetails,
    ConfigurationModel? priorityDetails,
    ConfigurationModel? ticketTypeDetails,
    ConfigurationModel? serviceTypeDetails,
    ConfigurationModel? warrantyDetails,
    AssetInUseCustomerDetailsModel? customerDetails,
    ConfigurationModel? issueTypeDetails,
    bool? billable,
    bool? timerRunning,
    String? createdAt,
    String? ticketNo,
    EmployeeDetailsModel? assignedToDetails,
  }) {
    _id = id;
    _description = description;
    _dueBy = dueBy;
    _assetInUseDetails = assetInUseDetails;
    _assetSubTypeDetails = assetSubTypeDetails;
    _ticketStatusDetails = ticketStatusDetails;
    _priorityDetails = priorityDetails;
    _ticketTypeDetails = ticketTypeDetails;
    _serviceTypeDetails = serviceTypeDetails;
    _warrantyDetails = warrantyDetails;
    _customerDetails = customerDetails;
    _issueTypeDetails = issueTypeDetails;
    _billable = billable;
    _timerRunning = timerRunning;
    _createdAt = createdAt;
    _ticketNo = ticketNo;
    _assignedToDetails = assignedToDetails;
  }

  TicketListItemModel.fromJson(dynamic json) {
    _id = json['id'];
    _description = json['description'];
    _dueBy = json['dueBy'];
    _assetInUseDetails = json['assetInUseDetails'] != null
        ? AssetInUseListItemModel.fromJson(json['assetInUseDetails'])
        : null;
    _assetSubTypeDetails = json['assetSubTypeDetails'] != null
        ? AssetSubTypeListItemModel.fromJson(json['assetSubTypeDetails'])
        : null;
    _ticketStatusDetails = json['statusDetails'] != null
        ? ConfigurationModel.fromJson(json['statusDetails'])
        : null;
    _priorityDetails = json['priorityDetails'] != null
        ? ConfigurationModel.fromJson(json['priorityDetails'])
        : null;
    _ticketTypeDetails = json['ticketTypeDetails'] != null
        ? ConfigurationModel.fromJson(json['ticketTypeDetails'])
        : null;
    _serviceTypeDetails = json['serviceTypeDetails'] != null
        ? ConfigurationModel.fromJson(json['serviceTypeDetails'])
        : null;
    _warrantyDetails = json['warrantyDetails'] != null
        ? ConfigurationModel.fromJson(json['warrantyDetails'])
        : null;
    _customerDetails = json['customerDetails'] != null
        ? AssetInUseCustomerDetailsModel.fromJson(json['customerDetails'])
        : null;
    _issueTypeDetails = json['issueTypeDetails'] != null
        ? ConfigurationModel.fromJson(json['issueTypeDetails'])
        : null;
    _billable = json['billable'];
    _timerRunning = json['timerRunning'];
    _createdAt = json['createdAt'];
    _ticketNo = json['ticketNo'];
    _assignedToDetails = json['assignedToDetails'] != null
        ? EmployeeDetailsModel.fromJson(json['assignedToDetails'])
        : null;
  }

  String? _id;
  String? _description;
  String? _dueBy;
  AssetInUseListItemModel? _assetInUseDetails;
  AssetSubTypeListItemModel? _assetSubTypeDetails;
  ConfigurationModel? _ticketStatusDetails;
  ConfigurationModel? _priorityDetails;
  ConfigurationModel? _ticketTypeDetails;
  ConfigurationModel? _serviceTypeDetails;
  ConfigurationModel? _warrantyDetails;
  AssetInUseCustomerDetailsModel? _customerDetails;
  ConfigurationModel? _issueTypeDetails;
  bool? _billable;
  bool? _timerRunning;
  String? _createdAt;
  String? _ticketNo;
  EmployeeDetailsModel? _assignedToDetails;

  String? get id => _id;

  String? get description => _description;

  String? get dueBy => _dueBy;

  AssetInUseListItemModel? get assetInUseDetails => _assetInUseDetails;

  AssetSubTypeListItemModel? get assetSubTypeDetails => _assetSubTypeDetails;

  ConfigurationModel? get ticketStatusDetails => _ticketStatusDetails;

  ConfigurationModel? get priorityDetails => _priorityDetails;

  ConfigurationModel? get ticketTypeDetails => _ticketTypeDetails;

  ConfigurationModel? get serviceTypeDetails => _serviceTypeDetails;

  ConfigurationModel? get warrantyDetails => _warrantyDetails;

  AssetInUseCustomerDetailsModel? get customerDetails => _customerDetails;

  ConfigurationModel? get issueTypeDetails => _issueTypeDetails;

  bool? get billable => _billable;

  bool? get timerRunning => _timerRunning;

  String? get createdAt => _createdAt;

  String? get ticketNo => _ticketNo;

  EmployeeDetailsModel? get assignedToDetails => _assignedToDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['description'] = _description;
    map['dueBy'] = _dueBy;
    if (_assetInUseDetails != null) {
      map['assetInUseDetails'] = _assetInUseDetails?.toJson();
    }
    if (_assetSubTypeDetails != null) {
      map['assetSubTypeDetails'] = _assetSubTypeDetails?.toJson();
    }
    if (_ticketStatusDetails != null) {
      map['statusDetails'] = _ticketStatusDetails?.toJson();
    }
    if (_priorityDetails != null) {
      map['priorityDetails'] = _priorityDetails?.toJson();
    }
    if (_ticketTypeDetails != null) {
      map['ticketTypeDetails'] = _ticketTypeDetails?.toJson();
    }
    if (_serviceTypeDetails != null) {
      map['serviceTypeDetails'] = _serviceTypeDetails?.toJson();
    }
    if (_warrantyDetails != null) {
      map['warrantyDetails'] = _warrantyDetails?.toJson();
    }
    if (_customerDetails != null) {
      map['customerDetails'] = _customerDetails?.toJson();
    }
    if (_issueTypeDetails != null) {
      map['issueTypeDetails'] = _issueTypeDetails?.toJson();
    }
    map['billable'] = _billable;
    map['timerRunning'] = _timerRunning;
    map['createdAt'] = _createdAt;
    map['ticketNo'] = _ticketNo;
    if (_assignedToDetails != null) {
      map['assignedToDetails'] = _assignedToDetails?.toJson();
    }
    return map;
  }
}
