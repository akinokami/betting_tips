import 'package:betting_tips/views/screens/tips/baseball/baseball_screen.dart';
import 'package:betting_tips/views/screens/tips/basketball/basketball_screen.dart';
import 'package:betting_tips/views/screens/tips/hockey/hockey_screen.dart';
import 'package:betting_tips/views/screens/tips/tennis/tennis_screen.dart';
import 'package:betting_tips/views/screens/tips/volleyball/volleyball_screen.dart';
import 'package:betting_tips/views/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_theme.dart';
import '../../widgets/custom_text.dart';

class OtherScreen extends StatelessWidget {
  const OtherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppTheme.white,
        title: CustomText(
          text: 'other_sports'.tr,
          size: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const BasketballScreen());
                  },
                  child: CustomCard(
                    widget: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Icon(
                          Icons.sports_basketball,
                          size: 40.sp,
                          color: AppTheme.premiumColor2,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomText(text: 'basketball'.tr),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const TennisScreen());
                  },
                  child: CustomCard(
                    widget: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Icon(
                          Icons.sports_tennis,
                          size: 40.sp,
                          color: AppTheme.premiumColor2,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomText(text: 'tennis'.tr),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const HockeyScreen());
                  },
                  child: CustomCard(
                    widget: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Icon(
                          Icons.sports_hockey,
                          size: 40.sp,
                          color: AppTheme.premiumColor2,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomText(text: 'hockey'.tr),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const VolleyballScreen());
                  },
                  child: CustomCard(
                    widget: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Icon(
                          Icons.sports_volleyball,
                          size: 40.sp,
                          color: AppTheme.premiumColor2,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomText(text: 'volleyball'.tr),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const BaseballScreen());
                  },
                  child: CustomCard(
                    widget: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Icon(
                          Icons.sports_baseball,
                          size: 40.sp,
                          color: AppTheme.premiumColor2,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomText(text: 'baseball'.tr),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const VolleyballScreen());
                  },
                  child: CustomCard(
                    widget: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Icon(
                          Icons.sports_mma,
                          size: 40.sp,
                          color: AppTheme.premiumColor2,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomText(text: 'mma'.tr),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
