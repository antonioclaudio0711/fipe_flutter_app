import 'package:fipe_app/src/core/utils/app_strings.dart';
import 'package:fipe_app/src/core/utils/common_widgets/customize_button.dart';
import 'package:fipe_app/src/core/utils/utils.dart';
import 'package:fipe_app/src/data/remote/remote_vehicle/models/remote_vehicle_model.dart';
import 'package:fipe_app/src/presentation/register_new_vehicle_screen/controller/register_new_vehicle_controller.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.controller,
  });

  final RegisterNewVehicleController controller;

  @override
  Widget build(BuildContext context) {
    final RemoteVehicleModel remoteVehicle = controller.remoteVehicle.value!;
    final String vehiclePlate = controller.vehiclePlateController.text;
    final String vehicleColor = controller.vehicleColorController.text;

    return AlertDialog(
      title: const Text(
        AppStrings.registeredDataIsCorrectString,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${AppStrings.vehicleTypeString} ${convertRemoteVehicleType(vehicleType: remoteVehicle.vehicleType)}',
          ),
          Text(
            '${AppStrings.vehicleBrandString} ${remoteVehicle.brand}',
          ),
          Text(
            '${AppStrings.vehicleModelString} ${remoteVehicle.model}',
          ),
          Text(
            '${AppStrings.vehicleYearString} ${remoteVehicle.modelYear}',
          ),
          Text(
            '${AppStrings.vehiclePlateString} ${vehiclePlate.isEmpty ? AppStrings.notInformedString : vehiclePlate}',
          ),
          Text(
            '${AppStrings.vehicleColorString} ${vehicleColor.isEmpty ? AppStrings.notInformedString : vehiclePlate}',
          ),
        ],
      ),
      actions: [
        CustomizeButton(
          buttonPadding: EdgeInsets.zero,
          onTapFunction: () => controller.navigationService.goBack(),
          buttonBackgroundColor: Colors.red,
          buttonTextColor: Colors.white,
          buttonText: AppStrings.goBackString,
        ),
        CustomizeButton(
          buttonPadding: EdgeInsets.zero,
          onTapFunction: () => controller.registerVehicle(),
          buttonBackgroundColor: Colors.green,
          buttonTextColor: Colors.white,
          buttonText: AppStrings.registerButtonString,
        ),
      ],
    );
  }
}
