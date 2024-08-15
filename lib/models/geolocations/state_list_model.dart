class StateListModel {
  StateListModel({
    List<StateListItemModel>? data,
  }) {
    _data = data;
  }

  StateListModel.fromList(List<dynamic>? lst) {
    if (lst != null && lst.isNotEmpty) {
      _data = [];
      for (var v in lst) {
        _data?.add(StateListItemModel.fromJson(v));
      }
    }
  }

  StateListModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(StateListItemModel.fromJson(v));
      });
    }
  }

  List<StateListItemModel>? _data;

  List<StateListItemModel>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class StateListItemModel {
  StateListItemModel({
    this.id,
    this.stateName,
    this.stateCode,
    this.countryId,
    this.countryName,
    this.countryCode,
  });

  StateListItemModel.fromJson(dynamic json) {
    id = json['id'] ?? json['stateId'];
    stateName = json['stateName'];
    stateCode = json['stateCode'];
    countryId = json['countryId'];
    countryName = json['countryName'];
    countryCode = json['countryCode'];
  }

  String? id;
  String? stateName;
  String? stateCode;
  String? countryId;
  String? countryName;
  String? countryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['stateName'] = stateName;
    map['stateCode'] = stateCode;
    map['countryId'] = countryId;
    map['countryName'] = countryName;
    map['countryCode'] = countryCode;
    return map;
  }
}
