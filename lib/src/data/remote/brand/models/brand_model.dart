import 'package:fipe_app/src/data/general/models/general_model.dart';

class BrandModel extends GeneralModel {
  BrandModel({
    required super.code,
    required super.name,
  });

  Map<String, dynamic> toJson() {
    return {
      "codigo": code,
      "nome": name,
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      code: json["codigo"] ?? "",
      name: json["nome"] ?? "",
    );
  }
}
