import 'package:betting_tips/views/screens/home_menu.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../services/api_repo.dart';
import '../utils/app_theme.dart';
import '../utils/constants.dart';

class SplashController extends GetxController {
  final isLoading = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();

    if (box.read('cookies') != null) {
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAll(() => Home());
      });
    } else {
      getGuestUser();
    }
  }

  Future<void> getGuestUser() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getGuestUser();
      await box.write('userId', result.sId);
      Get.offAll(() => Home());
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
