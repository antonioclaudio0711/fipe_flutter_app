import 'package:fipe_app/src/core/utils/app_routes.dart';
import 'package:fipe_app/src/core/utils/app_strings.dart';
import 'package:fipe_app/src/core/utils/common_widgets/customize_app_scaffold.dart';
import 'package:fipe_app/src/core/utils/common_widgets/customize_button.dart';
import 'package:fipe_app/src/core/utils/common_widgets/vehicle_form.dart';
import 'package:fipe_app/src/presentation/register_new_vehicle_screen/controller/register_new_vehicle_controller.dart';
import 'package:fipe_app/src/presentation/register_new_vehicle_screen/view/widget/custom_alert_dialog.dart';
import 'package:fipe_app/src/presentation/register_new_vehicle_screen/view/widget/custom_labeled_text_field.dart';
import 'package:flutter/material.dart';

class RegisterNewVehicleView extends StatelessWidget {
  RegisterNewVehicleView({super.key});

  static const routeName = AppRoutes.registerNewVehicleRoute;

  final RegisterNewVehicleController _controller =
      RegisterNewVehicleController();

  @override
  Widget build(BuildContext context) {
    return CustomizeAppScaffold(
      canPop: false,
      appBarTitle: const Text(
        AppStrings.registerNewVehicleString,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      scaffoldBody: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              VehicleForm(controller: _controller),
              ValueListenableBuilder(
                valueListenable: _controller.yearsList,
                builder: (context, yearsList, _) {
                  if (yearsList.isNotEmpty) {
                    return Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        CustomLabeledTextField(
                          informativeText: AppStrings.vehiclePlateString,
                          hintText: AppStrings.vehiclePlateExampleString,
                          textController: _controller.vehiclePlateController,
                        ),
                        CustomLabeledTextField(
                          informativeText: AppStrings.vehicleColorString,
                          hintText: AppStrings.vehicleColorExampleString,
                          textController: _controller.vehicleColorController,
                        ),
                        const Text(
                          AppStrings.fipeTableConsultString,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 9,
                          ),
                        ),
                        _controller.selectedYearCode.value != null
                            ? CustomizeButton(
                                buttonPadding: const EdgeInsets.only(top: 30),
                                onTapFunction: () async {
                                  await _controller
                                      .getFullInformationsFromVehicle(context);

                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      return CustomAlertDialog(
                                        controller: _controller,
                                      );
                                    },
                                  );
                                },
                                buttonBackgroundColor: Colors.green,
                                buttonTextColor: Colors.white,
                                buttonText: AppStrings.registerButtonString,
                              )
                            : Container(),
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
