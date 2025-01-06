import 'package:fipe_app/src/core/utils/app_strings.dart';
import 'package:fipe_app/src/core/utils/utils.dart';
import 'package:fipe_app/src/data/remote/vehicle_style/models/vehicle_style_model.dart';
import 'package:fipe_app/src/presentation/register_new_vehicle_screen/view/widget/custom_dropdown.dart';
import 'package:flutter/material.dart';

class VehicleModelSelectionSection<T> extends StatelessWidget {
  const VehicleModelSelectionSection({
    super.key,
    required this.controller,
  });

  final T controller;

  @override
  Widget build(BuildContext context) {
    final specificController = verifyController(controller: controller);

    return ValueListenableBuilder(
      valueListenable: specificController.vehicleStylesList
          as ValueNotifier<List<VehicleStyleModel>>,
      builder: (context, vehicleStylesList, _) {
        if (vehicleStylesList.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(AppStrings.vehicleModelString),
                const SizedBox(height: 15),
                CustomDropdown(
                  dropdownWidth: MediaQuery.of(context).size.width,
                  selectedValue:
                      specificController.selectedVehicleStyleCode.value,
                  dropDownItems: vehicleStylesList.map(
                    (vehicleStyle) {
                      return DropdownMenuItem<String>(
                        alignment: Alignment.center,
                        value: vehicleStyle.code.toString(),
                        child: Text(vehicleStyle.name),
                      );
                    },
                  ).toList(),
                  onChangedFunction: (String? vehicleStyleCode) async {
                    specificController.selectVehicleStyle(
                      vehicleStyleCode: vehicleStyleCode!,
                    );
                    await specificController.getYearsList(context);
                  },
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
