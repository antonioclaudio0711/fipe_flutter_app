import 'package:fipe_app/src/data/remote/brand/datasource/brand_datasource.dart';
import 'package:fipe_app/src/data/remote/brand/models/brand_model.dart';
import 'package:fipe_app/src/service/http/http_service.dart';
import 'package:fpdart/fpdart.dart';

class BrandDatasourceImpl implements BrandDatasource {
  BrandDatasourceImpl(this.httpClient);

  final IHttpService httpClient;

  @override
  Future<Either<Exception, List<BrandModel>>> getBrandsList({
    required String vehicleType,
  }) async {
    try {
      final response = await httpClient.get('/$vehicleType/marcas');

      if (response.statusCode == 200) {
        final jsonResponse = response.data as List;
        final List<BrandModel> brandsList = jsonResponse.map((jsonBrand) {
          return BrandModel.fromJson(jsonBrand);
        }).toList();

        return Right(brandsList);
      } else {
        return Left(Exception());
      }
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
