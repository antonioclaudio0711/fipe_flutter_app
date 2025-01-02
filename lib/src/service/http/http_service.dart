import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:fipe_app/src/service/http/client_interceptor.dart';

abstract class IHttpService<T> {
  CookieJar getCookieJar();

  Future<Response<T>> get(
    String path, {
    Options? options,
  });

  Future<Response<T>> post(
    String path,
    dynamic data, {
    ProgressCallback? onSendProgress,
  });

  Future<Response<T>> put(
    String path,
    dynamic data,
  );

  Future<Response<T>> patch(
    String path,
    dynamic data,
  );

  Future<Response<T>> delete(
    String path,
    dynamic data,
  );

  Future<Response<T>> fetch(
    RequestOptions requestOptions,
  );
}

class HttpService extends IHttpService {
  final Dio dio;
  final CookieJar cookieJar;
  final ClientInterceptor clientInterceptor;

  HttpService(
    this.dio,
    this.cookieJar,
    this.clientInterceptor,
  ) {
    dio.interceptors.add(clientInterceptor);
    dio.interceptors.add(CookieManager(cookieJar));
  }

  @override
  Future<Response> get(
    String path, {
    Options? options,
  }) async {
    return await dio.get(
      path,
      options: options,
    );
  }

  @override
  Future<Response> post(
    String path,
    data, {
    ProgressCallback? onSendProgress,
  }) async {
    return await dio.post(
      path,
      data: data,
      onSendProgress: onSendProgress,
    );
  }

  @override
  Future<Response> put(
    String path,
    data,
  ) async {
    return await dio.put(
      path,
      data: data,
    );
  }

  @override
  Future<Response> patch(
    String path,
    data,
  ) async {
    return await dio.patch(
      path,
      data: data,
    );
  }

  @override
  Future<Response> delete(
    String path,
    data,
  ) async {
    return await dio.delete(
      path,
      data: data,
    );
  }

  @override
  Future<Response> fetch(RequestOptions requestOptions) async {
    return await dio.fetch(requestOptions);
  }

  @override
  CookieJar getCookieJar() {
    return cookieJar;
  }
}
