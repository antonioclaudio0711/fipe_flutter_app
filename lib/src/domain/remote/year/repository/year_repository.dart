import 'package:fipe_app/src/data/remote/year/models/year_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class YearRepository {
  Future<Either<Exception, List<YearModel>>> getYearsList({
    required String vehicleType,
    required String vehicleBrandCode,
    required String vehicleStyleCode,
  });
}
