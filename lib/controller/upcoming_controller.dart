import 'package:betting_tips/models/match_model.dart';
import 'package:betting_tips/services/api_repo.dart';
import 'package:get/get.dart';

import '../utils/app_theme.dart';
import '../utils/constants.dart';

class UpcomingController extends GetxController {
  final isLoading = false.obs;
  RxList<MatchModel> upcomingList = <MatchModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    getUpcomingList();
  }

  Future<void> getUpcomingList() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getUpcomingList();
      upcomingList.value = result;
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
