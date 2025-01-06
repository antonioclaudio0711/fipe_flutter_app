import 'package:fipe_app/src/data/remote/remote_vehicle/models/remote_vehicle_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class RemoteVehicleDatasource {
  Future<Either<Exception, RemoteVehicleModel>> getRemoteVehicle({
    required String vehicleType,
    required String vehicleBrandCode,
    required String vehicleStyleCode,
    required String yearCode,
  });
}
