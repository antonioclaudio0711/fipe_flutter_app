import 'package:fipe_app/src/core/utils/app_strings.dart';
import 'package:fipe_app/src/presentation/register_new_vehicle_screen/controller/register_new_vehicle_controller.dart';
import 'package:fipe_app/src/presentation/register_new_vehicle_screen/view/widget/custom_dropdown.dart';
import 'package:flutter/material.dart';

class VehicleBrandSelectionSection extends StatefulWidget {
  const VehicleBrandSelectionSection({super.key, required this.controller});

  final RegisterNewVehicleController controller;

  @override
  State<VehicleBrandSelectionSection> createState() =>
      _VehicleBrandSelectionSectionState();
}

class _VehicleBrandSelectionSectionState
    extends State<VehicleBrandSelectionSection> {
  RegisterNewVehicleController get controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.brandsList,
      builder: (context, brandsList, _) {
        if (brandsList.isNotEmpty) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(AppStrings.vehicleBrandString),
              CustomDropdown(
                dropdownWidth: MediaQuery.of(context).size.width / 2,
                selectedValue: controller.selectedBrandCode.value,
                dropDownItems: brandsList.map(
                  (brand) {
                    return DropdownMenuItem<String>(
                      alignment: Alignment.center,
                      value: brand.code,
                      child: Text(brand.name!),
                    );
                  },
                ).toList(),
                onChangedFunction: (String? brandCode) async {
                  await controller.selectBrand(brandCode: brandCode!);
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
