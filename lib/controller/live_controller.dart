import 'package:betting_tips/models/match_model.dart';
import 'package:betting_tips/services/api_repo.dart';
import 'package:betting_tips/utils/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/app_theme.dart';

class LiveController extends GetxController {
  final isLoading = false.obs;
  RxList<MatchModel> liveList = <MatchModel>[].obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    getLiveList();
  }

  Future<void> getLiveList() async {
    isLoading.value = true;
    try {
      String uId = await box.read('userId');
      final result = await ApiRepo().getLiveList(uId);
      liveList.value = result;
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
