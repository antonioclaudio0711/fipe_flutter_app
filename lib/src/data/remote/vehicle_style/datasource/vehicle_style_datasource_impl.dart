import 'package:fipe_app/src/data/remote/vehicle_style/datasource/vehicle_style_datasource.dart';
import 'package:fipe_app/src/data/remote/vehicle_style/models/vehicle_style_model.dart';
import 'package:fipe_app/src/service/http/http_service.dart';
import 'package:fpdart/fpdart.dart';

class VehicleStyleDatasourceImpl implements VehicleStyleDatasource {
  VehicleStyleDatasourceImpl(this.httpClient);

  final IHttpService httpClient;

  @override
  Future<Either<Exception, List<VehicleStyleModel>>> getVehicleStylesList({
    required String vehicleType,
    required String vehicleBrandCode,
  }) async {
    try {
      final response = await httpClient
          .get('/$vehicleType/marcas/$vehicleBrandCode/modelos');

      if (response.statusCode == 200) {
        final jsonResponse = response.data["modelos"] as List;
        final List<VehicleStyleModel> vehicleStylesList =
            jsonResponse.map((jsonVehicleStyle) {
          return VehicleStyleModel.fromJson(jsonVehicleStyle);
        }).toList();

        return Right(vehicleStylesList);
      } else {
        return Left(Exception());
      }
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
