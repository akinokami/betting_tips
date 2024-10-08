import 'package:betting_tips/controller/language_controller.dart';
import 'package:betting_tips/utils/app_theme.dart';
import 'package:betting_tips/views/screens/setting/change_language.dart';
import 'package:betting_tips/views/screens/setting/privacy_policy_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/custom_card.dart';
import '../../widgets/custom_text.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageController = Get.put(LanguageController());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppTheme.white,
          centerTitle: true,
          title: CustomText(
            text: 'settings'.tr,
            size: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: 'general'.tr),
              SizedBox(height: 5.h),
              GestureDetector(
                onTap: () {
                  Get.to(() => const ChangeLanguageScreen());
                },
                child: CustomCard(
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.language,
                            size: 18.sp,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          CustomText(text: 'language'.tr)
                        ],
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: languageController.language.value == "en"
                                ? 'english'.tr
                                : languageController.language.value == "vi"
                                    ? 'vietnam'.tr
                                    : 'chinese'.tr,
                            size: 12.sp,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 18.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomText(text: 'other'.tr),
              SizedBox(height: 5.h),
              GestureDetector(
                onTap: () {
                  Get.to(() => const PrivacyPolicyScreen());
                },
                child: CustomCard(
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.policy_outlined,
                            size: 18.sp,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          CustomText(text: 'policy'.tr)
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18.sp,
                      ),
                    ],
                  ),
                ),
              ),
              CustomCard(
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          size: 18.sp,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CustomText(text: 'version'.tr),
                      ],
                    ),
                    const CustomText(text: '1.0.0'),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
