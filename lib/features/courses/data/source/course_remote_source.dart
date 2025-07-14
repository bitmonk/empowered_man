import 'package:dartz/dartz.dart';
import 'package:empowered/constants/app_endpoints.dart';
import 'package:empowered/core/dio_provider/api_error.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/features/courses/data/model/chapter_model.dart';
import 'package:empowered/features/courses/data/model/course_model.dart';
import 'package:empowered/features/courses/data/model/module_model.dart';

class CourseRemoteSource {
  const CourseRemoteSource(this._client);
  final DioApiClient _client;

  Future<Either<AppError, CourseModel>> getCourses({
    required String? tag,
    required String? query,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.get(
        AppEndpoints.getCourses,
        queryParameters: {
          'tag': tag ?? 'all',
          if (query != null) 'search': query,
        },
        cancelToken: cancelToken,
      );

      return right(CourseModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, ModuleModel>> getModules({
    required String chapterId,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.get(
        AppEndpoints.getModule(chapterId),
        cancelToken: cancelToken,
      );

      return right(ModuleModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, ChapterModel>> getChapters({
    required String moduleId,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.get(
        AppEndpoints.getChapters(moduleId),
        cancelToken: cancelToken,
      );

      return right(ChapterModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, String>> markChapterCompleted({
    required String moduleId,
    required String chapterId,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.post(
        AppEndpoints.markChapterCompleted(
          moduleId: moduleId,
          chapterId: chapterId,
        ),
        cancelToken: cancelToken,
      );

      return right(response['message']);
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, String>> changeCourseStatus({
    required String moduleId,
    required String chapterId,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.post(
        AppEndpoints.changeCourseStatus,
        body: {
          'module_id': moduleId,
          'chapter_id': chapterId,
          'status': 'in_progress',
        },
        cancelToken: cancelToken,
      );

      return right(response['message']);
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }
}
