import 'package:go_desk_workplace/models/configurations/configuration_model.dart';

class ConfigurationsListByCategoryKeyModel {
  ConfigurationsListByCategoryKeyModel({
    List<ConfigurationModel>? data,
  }) {
    _data = data;
  }

  ConfigurationsListByCategoryKeyModel.fromList(List<dynamic>? lst) {
    if (lst != null && lst.isNotEmpty) {
      _data = [];
      for (var v in lst) {
        _data?.add(ConfigurationModel.fromJson(v));
      }
    }
  }

  ConfigurationsListByCategoryKeyModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ConfigurationModel.fromJson(v));
      });
    }
  }

  List<ConfigurationModel>? _data;

  List<ConfigurationModel>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}