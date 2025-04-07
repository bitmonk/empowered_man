import 'package:dartz/dartz.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/app_directory/data/model/privacy_policy_model.dart';

class AppDirectoryRemoteSource {
  const AppDirectoryRemoteSource(this._client);
  final DioApiClient _client;

  Future<Either<AppError, PrivacyPolicyModel>> getPrivacyPolicyDetails() async {
    try {
      final response = await _client.get(
        AppRoutes.privacyPolicy,
      );

      final privacyPolicyList = PrivacyPolicyModel.fromJson(response);

      return Right(privacyPolicyList);
    } catch (e) {
      if (e is ApiErrorResponse) {
        return Left(e);
      } else {
        return Left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, PrivacyPolicyModel>>
      getTermConditionsDetails() async {
    try {
      final response = await _client.get(
        AppRoutes.termsAndConditions,
      );

      final termsList = PrivacyPolicyModel.fromJson(response);

      return Right(termsList);
    } catch (e) {
      if (e is ApiErrorResponse) {
        return Left(e);
      } else {
        return Left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, PrivacyPolicyModel>> getGuidelinesDetails() async {
    try {
      final response = await _client.get(
        AppRoutes.communityGuidelines,
      );

      final guidelineList = PrivacyPolicyModel.fromJson(response);

      return Right(guidelineList);
    } catch (e) {
      if (e is ApiErrorResponse) {
        return Left(e);
      } else {
        return Left(InternalAppError(message: e.toString()));
      }
    }
  }
}
