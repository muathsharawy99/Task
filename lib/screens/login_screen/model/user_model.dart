class UserModel {
  String? message;
  Data? data;
  bool? status;
  int? code;

  UserModel({this.message, this.data, this.status, this.code});

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = status;
    data['code'] = code;
    return data;
  }
}

class Data {
  String? token;
  String? username;
  String? email;
  String? userType;

  Data({this.token, this.username, this.email, this.userType});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    username = json['username'];
    email = json['email'];
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['username'] = username;
    data['email'] = email;
    data['user_type'] = userType;
    return data;
  }
}
