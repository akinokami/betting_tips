import 'package:get/state_manager.dart';

import '../models/m_result_model.dart';
import '../services/api_repo.dart';
import '../utils/app_theme.dart';
import '../utils/constants.dart';

class FinishController extends GetxController {
  final isLoading = false.obs;
  RxList<MResultModel> finishList = <MResultModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    getUpcomingList();
  }

  Future<void> getUpcomingList() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getFinishList();
      finishList.value = result;
      print('result>>>$result');
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: AppTheme.red);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    //
    super.onClose();
  }
}
