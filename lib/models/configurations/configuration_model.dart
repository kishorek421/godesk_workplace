class ConfigurationModel {
  ConfigurationModel({
    this.id,
    this.key,
    this.value,
    this.category,
    this.description,});

  ConfigurationModel.fromJson(dynamic json) {
    id = json['id'];
    key = json['key'];
    value = json['value'];
    category = json['category'];
    description = json['description'];
  }
  String? id;
  String? key;
  String? value;
  String? category;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['key'] = key;
    map['value'] = value;
    map['category'] = category;
    map['description'] = description;
    return map;
  }

}