import 'package:go_desk_workplace/models/customer_lead/customer_lead_details_model.dart';

class CustomerLeadListModel {
  CustomerLeadListModel({
    List<CustomerLeadDetailsModel>? data,
  }) {
    _data = data;
  }

  CustomerLeadListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(CustomerLeadDetailsModel.fromJson(v));
      });
    }
  }

  List<CustomerLeadDetailsModel>? _data;

  List<CustomerLeadDetailsModel>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}