import 'package:betting_tips/utils/app_theme.dart';
import 'package:betting_tips/views/widgets/other_match_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/mma_today_controller.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_form_field.dart';

class MmaTodayScreen extends StatelessWidget {
  const MmaTodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mmaTodayController = Get.put(MmaTodayController());
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.w),
            child: CustomTextFormField(
              controller: mmaTodayController.searchTxtController,
              hintText: 'search'.tr,
              isValidate: false,
              onChange: (value) {
                mmaTodayController.searchMmaList(value);
              },
            ),
          ),
          Expanded(
            child: Obx(
              () => mmaTodayController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppTheme.premiumColor2,
                      ),
                    )
                  : mmaTodayController.searchTxtController.text.isNotEmpty
                      ? mmaTodayController.searchList.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: mmaTodayController.searchList.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return OtherMatchWidget(
                                  type: 'mma',
                                  matchModel:
                                      mmaTodayController.searchList[index],
                                );
                              })
                          : Center(
                              child: CustomText(
                              text: 'no_data_found'.tr,
                            ))
                      : mmaTodayController.groupList.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: mmaTodayController.groupList.length,
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
                                              text: mmaTodayController
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
                                        itemCount: mmaTodayController
                                            .groupList[index].otherList?.length,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index1) {
                                          return OtherMatchWidget(
                                            type: 'mma',
                                            matchModel: mmaTodayController
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
