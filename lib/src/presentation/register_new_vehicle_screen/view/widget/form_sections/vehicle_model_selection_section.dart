import 'package:fipe_app/src/core/utils/app_strings.dart';
import 'package:fipe_app/src/presentation/register_new_vehicle_screen/controller/register_new_vehicle_controller.dart';
import 'package:fipe_app/src/presentation/register_new_vehicle_screen/view/widget/custom_dropdown.dart';
import 'package:flutter/material.dart';

class VehicleModelSelectionSection extends StatefulWidget {
  const VehicleModelSelectionSection({
    super.key,
    required this.controller,
  });

  final RegisterNewVehicleController controller;

  @override
  State<VehicleModelSelectionSection> createState() =>
      _VehicleModelSelectionSectionState();
}

class _VehicleModelSelectionSectionState
    extends State<VehicleModelSelectionSection> {
  RegisterNewVehicleController get controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.vehicleStylesList,
      builder: (context, vehicleStylesList, _) {
        if (vehicleStylesList.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(AppStrings.vehicleModelString),
              const SizedBox(height: 15),
              CustomDropdown(
                dropdownWidth: MediaQuery.of(context).size.width,
                selectedValue: controller.selectedVehicleStyleCode.value,
                dropDownItems: vehicleStylesList.map(
                  (vehicleStyle) {
                    return DropdownMenuItem<String>(
                      alignment: Alignment.center,
                      value: vehicleStyle.code.toString(),
                      child: Text(vehicleStyle.name!),
                    );
                  },
                ).toList(),
                onChangedFunction: (String? vehicleStyleCode) {
                  controller.selectVehicleStyle(
                    vehicleStyleCode: vehicleStyleCode!,
                  );
                  setState(() {});
                },
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
