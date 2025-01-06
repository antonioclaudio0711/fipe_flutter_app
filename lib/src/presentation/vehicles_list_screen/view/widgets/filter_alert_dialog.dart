import 'package:fipe_app/src/core/utils/app_strings.dart';
import 'package:fipe_app/src/core/utils/common_widgets/customize_button.dart';
import 'package:fipe_app/src/core/utils/utils.dart';
import 'package:fipe_app/src/core/utils/common_widgets/type_card.dart';
import 'package:fipe_app/src/presentation/register_new_vehicle_screen/view/widget/custom_dropdown.dart';
import 'package:fipe_app/src/presentation/vehicles_list_screen/controller/vehicles_list_controller.dart';
import 'package:flutter/material.dart';

class FilterAlertDialog extends StatelessWidget {
  const FilterAlertDialog({super.key, required this.controller});

  final VehiclesListController controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text(
          AppStrings.filterRegisteredVehiclesListString,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: filterTypes.map(
              (filterType) {
                return ValueListenableBuilder(
                  valueListenable: controller.selectedFilterType,
                  builder: (context, selectedFilterType, _) {
                    return TypeCard(
                      onTapFunction: () => controller.selectFilterType(
                        filterType: filterType,
                      ),
                      cardName: filterType,
                      buttonBackgroundColor: selectedFilterType == filterType
                          ? Colors.black
                          : null,
                      buttonTextColor: selectedFilterType == filterType
                          ? Colors.white
                          : null,
                    );
                  },
                );
              },
            ).toList(),
          ),
          ValueListenableBuilder(
            valueListenable: controller.listFromFilterType,
            builder: (context, listFromFilterType, _) {
              if (listFromFilterType.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: CustomDropdown(
                    dropdownWidth: MediaQuery.of(context).size.width,
                    selectedValue: controller.selectedFilterElement.value,
                    dropDownItems: listFromFilterType.map(
                      (filterElement) {
                        return DropdownMenuItem<String>(
                          alignment: Alignment.center,
                          value: filterElement,
                          child: Text(
                            filterElement,
                            style: const TextStyle(fontSize: 12),
                          ),
                        );
                      },
                    ).toList(),
                    onChangedFunction: (String? filterElement) {
                      controller.selectFilterElement(
                        filterElement: filterElement!,
                      );
                    },
                  ),
                );
              } else {
                return Container();
              }
            },
          )
        ],
      ),
      actions: [
        CustomizeButton(
          buttonPadding: EdgeInsets.zero,
          onTapFunction: () {
            controller.navigationService.goBack();
            controller.resetAllFilterValues();
          },
          buttonBackgroundColor: Colors.grey,
          buttonTextColor: Colors.white,
          buttonText: AppStrings.goBackString,
        ),
        ValueListenableBuilder(
          valueListenable: controller.selectedFilterElement,
          builder: (context, selectedFilterElement, _) {
            if (controller.selectedFilterElement.value != null) {
              return CustomizeButton(
                buttonPadding: EdgeInsets.zero,
                onTapFunction: () {
                  controller.filterLocalVehiclesList();
                  controller.resetAllFilterValues();
                  controller.navigationService.goBack();
                },
                buttonBackgroundColor: Colors.green,
                buttonTextColor: Colors.white,
                buttonText: AppStrings.applyFilterString,
              );
            } else {
              return Container();
            }
          },
        )
      ],
    );
  }
}
