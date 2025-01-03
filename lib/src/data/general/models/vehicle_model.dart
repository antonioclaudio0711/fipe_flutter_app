class VehicleModel {
  VehicleModel({
    required this.vehicleType,
    required this.value,
    required this.brand,
    required this.model,
    required this.modelYear,
    required this.fuel,
    required this.fipeCode,
    required this.referenceMonth,
    required this.fuelAcronym,
  });

  final int? vehicleType;
  final String? value;
  final String? brand;
  final String? model;
  final int? modelYear;
  final String? fuel;
  final String? fipeCode;
  final String? referenceMonth;
  final String? fuelAcronym;

  Map<String, dynamic> toJson() {
    return {
      "TipoVeiculo": vehicleType ?? 0000,
      "Valor": value ?? "",
      "Marca": brand ?? "",
      "Modelo": model ?? "",
      "AnoModelo": modelYear ?? 0000,
      "Combustivel": fuel ?? "",
      "CodigoFipe": fipeCode ?? "",
      "MesReferencia": referenceMonth ?? "",
      "SiglaCombustivel": fuelAcronym ?? "",
    };
  }

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      vehicleType: json["TipoVeiculo"] ?? 0000,
      value: json["Valor"] ?? "",
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
