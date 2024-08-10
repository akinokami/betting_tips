import 'package:betting_tips/models/match_model.dart';
import 'package:betting_tips/services/api_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_theme.dart';
import '../utils/constants.dart';

class UpcomingController extends GetxController {
  final searchTxtController = TextEditingController();
  final isLoading = false.obs;
  RxList<MatchModel> upcomingList = <MatchModel>[].obs;
  RxList<MatchModel> searchList = <MatchModel>[].obs;

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
      searchList.value = upcomingList;
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: AppTheme.red);
    } finally {
      isLoading.value = false;
    }
  }

  void searchUpcomingList(String searchTxt) {
    isLoading.value = true;
    if (searchTxtController.text.isEmpty) {
      searchList.value = upcomingList;
    } else {
      searchList.value = upcomingList
          .where((element) =>
              (element.homeTeam ?? '')
                  .toLowerCase()
                  .contains(searchTxt.toLowerCase()) ||
              (element.awayTeam ?? '')
                  .toLowerCase()
                  .contains(searchTxt.toLowerCase()))
          .toList();
    }
    isLoading.value = false;
  }

  @override
  void onClose() {
    //
    super.onClose();
  }
}
