class VehicleStyleModel {
  VehicleStyleModel({
    required this.code,
    required this.name,
  });

  final int? code;
  final String? name;

  Map<String, dynamic> toJson() {
    return {
      "codigo": code ?? 0000,
      "nome": name ?? "",
    };
  }

  factory VehicleStyleModel.fromJson(Map<String, dynamic> json) {
    return VehicleStyleModel(
      code: json["codigo"] ?? 0000,
      name: json["nome"] ?? "",
    );
  }
}
