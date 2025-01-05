import 'package:fipe_app/src/core/utils/app_strings.dart';
import 'package:fipe_app/src/presentation/register_new_vehicle_screen/controller/register_new_vehicle_controller.dart';
import 'package:fipe_app/src/presentation/register_new_vehicle_screen/view/widget/custom_dropdown.dart';
import 'package:flutter/material.dart';

class VehicleYearSelectionSection extends StatelessWidget {
  const VehicleYearSelectionSection({
    super.key,
    required this.controller,
  });

  final RegisterNewVehicleController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.yearsList,
      builder: (context, yearsList, _) {
        if (yearsList.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(AppStrings.vehicleYearString),
                CustomDropdown(
                  dropdownWidth: MediaQuery.of(context).size.width / 2,
                  selectedValue: controller.selectedYearCode.value,
                  dropDownItems: yearsList.map(
                    (year) {
                      return DropdownMenuItem<String>(
                        alignment: Alignment.center,
                        value: year.code,
                        child: Text(year.name),
                      );
                    },
                  ).toList(),
                  onChangedFunction: (String? yearCode) {
                    controller.selectYearCode(yearCode: yearCode!);
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
