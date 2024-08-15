import 'package:go_desk_workplace/models/configurations/configuration_model.dart';

class ConfigurationsListByCategoryInModel {
  ConfigurationsListByCategoryInModel({
    List<ConfigurationByCategoryInItemModel>? data,
  }) {
    _data = data;
  }

  ConfigurationsListByCategoryInModel.fromList(List<dynamic>? lst) {
    if (lst != null && lst.isNotEmpty) {
      _data = [];
      for (var v in lst) {
        _data?.add(ConfigurationByCategoryInItemModel.fromJson(v));
      }
    }
  }

  ConfigurationsListByCategoryInModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ConfigurationByCategoryInItemModel.fromJson(v));
      });
    }
  }

  List<ConfigurationByCategoryInItemModel>? _data;

  List<ConfigurationByCategoryInItemModel>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ConfigurationByCategoryInItemModel {
  ConfigurationByCategoryInItemModel({
      this.category, 
      this.content,});

  ConfigurationByCategoryInItemModel.fromJson(dynamic json) {
    category = json['category'];
    if (json['content'] != null) {
      content = [];
      json['content'].forEach((v) {
        content?.add(ConfigurationModel.fromJson(v));
      });
    }
  }
  String? category;
  List<ConfigurationModel>? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category'] = category;
    if (content != null) {
      map['content'] = content?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}