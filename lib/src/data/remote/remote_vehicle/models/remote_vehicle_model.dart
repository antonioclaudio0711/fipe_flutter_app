import 'package:fipe_app/src/data/general/models/vehicle_model.dart';

class RemoteVehicleModel extends VehicleModel {
  RemoteVehicleModel({
    required super.vehicleType,
    required super.price,
    required super.brand,
    required super.model,
    required super.modelYear,
    required super.fuel,
    required super.fipeCode,
    required super.referenceMonth,
    required super.fuelAcronym,
  });

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
    };
  }

  factory RemoteVehicleModel.fromJson(Map<String, dynamic> json) {
    return RemoteVehicleModel(
      vehicleType: json["TipoVeiculo"] ?? 0000,
      price: json["Valor"] ?? "",
      brand: json["Marca"] ?? "",
      model: json["Modelo"] ?? "",
      modelYear: json["AnoModelo"] ?? 0000,
      fuel: json["Combustivel"] ?? "",
      fipeCode: json["CodigoFipe"] ?? "",
      referenceMonth: json["MesReferencia"] ?? "",
      fuelAcronym: json["SiglaCombustivel"] ?? "",
    );
  }
}
