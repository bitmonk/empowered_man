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
  Rx<ReflectionModel> reflections = const ReflectionModel().obs;
  RxnString? userGoalId = RxnString();


  Future<void> getReflections() async {
    getReflectionState.value = TheStates.loading;
    _cancelToken = CancelToken();

    // Pass the userGoalId to the remote source
    final result =
        await remoteSource.getReflection(reflectionId: userGoalId!.value);

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
