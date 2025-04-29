import 'package:dio/dio.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/assesments/data/model/get_assessment_model.dart';
import 'package:empowered/features/assesments/data/source/get_assessment_remote_source.dart';
import 'package:empowered/features/assesments/presentation/controllers/user_assessment_bindings.dart';

class GetAssessmentController extends GetxController {
  GetAssessmentController({required this.remoteSource});
  final GetAssessmentRemoteSource remoteSource;

  Rx<TheStates> getAssessmentState = TheStates.initial.obs;
  Rx<GetAssessmentModel> getAssessmentModel = const GetAssessmentModel().obs;
  Rx<String?> getAssessmentError = Rx<String?>(null);

  CancelToken? _cancelToken;

  @override
  void onInit() {
    super.onInit();
    getAssessment();
    UserAssessmentInitializer.destroy();
    UserAssessmentInitializer.initialize();
  }

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
}
