// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestPasswordResponse _$RestPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    RestPasswordResponse(
      json['message'] as String?,
      json['token'] as String?,
    );

Map<String, dynamic> _$RestPasswordResponseToJson(
        RestPasswordResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
    };
