import 'package:fipe_app/src/core/utils/app_routes.dart';
import 'package:fipe_app/src/core/utils/common_widgets/dismiss_keyboard.dart';
import 'package:fipe_app/src/data/local/local_vehicle/models/local_vehicle_model.dart';
import 'package:fipe_app/src/presentation/register_new_vehicle_screen/view/register_new_vehicle_view.dart';
import 'package:fipe_app/src/presentation/single_consultation_screen/view/single_consultation_view.dart';
import 'package:fipe_app/src/presentation/vehicle_details_screen/view/vehicle_details_view.dart';
import 'package:fipe_app/src/presentation/vehicles_list_screen/view/vehicles_list_view.dart';
import 'package:fipe_app/src/service/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      childWidget: MaterialApp(
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
                  return RegisterNewVehicleView();
                case SingleConsultationView.routeName:
                  return SingleConsultationView();
                case VehicleDetailsView.routeName:
                  return VehicleDetailsView(
                    localVehicle: routeSettings.arguments as LocalVehicleModel,
                  );
                default:
                  return const VehiclesListView();
              }
            },
          );
        },
      ),
    );
  }
}
