import 'package:dartz/dartz.dart';
import 'package:empowered/constants/app_endpoints.dart';
import 'package:empowered/core/dio_provider/api_error.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/features/tribe/data/model/create_post_response_model.dart';
import 'package:empowered/features/tribe/data/model/feed_media_model.dart';
import 'package:empowered/features/tribe/data/model/feed_posts_model.dart';
import 'package:empowered/features/tribe/data/model/feed_saved_posts_model.dart';
import 'package:empowered/features/tribe/data/model/post_comments_model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';
import 'dart:io';

class FeedPageRemoteSource {
  const FeedPageRemoteSource(this._client);

  final DioApiClient _client;

  Future<Either<AppError, FeedPostsModel>> getFeedPosts() async {
    try {
      final response = await _client.get(
        AppEndpoints.getFeedPosts,
      );
      return right(FeedPostsModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, FeedSavedPostsModel>> getSavedPost() async {
    try {
      final response = await _client.get(
        AppEndpoints.getFeedSavedPost,
      );
      return right(FeedSavedPostsModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, FeedMediaModel>> getFeedMedia() async {
    try {
      final response = await _client.get(AppEndpoints.getFeedMedia);
      return right(FeedMediaModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, CreatePostResponseModel>> createPost({
    required String groupId,
    String? text,
    List<Map<String, String>>? media, // Updated to accept path and type
  }) async {
    try {
      final formDataMap = FormData.fromMap({
        'group_id': groupId,
      });
      if (text != null && text.isNotEmpty) {
        formDataMap.files.add(
          MapEntry(
            'text',
            MultipartFile.fromString(
              text,
              contentType: MediaType('text', 'plain'),
            ),
          ),
        );
      }
      if (media != null && media.isNotEmpty) {
        for (final item in media) {
          final filePath = item['path']!;
          final fileType = item['type']!;
          final fileName = filePath.split('/').last;
          final mimeType = mime(fileName) ?? 'application/octet-stream';
          final typeParts = mimeType.split('/');
          formDataMap.files.add(
            MapEntry(
              'media[]',
              await MultipartFile.fromFile(
                filePath,
                filename: fileName,
                contentType: MediaType(typeParts[0], typeParts[1]),
              ),
            ),
          );
          formDataMap.fields.add(MapEntry('media_types[]', fileType));
        }
      }
      final response = await _client.post(
        AppEndpoints.createPost,
        body: formDataMap,
      );
      return right(CreatePostResponseModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, String>> likePost({
    required String postId,
  }) async {
    try {
      final response = await _client.post(
        '${AppEndpoints.likePost}?id=$postId',
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

  Future<Either<AppError, String>> commentPost({
    required String postId,
    required String comment,
  }) async {
    try {
      final formDataMap = FormData.fromMap({
        'id': postId,
        'text': comment,
      });
      final response = await _client.post(
        AppEndpoints.commentPost,
        body: formDataMap,
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

  Future<Either<AppError, PostCommentsModel>> getComments({
    required String postId,
  }) async {
    try {
      final response = await _client.get(
        AppEndpoints.getPostComments,
        queryParameters: {
          'post_id': postId,
        },
      );
      return right(PostCommentsModel.fromJson(response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }

  Future<Either<AppError, String>> savePost({
    required String postId,
  }) async {
    try {
      final response = await _client.post(
        '${AppEndpoints.savePost}?id=$postId',
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

  Future<Either<AppError, String>> hidePost({
    required String postId,
  }) async {
    try {
      final response = await _client.post(
        '${AppEndpoints.hidePost}?id=$postId',
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

  Future<Either<AppError, String>> likeComment({
    required String postId,
  }) async {
    try {
      final response = await _client.post(
        '${AppEndpoints.likeComment}?comment_id=$postId',
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

  Future<Either<AppError, String>> replyComment({
    required String postId,
    required String comment,
  }) async {
    try {
      final formDataMap = FormData.fromMap({
        'comment_id': postId,
        'text': comment,
      });
      final response = await _client.post(
        AppEndpoints.replyComment,
        body: formDataMap,
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
