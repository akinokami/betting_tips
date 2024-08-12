import 'package:betting_tips/controller/baseball_today_controller.dart';
import 'package:betting_tips/utils/app_theme.dart';
import 'package:betting_tips/views/widgets/other_match_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_form_field.dart';

class BaseballTodayScreen extends StatelessWidget {
  const BaseballTodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final baseballTodayController = Get.put(BaseballTodayController());
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.w),
            child: CustomTextFormField(
              controller: baseballTodayController.searchTxtController,
              hintText: 'search'.tr,
              isValidate: false,
              onChange: (value) {
                baseballTodayController.searchBaseballList(value);
              },
            ),
          ),
          Expanded(
            child: Obx(
              () => baseballTodayController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppTheme.premiumColor2,
                      ),
                    )
                  : baseballTodayController.searchTxtController.text.isNotEmpty
                      ? baseballTodayController.searchList.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  baseballTodayController.searchList.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return OtherMatchWidget(
                                  type: 'baseball',
                                  matchModel:
                                      baseballTodayController.searchList[index],
                                );
                              })
                          : Center(
                              child: CustomText(
                              text: 'no_data_found'.tr,
                            ))
                      : baseballTodayController.groupList.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  baseballTodayController.groupList.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      color: AppTheme.greyTicket,
                                      height: 40.h,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          CustomText(
                                              text: baseballTodayController
                                                      .groupList[index].name ??
                                                  ''),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                        ],
                                      ),
                                    ),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: baseballTodayController
                                            .groupList[index].otherList?.length,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index1) {
                                          return OtherMatchWidget(
                                            type: 'baseball',
                                            matchModel: baseballTodayController
                                                .groupList[index]
                                                .otherList?[index1],
                                          );
                                        }),
                                  ],
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
    );
  }
}
