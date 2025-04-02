import 'package:dartz/dartz.dart';
import 'package:empowered/constants/app_endpoints.dart';
import 'package:empowered/core/dio_provider/api_error.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/features/signup/data/model/signup_model.dart';
import 'package:empowered/features/signup/data/model/signup_request_model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';

class SignupRemoteSource {
  const SignupRemoteSource(this._client);
  final DioApiClient _client;

  Future<Either<AppError, SignupModel>> signUp({
    required SignupRequestModel signUpRequestModel,
    String? profilePhotoPath,
    CancelToken? cancelToken,
  }) async {
    try {
      resetUnauthorizedFlag();
      final formDataMap = FormData.fromMap({
        ...signUpRequestModel.toMap(),
      });

      if (profilePhotoPath != null) {
        var fileName = profilePhotoPath.split('/').last;
        var mimeType = mime(fileName) ?? '';
        var mimee = mimeType.split('/')[0];
        var type = mimeType.split('/')[1];

        formDataMap.files.add(
          MapEntry(
            'image',
            await MultipartFile.fromFile(
              profilePhotoPath,
              filename: fileName,
              contentType: MediaType(mimee, type),
            ),
          ),
        );
      }
      final response = await _client.post(
        AppEndpoints.signUp,
        body: formDataMap,
        cancelToken: cancelToken,
      );

      return Right(SignupModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }
}
