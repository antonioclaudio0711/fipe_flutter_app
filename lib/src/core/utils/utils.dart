import 'package:fipe_app/src/core/utils/app_assets.dart';
import 'package:fipe_app/src/core/utils/app_strings.dart';
import 'package:fipe_app/src/core/utils/common_widgets/customize_button.dart';
import 'package:fipe_app/src/presentation/register_new_vehicle_screen/controller/register_new_vehicle_controller.dart';
import 'package:fipe_app/src/presentation/single_consultation_screen/controller/single_consultation_controller.dart';
import 'package:flutter/material.dart';

final List<String> filterTypes = ['Marca', 'Ano'];
final List<String> vehicleTypes = ['Carro', 'Moto', 'Caminhão'];

void showErrorDialog({
  required BuildContext context,
  required String error,
  required goBackFunction,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Center(
          child: Text(AppStrings.errorString),
        ),
        content: Text(
          error,
          textAlign: TextAlign.justify,
        ),
        actions: [
          CustomizeButton(
            buttonPadding: EdgeInsets.zero,
            onTapFunction: goBackFunction,
            buttonBackgroundColor: Colors.red,
            buttonTextColor: Colors.white,
            buttonText: AppStrings.goBackString,
          )
        ],
      );
    },
  );
}

dynamic verifyController<T>({required T controller}) {
  if (controller is RegisterNewVehicleController) {
    return controller as RegisterNewVehicleController;
  } else if (controller is SingleConsultationController) {
    return controller as SingleConsultationController;
  }
}

String convertRemoteVehicleType({required int vehicleType}) {
  switch (vehicleType) {
    case 1:
      return 'Carro';
    case 2:
      return 'Moto';
    case 3:
      return 'Caminhão';
    default:
      return '';
  }
}

String convertVehicleTypeString({required String vehicleType}) {
  switch (vehicleType) {
    case 'Carro':
      return 'carros';
    case 'Moto':
      return 'motos';
    case 'Caminhão':
      return 'caminhoes';
    default:
      return "";
  }
}

String cardImageAccordingVehicleType({required int vehicleType}) {
  switch (convertRemoteVehicleType(
    vehicleType: vehicleType,
  )) {
    case 'Carro':
      return AppAssets.carVectorIconAsset;
    case 'Moto':
      return AppAssets.motoVectorIconAsset;
    case 'Caminhão':
      return AppAssets.truckVectorIconAsset;
    default:
      return '';
  }
}
