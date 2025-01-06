import 'package:fipe_app/src/core/utils/app_routes.dart';
import 'package:fipe_app/src/core/utils/app_strings.dart';
import 'package:fipe_app/src/core/utils/common_widgets/customize_app_scaffold.dart';
import 'package:fipe_app/src/core/utils/common_widgets/customize_button.dart';
import 'package:fipe_app/src/core/utils/common_widgets/vehicle_fipe_price_dialog.dart';
import 'package:fipe_app/src/core/utils/common_widgets/vehicle_form.dart';
import 'package:fipe_app/src/presentation/single_consultation_screen/controller/single_consultation_controller.dart';
import 'package:flutter/material.dart';

class SingleConsultationView extends StatelessWidget {
  SingleConsultationView({super.key});

  static const routeName = AppRoutes.singleConsultationRoute;

  final SingleConsultationController _controller =
      SingleConsultationController();

  @override
  Widget build(BuildContext context) {
    return CustomizeAppScaffold(
      canPop: false,
      appBarTitle: const Text(
        AppStrings.singleConsultationString,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      scaffoldBody: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              VehicleForm(controller: _controller),
              ValueListenableBuilder(
                valueListenable: _controller.selectedYearCode,
                builder: (context, selectedYearCode, _) {
                  if (selectedYearCode != null && selectedYearCode.isNotEmpty) {
                    return CustomizeButton(
                      buttonPadding: EdgeInsets.zero,
                      onTapFunction: () async {
                        await _controller.getRemoteVehicle(context);

                        final fullInformations =
                            _controller.remoteVehicle.value!;

                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return VehicleFipePriceDialog(
                              dialogTitle: AppStrings.fipeTableValueString,
                              vehicleType: fullInformations.vehicleType,
                              vehicleBrand: fullInformations.brand,
                              vehicleModel: fullInformations.model,
                              vehicleYear: fullInformations.modelYear,
                              vehicleFipeTablePrice: fullInformations.price,
                              actionsButtons: [
                                CustomizeButton(
                                  buttonPadding: EdgeInsets.zero,
                                  onTapFunction: () => _controller
                                      .navigationService
                                      .pushNamedAndRemoveUntil(
                                    AppRoutes.initialAppRoute,
                                  ),
                                  buttonBackgroundColor: Colors.red,
                                  buttonTextColor: Colors.white,
                                  buttonText: AppStrings.goBackString,
                                ),
                                CustomizeButton(
                                  buttonPadding: EdgeInsets.zero,
                                  onTapFunction: () {
                                    _controller.navigationService.goBack();
                                    _controller.resetAllValues();
                                  },
                                  buttonBackgroundColor: Colors.green,
                                  buttonTextColor: Colors.white,
                                  buttonText: AppStrings.newConsultationString,
                                ),
                              ],
                            );
                          },
                        );
                      },
                      buttonBackgroundColor: Colors.green,
                      buttonTextColor: Colors.white,
                      buttonText: AppStrings.fipeTablePriceConsultationString,
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
