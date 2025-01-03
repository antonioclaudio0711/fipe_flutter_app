import 'package:fipe_app/src/core/utils/app_routes.dart';
import 'package:fipe_app/src/presentation/register_new_vehicle_screen/view/register_new_vehicle_view.dart';
import 'package:fipe_app/src/presentation/vehicles_list_screen/view/vehicles_list_view.dart';
import 'package:fipe_app/src/service/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FIPE App',
      initialRoute: AppRoutes.initialAppRoute,
      navigatorKey: GetIt.I<NavigationService>().navigatorKey,
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case VehiclesListView.routeName:
                return const VehiclesListView();
              case RegisterNewVehicleView.routeName:
                return const RegisterNewVehicleView();
              default:
                return const VehiclesListView();
            }
          },
        );
      },
    );
  }
}
