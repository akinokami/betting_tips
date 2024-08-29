import 'package:betting_tips/controller/live_controller.dart';
import 'package:betting_tips/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/custom_text.dart';
import '../../widgets/match_widget.dart';

class LiveScreen extends StatelessWidget {
  const LiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final liveController = Get.put(LiveController());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppTheme.white,
          title: CustomText(
            text: 'live'.tr,
            size: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Obx(
                  () => liveController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppTheme.premiumColor2,
                          ),
                        )
                      : liveController.liveList.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: liveController.liveList.length,
                              itemBuilder: (context, index) {
                                return MatchWidget(
                                  matchModel: liveController.liveList[index],
                                );
                              })
                          : Center(
                              child: CustomText(
                              text: 'no_data_found'.tr,
                            )),
                ),
              ),
            ],
          ),
        ));
  }
}
