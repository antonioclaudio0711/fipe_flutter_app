import 'package:fipe_app/src/data/remote/remote_vehicle/datasource/remote_vehicle_datasource.dart';
import 'package:fipe_app/src/data/remote/remote_vehicle/models/remote_vehicle_model.dart';
import 'package:fipe_app/src/domain/remote/remote_vehicle/repository/remote_vehicle_repository.dart';
import 'package:fpdart/fpdart.dart';

class RemoteVehicleRepositoryImpl implements RemoteVehicleRepository {
  RemoteVehicleRepositoryImpl(this.remoteVehicleDatasource);

  final RemoteVehicleDatasource remoteVehicleDatasource;

  @override
  Future<Either<Exception, RemoteVehicleModel>> getRemoteVehicle({
    required String vehicleType,
    required String vehicleBrandCode,
    required String vehicleStyleCode,
    required String yearCode,
  }) async {
    return await remoteVehicleDatasource.getRemoteVehicle(
      vehicleType: vehicleType,
      vehicleBrandCode: vehicleBrandCode,
      vehicleStyleCode: vehicleStyleCode,
      yearCode: yearCode,
    );
  }
}
