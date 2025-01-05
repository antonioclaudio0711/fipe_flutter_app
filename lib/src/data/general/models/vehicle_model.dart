abstract class VehicleModel {
  VehicleModel({
    required this.vehicleType,
    required this.price,
    required this.brand,
    required this.model,
    required this.modelYear,
    required this.fuel,
    required this.fipeCode,
    required this.referenceMonth,
    required this.fuelAcronym,
  });

  final int vehicleType;
  final String price;
  final String brand;
  final String model;
  final int modelYear;
  final String fuel;
  final String fipeCode;
  final String referenceMonth;
  final String fuelAcronym;
}
