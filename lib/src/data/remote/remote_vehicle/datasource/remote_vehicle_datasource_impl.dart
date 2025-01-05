import 'package:fipe_app/src/data/remote/remote_vehicle/datasource/remote_vehicle_datasource.dart';
import 'package:fipe_app/src/data/remote/remote_vehicle/models/remote_vehicle_model.dart';
import 'package:fipe_app/src/service/http/http_service.dart';
import 'package:fpdart/fpdart.dart';

class RemoteVehicleDatasourceImpl implements RemoteVehicleDatasource {
  RemoteVehicleDatasourceImpl(this.httpClient);

  final IHttpService httpClient;

  @override
  Future<Either<Exception, RemoteVehicleModel>> getRemoteVehicle({
    required String vehicleType,
    required String vehicleBrandCode,
    required String vehicleStyleCode,
    required String yearCode,
  }) async {
    try {
      final response = await httpClient.get(
        '/$vehicleType/marcas/$vehicleBrandCode/modelos/$vehicleStyleCode/anos/$yearCode',
      );

      if (response.statusCode == 200) {
        final jsonResponse = response.data as Map<String, dynamic>;
        final RemoteVehicleModel remoteVehicle =
            RemoteVehicleModel.fromJson(jsonResponse);

        return Right(remoteVehicle);
      } else {
        return Left(Exception());
      }
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
