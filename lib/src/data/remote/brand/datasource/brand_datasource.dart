import 'package:fipe_app/src/data/remote/brand/models/brand_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class BrandDatasource {
  Future<Either<Exception, List<BrandModel>>> getBrandsList({
    required String vehicleType,
  });
}
