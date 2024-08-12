import 'package:betting_tips/views/screens/tips/basketball/basketball_screen.dart';
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
          text: 'other_sport'.tr,
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
                    widget: Row(
                      children: [
                        Icon(
                          Icons.sports_basketball,
                          size: 18.sp,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        CustomText(text: 'basketball'.tr)
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: CustomCard(
                  widget: Row(
                    children: [
                      Icon(
                        Icons.sports_tennis,
                        size: 18.sp,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      CustomText(text: 'tennis'.tr)
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomCard(
                  widget: Row(
                    children: [
                      Icon(
                        Icons.sports_basketball,
                        size: 18.sp,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      CustomText(text: 'hockey'.tr)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CustomCard(
                  widget: Row(
                    children: [
                      Icon(
                        Icons.sports_tennis,
                        size: 18.sp,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      CustomText(text: 'volleyball'.tr)
                    ],
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
