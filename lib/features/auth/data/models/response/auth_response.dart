import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  String? message;
  String? token;
  AuthUser? user;

  AuthResponse({this.message, this.token, this.user});

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}

@JsonSerializable()
class AuthUser {
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  bool? isVerified;
  String? sId;
  String? createdAt;

  AuthUser(
      {this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.role,
      this.isVerified,
      this.sId,
      this.createdAt});

  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);

  Map<String, dynamic> toJson() => _$AuthUserToJson(this);
}
