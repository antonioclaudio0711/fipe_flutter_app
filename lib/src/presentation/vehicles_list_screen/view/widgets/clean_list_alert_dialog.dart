import 'package:fipe_app/src/core/utils/app_strings.dart';
import 'package:fipe_app/src/core/utils/common_widgets/customize_button.dart';
import 'package:fipe_app/src/presentation/vehicles_list_screen/controller/vehicles_list_controller.dart';
import 'package:flutter/material.dart';

class CleanListAlertDialog extends StatelessWidget {
  const CleanListAlertDialog({super.key, required this.controller});

  final VehiclesListController controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text(
          AppStrings.cleanRegisteredVehiclesListString,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppStrings.doYouWishToCleanVehiclesListString,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
      actions: [
        CustomizeButton(
          buttonPadding: EdgeInsets.zero,
          onTapFunction: () => controller.navigationService.goBack(),
          buttonBackgroundColor: Colors.grey,
          buttonTextColor: Colors.white,
          buttonText: AppStrings.goBackString,
        ),
        CustomizeButton(
          buttonPadding: EdgeInsets.zero,
          onTapFunction: () {
            controller.cleanRegisteredVehiclesList();
            controller.navigationService.goBack();
          },
          buttonBackgroundColor: Colors.red,
          buttonTextColor: Colors.white,
          buttonText: AppStrings.cleanListString,
        ),
      ],
    );
  }
}
