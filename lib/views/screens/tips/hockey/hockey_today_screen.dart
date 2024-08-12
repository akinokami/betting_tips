import 'package:betting_tips/utils/app_theme.dart';
import 'package:betting_tips/views/widgets/other_match_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/hockey_today_controller.dart';

import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_form_field.dart';

class HockeyTodayScreen extends StatelessWidget {
  const HockeyTodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hockeyTodayController = Get.put(HockeyTodayController());
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.w),
            child: CustomTextFormField(
              controller: hockeyTodayController.searchTxtController,
              hintText: 'search'.tr,
              isValidate: false,
              onChange: (value) {
                hockeyTodayController.searchHockeyList(value);
              },
            ),
          ),
          Expanded(
            child: Obx(
              () => hockeyTodayController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppTheme.premiumColor2,
                      ),
                    )
                  : hockeyTodayController.searchTxtController.text.isNotEmpty
                      ? hockeyTodayController.searchList.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  hockeyTodayController.searchList.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return OtherMatchWidget(
                                  type: 'hockey',
                                  matchModel:
                                      hockeyTodayController.searchList[index],
                                );
                              })
                          : Center(
                              child: CustomText(
                              text: 'no_data_found'.tr,
                            ))
                      : hockeyTodayController.groupList.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: hockeyTodayController.groupList.length,
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
                                              text: hockeyTodayController
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
                                        itemCount: hockeyTodayController
                                            .groupList[index].otherList?.length,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index1) {
                                          return OtherMatchWidget(
                                            type: 'hockey',
                                            matchModel: hockeyTodayController
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
