import 'package:betting_tips/models/other_group.dart';
import 'package:betting_tips/models/other_model.dart';
import 'package:betting_tips/models/sport_date.dart';
import 'package:betting_tips/services/api_repo.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MmaHistoryController extends GetxController {
  final searchTxtController = TextEditingController();
  final isLoading = false.obs;
  final isLoading1 = false.obs;
  RxList<SportDate> dateList = <SportDate>[].obs;
  RxList<OtherModel> mmaList = <OtherModel>[].obs;
  RxList<OtherGroup> groupList = <OtherGroup>[].obs;
  Rx<SportDate?> selectedDate = Rx<SportDate?>(null);
  RxList<OtherModel> searchList = <OtherModel>[].obs;

  @override
  void onInit() {
    getDateList();
    super.onInit();
  }

  Future<void> getDateList() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getMmaDateList();
      dateList.value = result;
      if (dateList.isNotEmpty) {
        selectedDate.value = dateList[0];
        getHistoryList(selectedDate.value?.macDate ?? '');
      }
    } catch (e) {
      // constants.showSnackBar(
      //     title: 'Error', msg: e.toString(), textColor: AppTheme.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getHistoryList(String date) async {
    isLoading1.value = true;
    try {
      mmaList.clear();
      groupList.clear();
      final result = await ApiRepo().getMmaHistoryList(date);
      mmaList.value = result;
      var groupedItems = groupBy(mmaList, (OtherModel item) => item.macEvent);
      groupedItems.forEach((key, value) {
        groupList.add(OtherGroup(name: key, otherList: value));
      });
    } catch (e) {
      // constants.showSnackBar(
      //     title: 'Error', msg: e.toString(), textColor: AppTheme.red);
    } finally {
      isLoading1.value = false;
    }
  }

  void searchTennisList(String searchTxt) {
    isLoading.value = true;
    if (searchTxt.isEmpty || searchTxt == '') {
      searchList.value = mmaList;
    } else {
      searchList.value = mmaList
          .where((element) =>
              (element.macHome ?? '')
                  .toLowerCase()
                  .contains(searchTxt.toLowerCase()) ||
              (element.macAway ?? '')
                  .toLowerCase()
                  .contains(searchTxt.toLowerCase()))
          .toList();
    }
    isLoading.value = false;
  }
}
