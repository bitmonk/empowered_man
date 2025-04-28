import 'package:dio/dio.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/assesments/data/source/get_assessment_remote_source.dart';

class GetAssessmentController extends GetxController {
  GetAssessmentController({required this.remoteSource});
  final GetAssessmentRemoteSource remoteSource;

  Rx<TheStates> getAssessmentState = TheStates.initial.obs;

  Rx<String?> getAssessmentError = Rx<String?>(null);

  CancelToken? _cancelToken;

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
        getAssessmentState.value = TheStates.success;
      },
    );
  }
}
