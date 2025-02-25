import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:online_exams/core/api_helper/api_consumer/api_consumer.dart';
import 'package:online_exams/core/api_helper/api_consumer/dio_consumer.dart';
import 'package:online_exams/core/api_helper/api_result/api_result.dart';
import 'package:online_exams/core/constant/api_const.dart';
import 'package:online_exams/features/auth/data/models/request/login_request.dart';
import 'package:online_exams/features/auth/data/models/response/login_response.dart';

@lazySingleton
class ApiAuth {
  ApiConsumer apiConsumer;

  ApiAuth(this.apiConsumer);
  //? login function
  Future<ApiResult<RegisterResponse>> register(RegisterRequest request) async {
    try {
      final response = await apiConsumer.post(
        ApiConst.register,
        data: request.toJson(),
      );
      return Success(RegisterResponse.fromJson(response));
    } on ServerException catch (e) {
      return Error(e.errorMessage.toString());
    } on SocketException catch (e) {
      return const Error("No Internet Connection");
    } catch (e) {
      return Error(e.toString());
    }
  }
}
