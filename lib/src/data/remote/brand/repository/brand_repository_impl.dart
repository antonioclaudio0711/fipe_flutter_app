import 'package:fipe_app/src/data/remote/brand/datasource/brand_datasource.dart';
import 'package:fipe_app/src/data/remote/brand/models/brand_model.dart';
import 'package:fipe_app/src/domain/brand/repository/brand_repository.dart';
import 'package:fpdart/fpdart.dart';

class BrandRepositoryImpl implements BrandRepository {
  BrandRepositoryImpl(this.brandDatasource);

  final BrandDatasource brandDatasource;

  @override
  Future<Either<Exception, List<BrandModel>>> getBrandsList({
    required String vehicleType,
  }) async {
    return await brandDatasource.getBrandsList(
      vehicleType: vehicleType,
    );
  }
}
