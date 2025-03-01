import 'package:json_annotation/json_annotation.dart';

part 'verify_response.g.dart';

@JsonSerializable()
class VerifyResponse {
  final String? status;

  VerifyResponse({this.status});

  factory VerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyResponseFromJson(json);
}
