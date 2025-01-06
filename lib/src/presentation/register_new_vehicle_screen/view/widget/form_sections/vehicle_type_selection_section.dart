import 'package:fipe_app/src/core/utils/app_strings.dart';
import 'package:fipe_app/src/core/utils/utils.dart';
import 'package:fipe_app/src/core/utils/common_widgets/type_card.dart';
import 'package:flutter/material.dart';

class VehicleTypeSelectionSection<T> extends StatelessWidget {
  const VehicleTypeSelectionSection({super.key, required this.controller});

  final T controller;

  @override
  Widget build(BuildContext context) {
    final specificController = verifyController(controller: controller);

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          const Text(AppStrings.typeVehicleSelectionString),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: vehicleTypes.map(
              (vehicleType) {
                return ValueListenableBuilder(
                  valueListenable: specificController.selectedVehicleTypeButton,
                  builder: (context, selectedVehicleTypeButton, _) {
                    return TypeCard(
                      onTapFunction: () async {
                        specificController.selectVehicleType(
                            vehicleType: vehicleType);
                        await specificController.getBrandsList(context);
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
      ),
    );
  }
}
