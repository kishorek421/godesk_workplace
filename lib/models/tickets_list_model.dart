class TicketsListModel {
  TicketsListModel({
    List<TicketItemModel>? data,
  }) {
    _data = data;
  }

  TicketsListModel.fromList(List<dynamic>? lst) {
    if (lst != null && lst.isNotEmpty) {
      _data = [];
      for (var v in lst) {
        _data?.add(TicketItemModel.fromJson(v));
      }
    }
  }

  TicketsListModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(TicketItemModel.fromJson(v));
      });
    }
  }

  List<TicketItemModel>? _data;

  List<TicketItemModel>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class TicketItemModel {
  final String? status;
  final String? raisedDate;
  final String? ticketId;
  final String? issueDevice;
  final String? issueType;
  final String? issueSubType;
  final String? description;
  final List<String>? assetImages;
  final int? createdAt;

  TicketItemModel({
    this.status,
    this.raisedDate,
    this.ticketId,
    this.issueDevice,
    this.issueType,
    this.issueSubType,
    this.description,
    this.assetImages,
    this.createdAt,
  });

  factory TicketItemModel.fromJson(Map<String, dynamic> json) {
    return TicketItemModel(
      status: json['status'] as String,
      raisedDate: json['raisedDate'] as String,
      ticketId: json['ticketId'] as String,
      issueDevice: json['issueDevice'] as String,
      issueType: json['issueType'] as String,
      issueSubType: json['issueSubType'] as String,
      description: json['description'] as String,
      assetImages: List<String>.from(json['assetImages'] as List),
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'raisedDate': raisedDate,
      'ticketId': ticketId,
      'issueDevice': issueDevice,
      'issueType': issueType,
      'issueSubType': issueSubType,
      'description': description,
      'assetImages': assetImages,
      'createdAt': createdAt,
    };
  }
}
