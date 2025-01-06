import 'package:fipe_app/src/core/utils/app_strings.dart';
import 'package:fipe_app/src/core/utils/utils.dart';
import 'package:fipe_app/src/data/remote/brand/models/brand_model.dart';
import 'package:fipe_app/src/presentation/register_new_vehicle_screen/view/widget/custom_dropdown.dart';
import 'package:flutter/material.dart';

class VehicleBrandSelectionSection<T> extends StatelessWidget {
  const VehicleBrandSelectionSection({super.key, required this.controller});

  final T controller;

  @override
  Widget build(BuildContext context) {
    final specificController = verifyController(controller: controller);

    return ValueListenableBuilder(
      valueListenable:
          specificController.brandsList as ValueNotifier<List<BrandModel>>,
      builder: (context, brandsList, _) {
        if (brandsList.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(AppStrings.vehicleBrandString),
                CustomDropdown(
                  dropdownWidth: MediaQuery.of(context).size.width / 2,
                  selectedValue: specificController.selectedBrandCode.value,
                  dropDownItems: brandsList.map(
                    (brand) {
                      return DropdownMenuItem<String>(
                        alignment: Alignment.center,
                        value: brand.code,
                        child: Text(
                          brand.name,
                          style: const TextStyle(fontSize: 14),
                        ),
                      );
                    },
                  ).toList(),
                  onChangedFunction: (String? brandCode) async {
                    specificController.selectBrand(brandCode: brandCode!);
                    await specificController.getVehiclesStyleList(context);
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
