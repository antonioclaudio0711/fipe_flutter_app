import 'package:fipe_app/src/core/utils/app_strings.dart';
import 'package:fipe_app/src/core/utils/utils.dart';
import 'package:flutter/material.dart';

class VehicleFipePriceDialog extends StatelessWidget {
  const VehicleFipePriceDialog({
    super.key,
    required this.dialogTitle,
    required this.vehicleType,
    required this.vehicleBrand,
    required this.vehicleModel,
    required this.vehicleYear,
    required this.vehicleFipeTablePrice,
    required this.actionsButtons,
  });

  final String dialogTitle;
  final int vehicleType;
  final String vehicleBrand;
  final String vehicleModel;
  final int vehicleYear;
  final String vehicleFipeTablePrice;
  final List<Widget> actionsButtons;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          dialogTitle,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${AppStrings.vehicleTypeString} ${convertRemoteVehicleType(vehicleType: vehicleType)}',
          ),
          Text(
            '${AppStrings.vehicleBrandString} $vehicleBrand',
          ),
          Text(
            '${AppStrings.vehicleModelString} $vehicleModel',
          ),
          Text(
            '${AppStrings.vehicleYearString} $vehicleYear',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: Text(
                vehicleFipeTablePrice,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
      actions: actionsButtons,
    );
  }
}
