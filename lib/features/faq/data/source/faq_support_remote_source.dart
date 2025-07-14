import 'package:dartz/dartz.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/faq/data/model/faq_model.dart';

class FaqSupportRemoteSource {
  const FaqSupportRemoteSource(this._client);
  final DioApiClient _client;

  Future<Either<AppError, FaqModel>> getFaqDetails() async {
    try {
      final response = await _client.get(AppRoutes.faqs);

      final faqList = FaqModel.fromJson(response);

      return Right(faqList);
    } catch (e) {
      if (e is ApiErrorResponse) {
        return Left(e);
      } else {
        return Left(InternalAppError(message: e.toString()));
      }
    }
  }
}
