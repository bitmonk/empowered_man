import 'package:dio/dio.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/assesments/data/model/get_assessment_model.dart';
import 'package:empowered/features/assesments/data/model/score_question_model.dart';
import 'package:empowered/features/assesments/data/model/user_assessment_model.dart';
import 'package:empowered/features/assesments/data/source/user_assessment_remote_source.dart';

class UserAssessmentController extends GetxController {
  UserAssessmentController({required this.remoteSource});
  final UserAssessmentRemoteSource remoteSource;

  Rx<TheStates> userAssessmentState = TheStates.initial.obs;
  Rx<TheStates> scoreQuestionState = TheStates.initial.obs;

  Rx<UserAssessmentModel> userAssessmentModel = const UserAssessmentModel().obs;
  Rx<ScoreQuestionModel> scoreQuestionModel = const ScoreQuestionModel().obs;

  Rx<String?> userAssessmentError = Rx<String?>(null);

  CancelToken? _cancelToken;
  Rx<TheStates> getAssessmentState = TheStates.initial.obs;
  Rx<GetAssessmentModel> getAssessmentModel = const GetAssessmentModel().obs;
  Rx<String?> getAssessmentError = Rx<String?>(null);

  Future<void> getAssessment() async {
    getAssessmentState.value = TheStates.loading;
    _cancelToken = CancelToken();
    final result = await remoteSource.getAssessment(
      cancelToken: _cancelToken,
    );

    result.fold(
      (l) {
        getAssessmentState.value = TheStates.error;
        getAssessmentError.value = l.message;
        AppUtils.showErrorSnackbar(message: l.message);
      },
      (r) async {
        getAssessmentModel.value = r;
        getAssessmentState.value = TheStates.success;
      },
    );
  }

  Future<void> startAssessment(String id) async {
    userAssessmentState.value = TheStates.loading;
    _cancelToken = CancelToken();
    final result = await remoteSource.startAssessment(
      cancelToken: _cancelToken,
      id: id,
    );

    result.fold(
      (l) {
        userAssessmentState.value = TheStates.error;
        userAssessmentError.value = l.message;
        AppUtils.showErrorSnackbar(message: l.message);
      },
      (r) async {
        userAssessmentModel.value = r;
        userAssessmentState.value = TheStates.success;
      },
    );
  }

  Future<void> scoreQuestion(
    String userAssessmentScoreId,
    String assessmentQuestionId,
    String score,
  ) async {
    userAssessmentState.value = TheStates.loading;
    _cancelToken = CancelToken();
    final result = await remoteSource.scoreQuestion(
      cancelToken: _cancelToken,
      userAssessmentScoreId: userAssessmentScoreId,
      assessmentQuestionId: assessmentQuestionId,
      score: score,
    );

    result.fold(
      (l) {
        scoreQuestionState.value = TheStates.error;
        userAssessmentError.value = l.message;
        AppUtils.showErrorSnackbar(message: l.message);
      },
      (r) async {
        scoreQuestionModel.value = r;

        scoreQuestionState.value = TheStates.success;
      },
    );
  }
}
