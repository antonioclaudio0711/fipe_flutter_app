import 'package:fipe_app/src/core/utils/app_strings.dart';
import 'package:fipe_app/src/presentation/register_new_vehicle_screen/controller/register_new_vehicle_controller.dart';
import 'package:fipe_app/src/presentation/register_new_vehicle_screen/view/widget/vehicle_type_card.dart';
import 'package:flutter/material.dart';

class VehicleTypeSelectionSection extends StatelessWidget {
  const VehicleTypeSelectionSection({super.key, required this.controller});

  final RegisterNewVehicleController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(AppStrings.typeVehicleSelectionString),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: controller.vehicleTypes.map(
            (vehicleType) {
              return ValueListenableBuilder(
                valueListenable: controller.selectedVehicleTypeButton,
                builder: (context, selectedVehicleTypeButton, _) {
                  return VehicleTypeCard(
                    onTapFunction: () async {
                      await controller.selectVehicleType(
                        vehicleType: vehicleType,
                      );
                    },
                    cardName: vehicleType,
                    buttonBackgroundColor:
                        selectedVehicleTypeButton == vehicleType
                            ? Colors.black
                            : null,
                    buttonTextColor: selectedVehicleTypeButton == vehicleType
                        ? Colors.white
                        : null,
                  );
                },
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
