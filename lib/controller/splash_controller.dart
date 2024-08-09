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
    // Future.delayed(const Duration(seconds: 2), () {
    //   User? user = FirebaseAuth.instance.currentUser;

    //   if (user != null) {
    //     Global.uid = user.uid;
    //     Global.name = user.displayName ?? '';
    //     Global.email = user.email ?? '';
    //     Global.photo = user.photoURL ?? '';
    //     Get.offAll(() => BottomNavigationMenu());
    //   } else {
    //     Get.offAll(() => const LoginScreen());
    //   }
    // });
    if (box.read('cookies') != null) {
      print('notcallguestapi');
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAll(() => Home());
      });
    } else {
      print('callguestapi');
      getGuestUser();
    }
  }

  Future<void> getGuestUser() async {
    isLoading.value = true;
    try {
      await ApiRepo().getGuestUser();
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
