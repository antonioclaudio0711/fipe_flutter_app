import 'package:fipe_app/src/core/utils/app_routes.dart';
import 'package:fipe_app/src/core/utils/common_widgets/customize_app_scaffold.dart';
import 'package:fipe_app/src/data/local/local_vehicle/models/local_vehicle_model.dart';
import 'package:flutter/material.dart';

class VehicleDetailsView extends StatelessWidget {
  const VehicleDetailsView({
    super.key,
    required this.localVehicle,
  });

  static const routeName = AppRoutes.vehicleDetailsRoute;

  final LocalVehicleModel localVehicle;

  @override
  Widget build(BuildContext context) {
    return CustomizeAppScaffold(
      canPop: true,
      scaffoldBody: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Text(localVehicle.model),
              Text(localVehicle.vehicleColor!),
              Text(localVehicle.vehiclePlate!),
            ],
          ),
        ),
      ),
    );
  }
}
