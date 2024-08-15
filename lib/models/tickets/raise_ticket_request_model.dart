class RaiseTicketRequestModel {
  final String? assetId;
  final String? issueType;
  final String? description;
  final List<String>? assetImages;

  RaiseTicketRequestModel({
    this.assetId,
    this.issueType,
    this.description,
    this.assetImages,
  });

  factory RaiseTicketRequestModel.fromJson(Map<String, dynamic> json) {
    return RaiseTicketRequestModel(
      assetId: json['assetId'] ,
      issueType: json['issueType'] ,
      description: json['description'] ,
      assetImages: List<String>.from(json['assetImages']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'assetId': assetId,
      'issueType': issueType,
      'description': description,
      'assetImages': assetImages,
    };
  }
}
