import 'package:fipe_app/src/core/utils/app_strings.dart';
import 'package:fipe_app/src/data/general/models/vehicle_model.dart';

class LocalVehicleModel extends VehicleModel {
  LocalVehicleModel({
    required super.vehicleType,
    required super.price,
    required super.brand,
    required super.model,
    required super.modelYear,
    required super.fuel,
    required super.fipeCode,
    required super.referenceMonth,
    required super.fuelAcronym,
    this.vehiclePlate,
    this.vehicleColor,
    required this.brandCode,
    required this.vehicleStyleCode,
    required this.yearCode,
  });

  final String? vehiclePlate;
  final String? vehicleColor;
  final String brandCode;
  final String vehicleStyleCode;
  final String yearCode;

  Map<String, dynamic> toJson() {
    return {
      "TipoVeiculo": vehicleType,
      "Valor": price,
      "Marca": brand,
      "Modelo": model,
      "AnoModelo": modelYear,
      "Combustivel": fuel,
      "CodigoFipe": fipeCode,
      "MesReferencia": referenceMonth,
      "SiglaCombustivel": fuelAcronym,
      "PlacaVeiculo": vehiclePlate ?? AppStrings.notInformedString,
      "CorVeiculo": vehicleColor ?? AppStrings.notInformedString,
      "CodigoMarca": brandCode,
      "CodigoModelo": vehicleStyleCode,
      "CodigoAno": yearCode,
    };
  }

  factory LocalVehicleModel.fromJson(Map<String, dynamic> json) {
    return LocalVehicleModel(
      vehicleType: json["TipoVeiculo"] ?? 0000,
      price: json["Valor"] ?? "",
      brand: json["Marca"] ?? "",
      model: json["Modelo"] ?? "",
      modelYear: json["AnoModelo"] ?? 0000,
      fuel: json["Combustivel"] ?? "",
      fipeCode: json["CodigoFipe"] ?? "",
      referenceMonth: json["MesReferencia"] ?? "",
      fuelAcronym: json["SiglaCombustivel"] ?? "",
      vehiclePlate: json["PlacaVeiculo"],
      vehicleColor: json["CorVeiculo"],
      brandCode: json["CodigoMarca"],
      vehicleStyleCode: json["CodigoModelo"],
      yearCode: json["CodigoAno"],
    );
  }
}
