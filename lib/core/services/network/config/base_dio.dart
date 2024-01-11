import 'package:dio/dio.dart';
import 'package:taskapp/core/services/network/config/dio_interceptor.dart';
import 'package:taskapp/core/services/network/config/end_points.dart';

class BaseDio {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: APIEndPoints.baseApiUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(milliseconds: 30000),
      receiveTimeout: const Duration(milliseconds: 30000),
      headers: {
        'Content-Type': 'application/json',
      },
      validateStatus: (int? status) {
        return (status ?? 0) < 500;
      },
    ),
  )..interceptors.addAll([
      DioInterceptor(),
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
        requestHeader: true,
        responseHeader: true,
        request: true,
      ),
    ]);
}
