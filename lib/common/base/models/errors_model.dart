import 'dart:convert' as converter;
import 'package:go_desk_workplace/common/base/abstracts/models/i_base_item_model.dart';
import 'package:go_desk_workplace/common/base/abstracts/models/i_base_model.dart';


class ErrorListModel extends IBaseModel<ErrorListModel, ErrorItemModel> {
  List<ErrorItemModel>? data;

  ErrorListModel({
    this.data,
  });

  @override
  ErrorListModel fromList(List<dynamic>? jsonLst) {
    if (jsonLst != null && jsonLst.isNotEmpty) {
      data = List<ErrorItemModel>.from(
          jsonLst.map((model) => ErrorItemModel.fromJson(model)));
    }
    return this;
  }

  @override
  ErrorListModel fromString(String str) {
    Iterable l = converter.json.decode(str);
    data = List<ErrorItemModel>.from(
        l.map((model) => ErrorItemModel.fromJson(model)));
    return this;
  }

  @override
  List<Map<String, dynamic>> toList() {
    return data?.map((v) => v.toJson()).toList() ?? [];
  }
}

class ErrorItemModel extends IBaseItemModel<ErrorItemModel> {
  ErrorItemModel({
    String? value,
    String? message,
    String? param,
  }) {
    value = value;
    message = message;
    param = param;
  }

  ErrorItemModel.fromJson(dynamic json) {
    value = (json['value'] ?? "").toString();
    message = json['message'];
    param = json['param'];
  }

  String? value;
  String? message;
  String? param;

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['message'] = message;
    map['param'] = param;
    return map;
  }

  @override
  ErrorItemModel fromJson(Map<String, dynamic> json) {
    value = json['value'];
    message = json['message'];
    param = json['param'];
    return this;
  }
}
