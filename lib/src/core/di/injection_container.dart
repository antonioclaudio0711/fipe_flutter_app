import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:fipe_app/src/data/remote/brand/datasource/brand_datasource.dart';
import 'package:fipe_app/src/data/remote/brand/datasource/brand_datasource_impl.dart';
import 'package:fipe_app/src/data/remote/brand/repository/brand_repository_impl.dart';
import 'package:fipe_app/src/data/remote/vehicle_style/datasource/vehicle_style_datasource.dart';
import 'package:fipe_app/src/data/remote/vehicle_style/datasource/vehicle_style_datasource_impl.dart';
import 'package:fipe_app/src/data/remote/vehicle_style/repository/vehicle_style_repository_impl.dart';
import 'package:fipe_app/src/domain/brand/repository/brand_repository.dart';
import 'package:fipe_app/src/domain/vehicle_style/repository/vehicle_style_repository.dart';
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

  // BrandDataSource
  sl.registerFactory<BrandDatasource>(() => BrandDatasourceImpl(sl()));

  // BrandRepository
  sl.registerFactory<BrandRepository>(() => BrandRepositoryImpl(sl()));

  // VehicleStyleDataSource
  sl.registerFactory<VehicleStyleDatasource>(
      () => VehicleStyleDatasourceImpl(sl()));

  // VehicleStyleRepository
  sl.registerFactory<VehicleStyleRepository>(
      () => VehicleStyleRepositoryImpl(sl()));
}
