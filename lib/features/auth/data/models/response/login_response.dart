import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  String? message;
  String? token;
  RegisterUser? user;

  RegisterResponse({this.message, this.token, this.user});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}

@JsonSerializable()
class RegisterUser {
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  bool? isVerified;
  String? sId;
  String? createdAt;

  RegisterUser(
      {this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.role,
      this.isVerified,
      this.sId,
      this.createdAt});

  factory RegisterUser.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserFromJson(json);
}
