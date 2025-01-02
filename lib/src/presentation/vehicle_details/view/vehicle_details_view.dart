import 'package:fipe_app/src/core/utils/app_routes.dart';
import 'package:fipe_app/src/service/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class VehicleDetailsView extends StatefulWidget {
  const VehicleDetailsView({super.key});

  static const routeName = AppRoutes.vehicleDetailsRoute;

  @override
  State<VehicleDetailsView> createState() => _VehicleDetailsViewState();
}

class _VehicleDetailsViewState extends State<VehicleDetailsView> {
  final _navigationService = GetIt.I<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: ElevatedButton(
          onPressed: () {
            _navigationService.goBack();
          },
          child: Text('voltar')),
    );
  }
}
