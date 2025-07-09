import 'package:clean_arch_app/core/errors/error_model.dart';
import 'package:dio/dio.dart';

class ServerException implements Exception{
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

void handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.sendTimeout:
        throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.receiveTimeout:
        throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.badCertificate:
        throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.cancel:
        throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.connectionError:
        throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.unknown:
        throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data));
    
      case DioExceptionType.badResponse:
        switch (e.response?.statusCode) {
          case 400: //Bad request
            throw ServerException(
                errorModel: ErrorModel.fromJson(e.response!.data));
          case 401: //unAuthorized
            throw ServerException(
                errorModel: ErrorModel.fromJson(e.response!.data));
          case 403: //forbidden
            throw ServerException(
                errorModel: ErrorModel.fromJson(e.response!.data));
          case 404: //not found
            throw ServerException(
                errorModel: ErrorModel.fromJson(e.response!.data));
          case 409: //conficient
            throw ServerException(
                errorModel: ErrorModel.fromJson(e.response!.data));
          case 422: //Unprocessable Entity
            throw ServerException(
                errorModel: ErrorModel.fromJson(e.response!.data));
          case 504: //Server exception
            throw ServerException(
                errorModel: ErrorModel.fromJson(e.response!.data));
          case 500: //internal server error
            throw ServerException(
                errorModel: ErrorModel.fromJson(e.response!.data));
          case 502: //bad Gateway
            throw ServerException(
                errorModel: ErrorModel.fromJson(e.response!.data));
          case 503: //Service Unavailable
            throw ServerException(
                errorModel: ErrorModel.fromJson(e.response!.data));

        }
    }
  }