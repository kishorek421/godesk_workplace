class CountryListModel {
  CountryListModel({
    List<CountryListItemModel>? data,
  }) {
    _data = data;
  }

  CountryListModel.fromList(List<dynamic>? lst) {
    if (lst != null && lst.isNotEmpty) {
      _data = [];
      for (var v in lst) {
        _data?.add(CountryListItemModel.fromJson(v));
      }
    }
  }

  CountryListModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(CountryListItemModel.fromJson(v));
      });
    }
  }

  List<CountryListItemModel>? _data;

  List<CountryListItemModel>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class CountryListItemModel {
  CountryListItemModel({
    this.id,
    this.countryName,
    this.countryCode,
    this.phoneCode,
  });

  CountryListItemModel.fromJson(dynamic json) {
    id = json['id'] ?? json['countryId'];
    countryName = json['countryName'];
    countryCode = json['countryCode'];
    phoneCode = json['phoneCode'];
  }

  String? id;
  String? countryName;
  String? countryCode;
  String? phoneCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['countryName'] = countryName;
    map['countryCode'] = countryCode;
    map['phoneCode'] = phoneCode;
    return map;
  }
}
