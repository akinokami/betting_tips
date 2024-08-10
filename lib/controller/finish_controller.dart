import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../models/m_result_model.dart';
import '../services/api_repo.dart';
import '../utils/app_theme.dart';
import '../utils/constants.dart';

class FinishController extends GetxController {
  final searchTxtController = TextEditingController();
  final isLoading = false.obs;
  RxList<MResultModel> finishList = <MResultModel>[].obs;
  RxList<MResultModel> searchList = <MResultModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getFinishList();
  }

  Future<void> getFinishList() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getFinishList();
      finishList.value = result;
      searchList.value = finishList;
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: AppTheme.red);
    } finally {
      isLoading.value = false;
    }
  }

  void searchFinishList(String searchTxt) {
    isLoading.value = true;
    if (searchTxtController.text.isEmpty) {
      searchList.value = finishList;
    } else {
      searchList.value = finishList
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
