import 'package:betting_tips/utils/app_theme.dart';
import 'package:betting_tips/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashController = Get.put(SplashController());
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlutterLogo(size: 80.sp),
            SizedBox(height: 30.h),
            CustomText(
              text: 'football_betting_tips'.tr,
              size: 14.sp,
            ),
            SizedBox(height: 30.h),
            const CircularProgressIndicator(
              color: AppTheme.premiumColor2,
            ),
          ],
        ),
      ),
    );
  }
}
