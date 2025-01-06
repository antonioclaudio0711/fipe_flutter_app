import 'dart:convert';

import 'package:fipe_app/src/core/utils/app_routes.dart';
import 'package:fipe_app/src/core/utils/app_strings.dart';
import 'package:fipe_app/src/core/utils/utils.dart';
import 'package:fipe_app/src/data/local/local_vehicle/models/local_vehicle_model.dart';
import 'package:fipe_app/src/data/remote/brand/models/brand_model.dart';
import 'package:fipe_app/src/data/remote/remote_vehicle/models/remote_vehicle_model.dart';
import 'package:fipe_app/src/data/remote/vehicle_style/models/vehicle_style_model.dart';
import 'package:fipe_app/src/data/remote/year/models/year_model.dart';
import 'package:fipe_app/src/domain/remote/brand/repository/brand_repository.dart';
import 'package:fipe_app/src/domain/remote/remote_vehicle/repository/remote_vehicle_repository.dart';
import 'package:fipe_app/src/domain/remote/vehicle_style/repository/vehicle_style_repository.dart';
import 'package:fipe_app/src/domain/remote/year/repository/year_repository.dart';
import 'package:fipe_app/src/service/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterNewVehicleController extends ChangeNotifier {
  RegisterNewVehicleController();

  final NavigationService navigationService = GetIt.I<NavigationService>();
  final BrandRepository _brandRepository = GetIt.I<BrandRepository>();
  final VehicleStyleRepository _vehicleStyleRepository =
      GetIt.I<VehicleStyleRepository>();
  final YearRepository _yearRepository = GetIt.I<YearRepository>();
  final RemoteVehicleRepository _remoteVehicleRepository =
      GetIt.I<RemoteVehicleRepository>();

  ValueNotifier<String?> selectedVehicleTypeButton = ValueNotifier(null);
  ValueNotifier<String?> selectedVehicleType = ValueNotifier(null);

  ValueNotifier<List<BrandModel>> brandsList = ValueNotifier([]);
  ValueNotifier<String?> selectedBrandCode = ValueNotifier(null);

  ValueNotifier<List<VehicleStyleModel>> vehicleStylesList = ValueNotifier([]);
  ValueNotifier<String?> selectedVehicleStyleCode = ValueNotifier(null);

  ValueNotifier<List<YearModel>> yearsList = ValueNotifier([]);
  ValueNotifier<String?> selectedYearCode = ValueNotifier(null);

  final TextEditingController vehiclePlateController = TextEditingController();
  final TextEditingController vehicleColorController = TextEditingController();

  ValueNotifier<RemoteVehicleModel?> remoteVehicle = ValueNotifier(null);

  void resetTextEditingControllers() {
    vehiclePlateController.clear();
    vehicleColorController.clear();
  }

  void selectVehicleType({required String vehicleType}) {
    selectedBrandCode.value = null;
    selectedVehicleStyleCode.value = null;
    selectedYearCode.value = null;

    vehicleStylesList.value = [];
    yearsList.value = [];

    resetTextEditingControllers();

    selectedVehicleTypeButton.value = vehicleType;

    selectedVehicleType.value =
        convertVehicleTypeString(vehicleType: vehicleType);
  }

  void selectBrand({required String brandCode}) {
    selectedVehicleStyleCode.value = null;
    selectedYearCode.value = null;

    yearsList.value = [];

    resetTextEditingControllers();

    selectedBrandCode.value = brandCode;
    brandsList.notifyListeners();
  }

  void selectVehicleStyle({required String vehicleStyleCode}) {
    selectedYearCode.value = null;

    resetTextEditingControllers();

    selectedVehicleStyleCode.value = vehicleStyleCode;
    vehicleStylesList.notifyListeners();
  }

  void selectYearCode({required String yearCode}) {
    resetTextEditingControllers();

    selectedYearCode.value = yearCode;
    yearsList.notifyListeners();
  }

  Future<void> getBrandsList(BuildContext context) async {
    final response = await _brandRepository.getBrandsList(
      vehicleType: selectedVehicleType.value!,
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
        brandsList.value = success;
      },
    );
  }

  Future<void> getVehiclesStyleList(BuildContext context) async {
    final response = await _vehicleStyleRepository.getVehicleStylesList(
      vehicleType: selectedVehicleType.value!,
      vehicleBrandCode: selectedBrandCode.value!,
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
        vehicleStylesList.value = success;
      },
    );
  }

  Future<void> getYearsList(BuildContext context) async {
    final response = await _yearRepository.getYearsList(
      vehicleType: selectedVehicleType.value!,
      vehicleBrandCode: selectedBrandCode.value!,
      vehicleStyleCode: selectedVehicleStyleCode.value!,
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
        yearsList.value = success;
      },
    );
  }

  Future<void> getFullInformationsFromVehicle(BuildContext context) async {
    final response = await _remoteVehicleRepository.getRemoteVehicle(
      vehicleType: selectedVehicleType.value!,
      vehicleBrandCode: selectedBrandCode.value!,
      vehicleStyleCode: selectedVehicleStyleCode.value!,
      yearCode: selectedYearCode.value!,
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

  Future<void> registerVehicle() async {
    final RemoteVehicleModel fullInformations = remoteVehicle.value!;
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final List<String>? localVehiclesList =
        preferences.getStringList('localVehiclesList');

    if (localVehiclesList == null) {
      return;
    } else {
      final newLocalVehicle = LocalVehicleModel(
        vehicleType: fullInformations.vehicleType,
        price: fullInformations.price,
        brand: fullInformations.brand,
        model: fullInformations.model,
        modelYear: fullInformations.modelYear,
        fuel: fullInformations.fuel,
        fipeCode: fullInformations.fipeCode,
        referenceMonth: fullInformations.referenceMonth,
        fuelAcronym: fullInformations.fuelAcronym,
        brandCode: selectedBrandCode.value!,
        vehicleStyleCode: selectedVehicleStyleCode.value!,
        yearCode: selectedYearCode.value!,
        vehiclePlate: vehiclePlateController.text == ""
            ? AppStrings.notInformedString
            : vehiclePlateController.text,
        vehicleColor: vehicleColorController.text == ""
            ? AppStrings.notInformedString
            : vehicleColorController.text,
      );

      final String newLocalVehicleStr = jsonEncode(newLocalVehicle.toJson());
      localVehiclesList.add(newLocalVehicleStr);

      final List<String> newLocalVehicleList = localVehiclesList;

      await preferences.setStringList('localVehiclesList', newLocalVehicleList);

      navigationService.pushNamedAndRemoveUntil(AppRoutes.initialAppRoute);
    }
  }
}
