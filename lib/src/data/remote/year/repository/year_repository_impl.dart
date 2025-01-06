import 'package:fipe_app/src/data/remote/year/datasource/year_datasource.dart';
import 'package:fipe_app/src/data/remote/year/models/year_model.dart';
import 'package:fipe_app/src/domain/remote/year/repository/year_repository.dart';
import 'package:fpdart/fpdart.dart';

class YearRepositoryImpl implements YearRepository {
  YearRepositoryImpl(this.yearDatasource);

  final YearDatasource yearDatasource;

  @override
  Future<Either<Exception, List<YearModel>>> getYearsList({
    required String vehicleType,
    required String vehicleBrandCode,
    required String vehicleStyleCode,
  }) async {
    return await yearDatasource.getYearsList(
      vehicleType: vehicleType,
      vehicleBrandCode: vehicleBrandCode,
      vehicleStyleCode: vehicleStyleCode,
    );
  }
}
