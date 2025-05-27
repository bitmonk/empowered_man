import 'package:dartz/dartz.dart';
import 'package:empowered/constants/app_endpoints.dart';
import 'package:empowered/core/dio_provider/api_error.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/features/home/data/model/my_monthly_model.dart';

class HomeRemoteSource {
  const HomeRemoteSource(this._client);
  final DioApiClient _client;

  Future<Either<AppError, MyMonthlyModel>> getMyMonthy() async {
    try {
      var res = await _client.get(
        AppEndpoints.myMonthly,
      );

      return right(
        MyMonthlyModel.fromJson(res),
      );
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }
}
