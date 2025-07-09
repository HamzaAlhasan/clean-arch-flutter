import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  Dio dio;

  DioInterceptor({required this.dio});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Attach the current access token to the request headers
    // if (options.path != apiUrl + ApiEndPoints.refreshToken) {
    //   print('hello token');
    //   final accessToken = await SharedPrefrenceHelper.getAccessToken();
    //   print('accessToken is $accessToken');
    //   if (accessToken != null) {
    //     options.headers['Authorization'] = 'Bearer $accessToken';
    //   }
    // }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('code is ${response.statusCode}');
    super.onResponse(response, handler);
  }

  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // If the access token has expired (Unauthorized), try refreshing the token
    // if (err.response?.data['message'] == 'Unauthorized' || err.response?.data['message'] == 'Forbidden resource') {
    //   try {
    //     final newToken = await UserApi.refreshToken();
    //     await SharedPrefrenceHelper.setAccessToken(newToken['accessToken']);
    //     await SharedPrefrenceHelper.setRefreshToken(newToken['refreshToken']);
    //     if (newToken['accessToken'] != null) {
    //       dio.options.headers['Authorization'] =
    //           'Bearer ${newToken['accessToken']}';
    //       final opts = Options(
    //           method: err.requestOptions.method,
    //           headers: err.requestOptions.headers);
    //       try {
    //         final cloneReq = await dio.request(
    //           err.requestOptions.path,
    //           options: opts,
    //           data: err.requestOptions.data,
    //           queryParameters: err.requestOptions.queryParameters,
    //         );
    //         return handler.resolve(cloneReq);
    //       } on DioException catch (e) {
    //         return handler.reject(
    //           DioException(
    //             requestOptions: err.requestOptions,
    //             response: e.response,
    //             type: DioExceptionType.badResponse,
    //             //  error: 'Failed to retry request after refreshing token',
    //           ),
    //         );
    //       }
    //     }
    //     return handler.reject(err);
    //   } on ServerException catch (e) {
    //     return handler.reject(err);
    //   }
    // } else if (err.response?.data['statusCode'] == 401) {
    //   Fluttertoast.showToast(
    //           msg: err.response?.data['message'],
    //           gravity: ToastGravity.TOP,
    //           backgroundColor: Colors.red)
    //       .then((_) => SharedPrefrenceHelper.logOut()
    //           .then((_) => NavigationService.navigateToLogin()));
    //   return;
    // }
    return handler.next(err);
  }
}