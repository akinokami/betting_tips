import 'package:betting_tips/models/other_group.dart';
import 'package:betting_tips/models/other_model.dart';
import 'package:betting_tips/models/sport_date.dart';
import 'package:betting_tips/services/api_repo.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';

import '../utils/app_theme.dart';
import '../utils/constants.dart';

class BasketHistoryController extends GetxController {
  final isLoading = false.obs;
  final isLoading1 = false.obs;
  RxList<SportDate> dateList = <SportDate>[].obs;
  RxList<OtherModel> basketList = <OtherModel>[].obs;
  RxList<OtherGroup> groupList = <OtherGroup>[].obs;
  Rx<SportDate?> selectedDate = Rx<SportDate?>(null);

  @override
  void onInit() {
    getDateList();
    super.onInit();
  }

  Future<void> getDateList() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getBasketDateList();
      dateList.value = result;
      if (dateList.isNotEmpty) {
        selectedDate.value = dateList[0];
        getHistoryList(selectedDate.value?.macDate ?? '');
      }
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: AppTheme.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getHistoryList(String date) async {
    isLoading1.value = true;
    try {
      basketList.clear();
      groupList.clear();
      final result = await ApiRepo().getBasketHistoryList(date);
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
      isLoading1.value = false;
    }
  }
}
