import 'dart:io';

import 'package:dio/dio.dart';

class ClientInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.baseUrl = 'https://parallelum.com.br/fipe/api/v1';
    options.followRedirects = false;
    options.headers = {
      'Content-Type': 'application/json',
      'Device': Platform.isAndroid ? 'ANDROID' : 'IOS'
    };

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }
}
