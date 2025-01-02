import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:fipe_app/src/service/http/client_interceptor.dart';
import 'package:fipe_app/src/service/http/http_service.dart';
import 'package:fipe_app/src/service/navigation/navigation_service.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // App Navigation
  sl.registerLazySingleton(() => NavigationService());

  // DIO
  sl.registerLazySingleton(() => Dio());
  sl.registerFactory(() => CookieJar());
  sl.registerFactory(() => ClientInterceptor());
  sl.registerFactory<IHttpService>(
    () => HttpService(
      sl(),
      sl(),
      sl(),
    ),
  );
}
