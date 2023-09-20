class AllEmployeesModel {
  String? message;
  List<Data>? data;
  bool? status;
  int? code;

  AllEmployeesModel({this.message, this.data, this.status, this.code});

  AllEmployeesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    status = json['status'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['code'] = code;
    return data;
  }
}

class Data {
  int? id;
  String? userCode;
  String? name;
  String? email;
  int? phone;
  String? status;
  String? userType;
  int? departmentId;

  Data(
      {this.id,
      this.userCode,
      this.name,
      this.email,
      this.phone,
      this.status,
      this.userType,
      this.departmentId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userCode = json['user_code'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    userType = json['user_type'];
    departmentId = json['department_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_code'] = userCode;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['status'] = status;
    data['user_type'] = userType;
    data['department_id'] = departmentId;
    return data;
  }
}
