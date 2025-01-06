import 'package:fipe_app/src/data/remote/year/datasource/year_datasource.dart';
import 'package:fipe_app/src/data/remote/year/models/year_model.dart';
import 'package:fipe_app/src/service/http/http_service.dart';
import 'package:fpdart/fpdart.dart';

class YearDatasourceImpl implements YearDatasource {
  YearDatasourceImpl(this.httpClient);

  final IHttpService httpClient;

  @override
  Future<Either<Exception, List<YearModel>>> getYearsList({
    required String vehicleType,
    required String vehicleBrandCode,
    required String vehicleStyleCode,
  }) async {
    try {
      final response = await httpClient.get(
          '/$vehicleType/marcas/$vehicleBrandCode/modelos/$vehicleStyleCode/anos');

      if (response.statusCode == 200) {
        final jsonResponse = response.data as List;
        final List<YearModel> yearsList = jsonResponse.map((yearJson) {
          return YearModel.fromJson(yearJson);
        }).toList();

        return Right(yearsList);
      } else {
        return Left(Exception());
      }
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
