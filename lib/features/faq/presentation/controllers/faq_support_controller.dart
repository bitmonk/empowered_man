import 'package:empowered/enum/the_states.dart';
import 'package:empowered/features/faq/data/model/faq_model.dart';
import 'package:empowered/features/faq/data/source/faq_support_remote_source.dart';
import 'package:empowered/utlis/app_utils.dart';
import 'package:get/get.dart';

class FaqController extends GetxController {
  FaqController({required this.remoteSource});
  final FaqSupportRemoteSource remoteSource;
  RxList<FaqData> faqs = <FaqData>[].obs;
  RxInt expandedIndex = 0.obs;
  Rx<TheStates> faqState = TheStates.initial.obs;

  @override
  void onInit() {
    super.onInit();
    expandedIndex.value = -1;
    getFaq();
  }

  Future<void> getFaq() async {
    faqState.value = TheStates.loading;
    final result = await remoteSource.getFaqDetails();
    result.fold(
      (l) {
        faqState.value = TheStates.error;
        AppUtils.showErrorSnackbar(
          message: l.message,
        );
      },
      (r) {
        faqs.assignAll(r.data ?? []);
        faqState.value = TheStates.success;
      },
    );
  }
}
