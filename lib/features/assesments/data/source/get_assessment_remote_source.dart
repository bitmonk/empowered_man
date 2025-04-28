import 'package:dartz/dartz.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/assesments/data/model/get_assessment_model.dart';

class GetAssessmentRemoteSource {
  const GetAssessmentRemoteSource(this._client);

  final DioApiClient _client;

  Future<Either<AppError, GetAssessmentModel>> getAssessment({
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.get(
        AppEndpoints.getAssessmentsUrl,
        cancelToken: cancelToken,
      );

      return right(GetAssessmentModel.fromJson(response));
    } catch (e) {
      if(e is ApiErrorResponse){
        return left(e);
      }else{
        return left(InternalAppError(message: e.toString()));
      }
    }
  }
}
