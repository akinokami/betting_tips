import 'package:betting_tips/controller/live_controller.dart';
import 'package:betting_tips/services/api_constant.dart';
import 'package:betting_tips/utils/app_theme.dart';
import 'package:betting_tips/views/screens/live/webview_screen.dart';
import 'package:betting_tips/views/widgets/custom_card.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => WebViewScreen(
                            matchUrl: ApiConstant.liveScoreUrl,
                          ));
                    },
                    child: CustomCard(
                      width: 1.sw * 0.43,
                      height: 1.sh * 0.20,
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.view_timeline_outlined,
                            size: 40.sp,
                            color: AppTheme.premiumColor2,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomText(
                            text: 'scores'.tr,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => WebViewScreen(
                            matchUrl: ApiConstant.liveMatchUrl,
                          ));
                    },
                    child: CustomCard(
                      width: 1.sw * 0.45,
                      height: 1.sh * 0.20,
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.tv,
                            size: 40.sp,
                            color: AppTheme.premiumColor2,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomText(
                            text: 'matches'.tr,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomText(
                text: 'Live tips',
                size: 15.sp,
              ),
              SizedBox(
                height: 10.h,
              ),
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
