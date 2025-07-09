import 'package:clean_arch_app/core/api/dio_interceptor.dart';
import 'package:clean_arch_app/core/api/end_pionts.dart';
import 'package:clean_arch_app/core/errors/expction.dart';
import 'package:dio/dio.dart';
import 'package:clean_arch_app/core/api/api_consumer.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;
  

  DioConsumer({required this.dio}){
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.clear();
    dio.interceptors.add(DioInterceptor(dio: dio));
    dio.interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true));
  }

  @override
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(path, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future<dynamic> post(String path, {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.post(path, data: body, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future<dynamic> patch(String path, {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.patch(path, data: body, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future<dynamic> delete(String path, {Map<String, dynamic>? body}) async {
    try {
      final response = await dio.delete(path, data: body);
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  } 
}