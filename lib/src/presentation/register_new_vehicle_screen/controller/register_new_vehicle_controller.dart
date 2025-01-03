import 'package:fipe_app/src/data/remote/brand/models/brand_model.dart';
import 'package:fipe_app/src/data/remote/vehicle_style/models/vehicle_style_model.dart';
import 'package:fipe_app/src/domain/brand/repository/brand_repository.dart';
import 'package:fipe_app/src/domain/vehicle_style/repository/vehicle_style_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class RegisterNewVehicleController extends ChangeNotifier {
  RegisterNewVehicleController();

  final List<String> vehicleTypes = ['Carro', 'Moto', 'Caminhão'];

  final BrandRepository _brandRepository = GetIt.I<BrandRepository>();
  final VehicleStyleRepository _vehicleStyleRepository =
      GetIt.I<VehicleStyleRepository>();

  ValueNotifier<String> selectedVehicleTypeButton = ValueNotifier('');
  ValueNotifier<String> selectedVehicleType = ValueNotifier('');

  ValueNotifier<List<BrandModel>> brandsList = ValueNotifier([]);
  ValueNotifier<String?> selectedBrandCode = ValueNotifier(null);

  ValueNotifier<List<VehicleStyleModel>> vehicleStylesList = ValueNotifier([]);
  ValueNotifier<String?> selectedVehicleStyleCode = ValueNotifier(null);

  Future<void> selectVehicleType({required String vehicleType}) async {
    selectedBrandCode.value = null;
    selectedVehicleStyleCode.value = null;
    vehicleStylesList.value = [];
    selectedVehicleTypeButton.value = vehicleType;

    switch (vehicleType) {
      case 'Carro':
        selectedVehicleType.value = 'carros';
      case 'Moto':
        selectedVehicleType.value = 'motos';
      case 'Caminhão':
        selectedVehicleType.value = 'caminhoes';
    }

    final response = await _brandRepository.getBrandsList(
      vehicleType: selectedVehicleType.value,
    );
    response.fold(
      (error) {},
      (success) {
        brandsList.value = success;
      },
    );
  }

  Future<void> selectBrand({required String brandCode}) async {
    selectedVehicleStyleCode.value = null;
    selectedBrandCode.value = brandCode;

    final response = await _vehicleStyleRepository.getVehicleStylesList(
      vehicleType: selectedVehicleType.value,
      vehicleBrandCode: selectedBrandCode.value!,
    );
    response.fold(
      (error) {},
      (success) {
        vehicleStylesList.value = success;
      },
    );
  }

  void selectVehicleStyle({required String vehicleStyleCode}) {
    selectedVehicleStyleCode.value = vehicleStyleCode;
  }
}
