import 'package:fipe_app/src/data/general/models/general_model.dart';

class YearModel extends GeneralModel {
  YearModel({
    required super.code,
    required super.name,
  });

  Map<String, dynamic> toJson() {
    return {
      "codigo": code,
      "nome": name,
    };
  }

  factory YearModel.fromJson(Map<String, dynamic> json) {
    return YearModel(
      code: json["codigo"] ?? "",
      name: json["nome"] ?? "",
    );
  }
}
