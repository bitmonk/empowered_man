import 'package:dartz/dartz.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/core/extension/extensions.dart';

class ContactUsRemoteSource {
  const ContactUsRemoteSource(this._client);
  final DioApiClient _client;

  Future<Either<AppError, String>> contactUsDetails({
    required String name,
    required String email,
    required String message,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.post(
        AppRoutes.contactUs,
        body: {
          'name': 'Empowered',
          'email': 'empowered@gmail.com',
          'message': message,
        },
        cancelToken: cancelToken,
      );

      return Right(response['message']);
    } catch (e) {
      if (e is ApiErrorResponse) {
        return Left(e);
      } else {
        return Left(InternalAppError(message: e.toString()));
      }
    }
  }
}
