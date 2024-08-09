import 'package:get/get.dart';

import '../services/api_repo.dart';
import '../utils/app_theme.dart';
import '../utils/constants.dart';

class SplashController extends GetxController {
  final isLoading = false.obs;
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
    getGuestUser();
  }

  Future<void> getGuestUser() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getGuestUser();
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
