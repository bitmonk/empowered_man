import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:empowered/constants/app_endpoints.dart';
import 'package:empowered/core/dio_provider/api_error.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/features/tribe/data/model/create_group_response_model.dart';
import 'package:empowered/features/tribe/data/model/feed_saved_posts_model.dart';
import 'package:empowered/features/tribe/data/model/group_about_model.dart';
import 'package:empowered/features/tribe/data/model/group_media_model.dart';
import 'package:empowered/features/tribe/data/model/group_post_model.dart';
import 'package:empowered/features/tribe/data/model/group_list_model.dart';
import 'package:empowered/features/tribe/data/model/saved_posts_model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';

class TribeGroupRemoteSource {
  const TribeGroupRemoteSource(this._client);

  final DioApiClient _client;

  Future<Either<AppError, GroupListModel>> getGroups({
    CancelToken? cancelToken,
    String? search,
    String? showPost,
  }) async {
    try {
      final response = await _client.get(AppEndpoints.createGroup);
      return right(GroupListModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, CreateGroupResponseModel>> createGroup({
    required String groupName,
    required String about,
    required String accessType,
    String? imagePath,
    CancelToken? cancelToken,
    List<String>? membersId,
  }) async {
    final formDataMap = FormData.fromMap({
      'name': groupName,
      'about': about,
      'access_type': accessType,
      'members[]': membersId ?? [],
    });
    if (imagePath != null) {
      final file = File(imagePath);
      if (!await file.exists()) {
        return left(
            const InternalAppError(message: 'Image file does not exist'));
      }
      final fileName = imagePath.split('/').last;
      final mimeType =
          mime(fileName) ?? 'image/jpeg'; // Default to JPEG if unknown
      final typeParts = mimeType.split('/');

      if (!mimeType.startsWith('image/')) {
        return left(
            const InternalAppError(message: 'Selected file is not an image'));
      }

      formDataMap.files.add(
        MapEntry(
          'image',
          await MultipartFile.fromFile(
            imagePath,
            filename: fileName,
            contentType: MediaType(typeParts[0], typeParts[1]),
          ),
        ),
      );
    }
    try {
      final response = await _client.post(
        AppEndpoints.createGroup,
        body: formDataMap,
        cancelToken: cancelToken,
      );
      return right(CreateGroupResponseModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, CreateGroupResponseModel>> pinUnpinGroup({
    required String groupId,
  }) async {
    try {
      final response =
          await _client.post('${AppEndpoints.pinUnpinGroup}?id=$groupId');
      return right(CreateGroupResponseModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, String>> addMembers({
    required String groupId,
    List<String>? membersId,
    CancelToken? cancelToken,
  }) async {
    final formDataMap = FormData.fromMap({
      'group_id': groupId,
      'members': membersId,
    });

    try {
      final response = await _client.post(
        AppEndpoints.addMembers,
        body: formDataMap,
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

  Future<Either<AppError, String>> removeMembers({
    required String groupId,
    String? membersId,
    CancelToken? cancelToken,
  }) async {
    final formDataMap = FormData.fromMap({
      'group_id': groupId,
      'member_id': membersId,
    });
    try {
      final response = await _client.post(
        AppEndpoints.removeMembers,
        body: formDataMap,
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

  Future<Either<AppError, CreateGroupResponseModel>> editGroup({
    String? groupId,
    String? groupName,
    String? about,
    String? accessType,
    String? imagePath,
    CancelToken? cancelToken,
    List<String>? membersId,
  }) async {
    final formDataMap = FormData.fromMap({
      'name': groupName,
      'about': about,
      'access_type': accessType,
      'members[]': membersId,
    });
    if (imagePath != null) {
      var fileName = imagePath.split('/').last;
      var mimeType = mime(fileName) ?? 'application/octet-stream';
      var typeParts = mimeType.split('/');

      formDataMap.files.add(
        MapEntry(
          'image',
          await MultipartFile.fromFile(
            imagePath,
            filename: fileName,
            contentType: MediaType(typeParts[0], typeParts[1]),
          ),
        ),
      );
    }
    try {
      final response = await _client.post(
        '${AppEndpoints.editGroups}/$groupId',
        body: formDataMap,
        cancelToken: cancelToken,
      );
      return right(CreateGroupResponseModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, GroupPostModel>> getGroupPostById({
    required String groupId,
    CancelToken? cancelToken,
  }) async {
    try {
      final response =
          await _client.get('${AppEndpoints.getGroupPosts}$groupId');
      return right(GroupPostModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, GroupMediaModel>> getGroupMedia({
    required String groupId,
    CancelToken? cancelToken,
  }) async {
    try {
      final response =
          await _client.get('${AppEndpoints.getGroupMedia}$groupId');
      return right(GroupMediaModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, GroupAboutModel>> getGroupDetailsById({
    required String groupId,
    CancelToken? cancelToken,
  }) async {
    try {
      final response =
          await _client.get('${AppEndpoints.getGroupDetailsById}$groupId');
      return right(GroupAboutModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, SavedPostsModel>> getSavedPosts({
    required String groupId,
    CancelToken? cancelToken,
  }) async {
    try {
      final response =
          await _client.get('${AppEndpoints.getSavedPosts}$groupId');
      return right(SavedPostsModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, FeedSavedPostsModel>> getFeedSavedPosts({
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.get(AppEndpoints.getFeedSavedPost);
      return right(FeedSavedPostsModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }
}
