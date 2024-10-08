import 'package:betting_tips/controller/basket_today_controller.dart';
import 'package:betting_tips/utils/app_theme.dart';
import 'package:betting_tips/views/widgets/other_match_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_form_field.dart';

class BasketTodayScreen extends StatelessWidget {
  const BasketTodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final basketTodayController = Get.put(BasketTodayController());
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.w),
            child: CustomTextFormField(
              controller: basketTodayController.searchTxtController,
              hintText: 'search'.tr,
              isValidate: false,
              onChange: (value) {
                basketTodayController.searchBasketballList(value);
              },
            ),
          ),
          Expanded(
            child: Obx(
              () => basketTodayController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppTheme.premiumColor2,
                      ),
                    )
                  : basketTodayController.searchTxtController.text.isNotEmpty
                      ? basketTodayController.searchList.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  basketTodayController.searchList.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return OtherMatchWidget(
                                  type: 'basketball',
                                  matchModel:
                                      basketTodayController.searchList[index],
                                );
                              })
                          : Center(
                              child: CustomText(
                              text: 'no_data_found'.tr,
                            ))
                      : basketTodayController.groupList.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: basketTodayController.groupList.length,
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
                                              text: basketTodayController
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
                                        itemCount: basketTodayController
                                            .groupList[index].otherList?.length,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index1) {
                                          return OtherMatchWidget(
                                            type: 'basketball',
                                            matchModel: basketTodayController
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
