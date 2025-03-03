import 'package:json_annotation/json_annotation.dart';

part 'rest_password_response.g.dart';

@JsonSerializable()
class RestPasswordResponse {
  final String? message;
  final String? token;
  RestPasswordResponse(this.message, this.token);
  factory RestPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$RestPasswordResponseFromJson(json);
}
