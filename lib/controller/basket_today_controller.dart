import 'package:betting_tips/models/other_group.dart';
import 'package:betting_tips/models/other_model.dart';
import 'package:betting_tips/services/api_repo.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';

import '../utils/app_theme.dart';
import '../utils/constants.dart';

class BasketTodayController extends GetxController {
  final isLoading = false.obs;
  RxList<OtherModel> basketList = <OtherModel>[].obs;
  RxList<OtherGroup> groupList = <OtherGroup>[].obs;

  @override
  void onInit() {
    getTodayList();
    super.onInit();
  }

  Future<void> getTodayList() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getBasketTodayList();
      basketList.value = result;
      var groupedItems =
          groupBy(basketList, (OtherModel item) => item.macEvent);
      groupedItems.forEach((key, value) {
        groupList.add(OtherGroup(name: key, otherList: value));
      });
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: AppTheme.red);
    } finally {
      isLoading.value = false;
    }
  }
}
