import 'package:empowered/core/dio_provider/dio_api_client.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/goals/data/model/reflection_model.dart';
import 'package:empowered/features/goals/data/source/reflection_remote_source.dart';

class ReflectionController extends GetxController {
  ReflectionController({required this.remoteSource});

  final ReflectionRemoteSource remoteSource;

  Rx<TheStates> getReflectionState = TheStates.initial.obs;
  CancelToken? _cancelToken;
  Rx<String?> getReflectionError = Rx<String?>(null);
  Rx<ReflectionModel> reflections = ReflectionModel().obs;
  RxnString? userGoalId = RxnString(null);

  @override
  void onInit() {
    super.onInit();
    getReflections(userGoalId: userGoalId?.value);
  }

  Future<void> getReflections({required String? userGoalId}) async {
    if (userGoalId == null) {
      getReflectionState.value = TheStates.error;
      getReflectionError.value = 'User Goal ID is required';
      AppUtils.showErrorSnackbar(message: 'User Goal ID is required');
      return;
    }

    getReflectionState.value = TheStates.loading;
    _cancelToken = CancelToken();

    // Pass the userGoalId to the remote source
    final result = await remoteSource.getReflection(reflectionId: userGoalId);

    return result.fold(
      (l) {
        getReflectionState.value = TheStates.error;
        getReflectionError.value = l.message;
        AppUtils.showErrorSnackbar(message: l.message);
      },
      (r) {
        reflections.value = r;
        getReflectionState.value = TheStates.success;
      },
    );
  }

  void cancelRequest() {
    _cancelToken?.cancel();
    getReflectionState.value = TheStates.initial;
  }
 
}
