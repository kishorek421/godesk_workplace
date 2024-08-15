class EmployeeDetailsModel {
  EmployeeDetailsModel({
    String? id,
    String? firstName,
    String? lastName,
    String? email,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
  }

  EmployeeDetailsModel.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
  }
  String? _id;
  String? _firstName;
  String? _lastName;
  String? _email;

  String? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    return map;
  }

}