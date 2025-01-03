import 'package:fipe_app/src/data/remote/vehicle_style/datasource/vehicle_style_datasource.dart';
import 'package:fipe_app/src/data/remote/vehicle_style/models/vehicle_style_model.dart';
import 'package:fipe_app/src/domain/vehicle_style/repository/vehicle_style_repository.dart';
import 'package:fpdart/fpdart.dart';

class VehicleStyleRepositoryImpl implements VehicleStyleRepository {
  VehicleStyleRepositoryImpl(this.vehicleStyleDatasource);

  final VehicleStyleDatasource vehicleStyleDatasource;

  @override
  Future<Either<Exception, List<VehicleStyleModel>>> getVehicleStylesList({
    required String vehicleType,
    required String vehicleBrandCode,
  }) async {
    return await vehicleStyleDatasource.getVehicleStylesList(
      vehicleType: vehicleType,
      vehicleBrandCode: vehicleBrandCode,
    );
  }
}
