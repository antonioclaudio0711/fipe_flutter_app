import 'package:fipe_app/src/data/remote/vehicle_style/models/vehicle_style_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class VehicleStyleDatasource {
  Future<Either<Exception, List<VehicleStyleModel>>> getVehicleStylesList({
    required String vehicleType,
    required String vehicleBrandCode,
  });
}
