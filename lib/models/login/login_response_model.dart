class LoginResponseModel {
  LoginResponseModel({
    this.token,
    this.refreshToken,

  });

  LoginResponseModel.fromJson(dynamic json) {
    token = json['token'];
    refreshToken = json['refreshToken'];
  }

  String? token;
  String? refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['refreshToken'] = refreshToken;
    return map;
  }
}
