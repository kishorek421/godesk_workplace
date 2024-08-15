import 'package:go_desk_workplace/common/base/models/errors_model.dart';
import 'package:go_desk_workplace/models/customer_lead/customer_leads_list_model.dart';

class BaseResponseModel<T> {
  T? data;
  bool success;
  String? message;
  ErrorListModel? errors;
  int? status;

  BaseResponseModel({
    this.data,
    this.success = true,
    this.message,
    this.errors,
    this.status = 400,
  });
}
