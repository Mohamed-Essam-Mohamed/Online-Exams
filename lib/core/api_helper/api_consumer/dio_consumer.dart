import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exams/core/api_helper/api_consumer/api_consumer.dart';
import 'package:online_exams/core/constant/api_const.dart';

@LazySingleton(as: ApiConsumer)
class DioConsumer implements ApiConsumer {
  late Dio dio;

  DioConsumer() {
    dio = Dio();
    dio.options.baseUrl = ApiConst.baseUrl;
    // dio.interceptors.add(LogInterceptor(
    //   request: true,
    //   requestHeader: true,
    //   requestBody: true,
    //   responseHeader: true,
    //   responseBody: true,
    //   error: true,
    // )); // print status api in consol
  }
  @override
  Future get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future put(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final response = await dio.put(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException.fromJson(e.response?.data);
    case DioExceptionType.sendTimeout:
      throw ServerException.fromJson(e.response?.data);
    case DioExceptionType.receiveTimeout:
      throw ServerException.fromJson(e.response?.data);
    case DioExceptionType.badCertificate:
      throw ServerException.fromJson(e.response?.data);
    case DioExceptionType.cancel:
      throw ServerException.fromJson(e.response?.data);
    case DioExceptionType.connectionError:
      throw ServerException.fromJson(e.response?.data);
    case DioExceptionType.unknown:
      throw ServerException.fromJson(e.response?.data);
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad request
          throw ServerException.fromJson(e.response?.data);
        case 401: //unauthorized
          throw ServerException.fromJson(e.response?.data);
        case 403: //forbidden
          throw ServerException.fromJson(e.response?.data);
        case 404: //not found
          throw ServerException.fromJson(e.response?.data);
        case 409: //cofficient
          throw ServerException.fromJson(e.response?.data);
        case 422: //  Unprocessable Entity
          throw ServerException.fromJson(e.response?.data);
        case 504: // Server exception
          throw ServerException.fromJson(e.response?.data);
      }
  }
}

// class ApiInterceptor extends Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     options.headers['Content-Type'] = 'application/json';
//     super.onRequest(options, handler);
//   }
// }

// server exception
class ServerException implements Exception {
  final String? errorMessage;
  final int? statusCode;
  ServerException(this.errorMessage, {this.statusCode});
  factory ServerException.fromJson(Map<String, dynamic> json) {
    return ServerException(
      json['message'] as String?,
      statusCode: json['code'] as int?,
    );
  }
}


// return dio instance