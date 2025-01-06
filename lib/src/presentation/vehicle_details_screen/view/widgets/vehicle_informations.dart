import 'package:fipe_app/src/core/utils/app_strings.dart';
import 'package:fipe_app/src/data/local/local_vehicle/models/local_vehicle_model.dart';
import 'package:fipe_app/src/presentation/vehicle_details_screen/view/widgets/labeled_registered_information.dart';
import 'package:flutter/material.dart';

class VehicleInformations extends StatelessWidget {
  const VehicleInformations({
    super.key,
    required this.localVehicle,
  });

  final LocalVehicleModel localVehicle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 30),
      child: Column(
        children: [
          LabeledRegisteredInformation(
            registeredInformationLabel: AppStrings.registeredPlateString,
            registeredInformation: localVehicle.vehiclePlate!,
          ),
          LabeledRegisteredInformation(
            registeredInformationLabel: AppStrings.registeredColorString,
            registeredInformation: localVehicle.vehicleColor!,
          ),
          LabeledRegisteredInformation(
            registeredInformationLabel: AppStrings.registeredModelString,
            registeredInformation: localVehicle.model,
          ),
          LabeledRegisteredInformation(
            registeredInformationLabel: AppStrings.registeredBrandString,
            registeredInformation: localVehicle.brand,
          ),
          LabeledRegisteredInformation(
            registeredInformationLabel: AppStrings.registeredYearModelString,
            registeredInformation: localVehicle.modelYear.toString(),
          ),
          LabeledRegisteredInformation(
            registeredInformationLabel: AppStrings.registeredFuelTypeString,
            registeredInformation:
                '${localVehicle.fuel} (${localVehicle.fuelAcronym})',
          ),
        ],
      ),
    );
  }
}
