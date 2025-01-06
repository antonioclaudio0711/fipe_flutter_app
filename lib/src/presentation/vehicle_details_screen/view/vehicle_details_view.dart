import 'package:fipe_app/src/core/utils/app_routes.dart';
import 'package:fipe_app/src/core/utils/app_strings.dart';
import 'package:fipe_app/src/core/utils/common_widgets/customize_app_scaffold.dart';
import 'package:fipe_app/src/core/utils/common_widgets/customize_button.dart';
import 'package:fipe_app/src/core/utils/common_widgets/customize_informative_container.dart';
import 'package:fipe_app/src/core/utils/common_widgets/vehicle_fipe_price_dialog.dart';
import 'package:fipe_app/src/core/utils/internet_validator.dart';
import 'package:fipe_app/src/core/utils/utils.dart';
import 'package:fipe_app/src/data/local/local_vehicle/models/local_vehicle_model.dart';
import 'package:fipe_app/src/presentation/vehicle_details_screen/controller/vehicle_details_controller.dart';
import 'package:fipe_app/src/presentation/vehicle_details_screen/view/widgets/vehicle_informations.dart';
import 'package:flutter/material.dart';

class VehicleDetailsView extends StatefulWidget {
  VehicleDetailsView({
    super.key,
    required this.localVehicle,
  });

  static const routeName = AppRoutes.vehicleDetailsRoute;
  final VehicleDetailsController _controller = VehicleDetailsController();
  final InternetValidator _internetValidator = InternetValidator();

  final LocalVehicleModel localVehicle;

  @override
  State<VehicleDetailsView> createState() => _VehicleDetailsViewState();
}

class _VehicleDetailsViewState extends State<VehicleDetailsView> {
  VehicleDetailsController get _controller => widget._controller;
  InternetValidator get _internetValidator => widget._internetValidator;
  LocalVehicleModel get localVehicle => widget.localVehicle;

  @override
  void initState() {
    _internetValidator.verifyInternetConnection();
    super.initState();
  }

  @override
  void dispose() {
    _internetValidator.internetConnectionStreamSubscription!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomizeAppScaffold(
      canPop: true,
      scaffoldBody: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.black,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    color: Colors.white,
                    cardImageAccordingVehicleType(
                      vehicleType: localVehicle.vehicleType,
                    ),
                  ),
                ),
              ),
              VehicleInformations(localVehicle: localVehicle),
              ValueListenableBuilder(
                valueListenable: _internetValidator.isConnectedToInternet,
                builder: (context, isConnectedToInternet, _) {
                  if (isConnectedToInternet != null) {
                    if (isConnectedToInternet) {
                      return CustomizeButton(
                        buttonPadding: EdgeInsets.zero,
                        onTapFunction: () async {
                          await _controller.getRemoteVehicle(
                            context,
                            vehicleType: localVehicle.vehicleType,
                            vehicleBrandcode: localVehicle.brandCode,
                            vehicleStyleCode: localVehicle.vehicleStyleCode,
                            vehicleYearCode: localVehicle.yearCode,
                          );

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
                      return const CustomizeInformativeContainer(
                        informativeContainerText:
                            AppStrings.priceSearchUnavailableString,
                        informativeContainerBackgroundColor: Colors.red,
                        informativeContainerTextColor: Colors.white,
                      );
                    }
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
