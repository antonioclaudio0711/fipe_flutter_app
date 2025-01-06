import 'package:fipe_app/src/core/utils/app_routes.dart';
import 'package:fipe_app/src/core/utils/utils.dart';
import 'package:fipe_app/src/data/remote/remote_vehicle/models/remote_vehicle_model.dart';
import 'package:fipe_app/src/domain/remote/remote_vehicle/repository/remote_vehicle_repository.dart';
import 'package:fipe_app/src/service/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class VehicleDetailsController extends ChangeNotifier {
  VehicleDetailsController();

  final NavigationService navigationService = GetIt.I<NavigationService>();
  final RemoteVehicleRepository _remoteVehicleRepository =
      GetIt.I<RemoteVehicleRepository>();

  final ValueNotifier<RemoteVehicleModel?> remoteVehicle = ValueNotifier(null);

  Future<void> getRemoteVehicle(
    BuildContext context, {
    required int vehicleType,
    required String vehicleBrandcode,
    required String vehicleStyleCode,
    required String vehicleYearCode,
  }) async {
    final convertedVehicleType = convertVehicleTypeString(
      vehicleType: convertRemoteVehicleType(vehicleType: vehicleType),
    );

    final response = await _remoteVehicleRepository.getRemoteVehicle(
      vehicleType: convertedVehicleType,
      vehicleBrandCode: vehicleBrandcode,
      vehicleStyleCode: vehicleStyleCode,
      yearCode: vehicleYearCode,
    );
    response.fold(
      (error) {
        showErrorDialog(
          context: context,
          error: error.toString(),
          goBackFunction: () => navigationService.pushNamedAndRemoveUntil(
            AppRoutes.initialAppRoute,
          ),
        );
      },
      (success) {
        remoteVehicle.value = success;
      },
    );
  }
}
