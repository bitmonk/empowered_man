import 'package:dartz/dartz.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tasks/data/model/add_task_request_model.dart';
import 'package:empowered/features/tasks/data/model/task_enums_model.dart';
import 'package:empowered/features/tasks/data/model/task_model.dart';

class TasksRemoteSource {
  const TasksRemoteSource(this._client);
  final DioApiClient _client;

  Future<Either<AppError, TaskEnumsModel>> getTaskEnums({
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.get(
        AppEndpoints.getTaskEnums,
        cancelToken: cancelToken,
      );
      return right(TaskEnumsModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, TaskModel>> getTask({
    String? day,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.get(
        AppEndpoints.getTask,
        queryParameters: {if (day != null) 'week': day},
        cancelToken: cancelToken,
      );
      return right(TaskModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, String>> addTask({
    required AddTaskRequestModel body,
    String? id,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.post(
        id != null ? AppEndpoints.updateTask(id) : AppEndpoints.addTask,
        body: {...body.toMap(), if (id != null) '_method': 'put'},
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

  Future<Either<AppError, String>> deleteTask({
    required String taskId,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.delete(
        AppEndpoints.delTask(taskId),
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

  Future<Either<AppError, String>> changeTaskLevel({
    required String taskId,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.patch(
        AppEndpoints.changeLevel(taskId),
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

  Future<Either<AppError, String>> markMainTaskCompleted({
    required String taskId,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.patch(
        AppEndpoints.markMainTaskCompleted(taskId),
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

  Future<Either<AppError, String>> markSubTaskCompleted({
    required String taskId,
    required String subTaskId,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.patch(
        AppEndpoints.markSubTaskCompleted(taskId, subTaskId),
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
