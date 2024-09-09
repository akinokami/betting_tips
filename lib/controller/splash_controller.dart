import 'package:betting_tips/views/screens/home_menu.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../services/api_repo.dart';
import '../services/api_utils.dart';
import '../utils/app_theme.dart';
import '../utils/constants.dart';

class SplashController extends GetxController {
  final ApiUtils apiUtils = ApiUtils();
  final isLoading = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();

    // if (box.read('cookies') != null) {
    //   Future.delayed(const Duration(seconds: 2), () {
    //     Get.offAll(() => Home());
    //   });
    // } else {
    //   getGuestUser();
    // }
    getConfig();
  }

  Future<void> getConfig() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getConfig();

      if (result.isApiCall == true) {
        getGuestUser();
      } else {
        apiUtils.setGitCookies(result.cookie ?? '');
        await box.write('userId', result.uId);
        Future.delayed(const Duration(seconds: 2), () {
          Get.offAll(() => Home());
        });
      }
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: AppTheme.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getGuestUser() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getGuestUser();
      await box.write('userId', result.sId);
      // getApiConfig(result.sId ?? '');
      Get.offAll(() => Home());
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: AppTheme.red);
    } finally {
      isLoading.value = false;
    }
  }

  // Future<void> getApiConfig(String? userId) async {
  //   isLoading.value = true;
  //   try {
  //     final result = await ApiRepo().getApiConfig(userId ?? '');

  //     Get.offAll(() => Home());
  //   } catch (e) {
  //     constants.showSnackBar(
  //         title: 'Error', msg: e.toString(), textColor: AppTheme.red);
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  @override
  void onClose() {
    //
    super.onClose();
  }
}
