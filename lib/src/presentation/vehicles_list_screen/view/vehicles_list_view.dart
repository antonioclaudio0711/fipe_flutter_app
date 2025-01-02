import 'package:fipe_app/src/core/utils/app_routes.dart';
import 'package:fipe_app/src/service/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class VehiclesListView extends StatefulWidget {
  const VehiclesListView({super.key});

  static const routeName = AppRoutes.initialAppRoute;

  @override
  State<VehiclesListView> createState() => _VehiclesListViewState();
}

class _VehiclesListViewState extends State<VehiclesListView> {
  final _navigationService = GetIt.I<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _navigationService.navigateTo(AppRoutes.vehicleDetailsRoute);
          },
          child: Text('Proxima'),
        ),
      ),
    );
  }
}
