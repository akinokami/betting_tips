import 'package:betting_tips/utils/app_theme.dart';
import 'package:betting_tips/views/widgets/other_match_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/volleyball_today_controller.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_form_field.dart';

class VolleyballTodayScreen extends StatelessWidget {
  const VolleyballTodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final volleyballTodayController = Get.put(VolleyballTodayController());
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.w),
            child: CustomTextFormField(
              controller: volleyballTodayController.searchTxtController,
              hintText: 'search'.tr,
              isValidate: false,
              onChange: (value) {
                volleyballTodayController.searchVolleyballList(value);
              },
            ),
          ),
          Expanded(
            child: Obx(
              () => volleyballTodayController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppTheme.premiumColor2,
                      ),
                    )
                  : volleyballTodayController
                          .searchTxtController.text.isNotEmpty
                      ? volleyballTodayController.searchList.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  volleyballTodayController.searchList.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return OtherMatchWidget(
                                  type: 'volleyball',
                                  matchModel: volleyballTodayController
                                      .searchList[index],
                                );
                              })
                          : Center(
                              child: CustomText(
                              text: 'no_data_found'.tr,
                            ))
                      : volleyballTodayController.groupList.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  volleyballTodayController.groupList.length,
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
                                              text: volleyballTodayController
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
                                        itemCount: volleyballTodayController
                                            .groupList[index].otherList?.length,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index1) {
                                          return OtherMatchWidget(
                                            type: 'volleyball',
                                            matchModel:
                                                volleyballTodayController
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
