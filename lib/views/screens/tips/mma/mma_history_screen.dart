import 'package:betting_tips/controller/mma_history_controller.dart';
import 'package:betting_tips/models/sport_date.dart';
import 'package:betting_tips/utils/app_theme.dart';
import 'package:betting_tips/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/other_match_widget.dart';

class MmaHistoryScreen extends StatelessWidget {
  const MmaHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mmaHistoryController = Get.put(MmaHistoryController());
    return Scaffold(
        body: Obx(
      () => mmaHistoryController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(
                color: AppTheme.premiumColor2,
              ),
            )
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Container(
                    width: double.infinity,
                    height: 35.h,
                    decoration: BoxDecoration(
                        color: AppTheme.greyTicket,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: DropdownButtonHideUnderline(
                      child: Obx(() => DropdownButton<SportDate>(
                            dropdownColor: AppTheme.greyTicket,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.r)),
                            iconEnabledColor: Colors.black,
                            // icon: const Icon(Icons.arrow_drop_down_circle),
                            padding: EdgeInsets.only(left: 8.w, right: 8.w),
                            value: mmaHistoryController.selectedDate.value,
                            hint: CustomText(
                              text: 'select_date'.tr,
                              textColor: Colors.black,
                            ),
                            alignment: AlignmentDirectional.centerStart,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            items: mmaHistoryController.dateList
                                .map<DropdownMenuItem<SportDate>>(
                                    (SportDate? value) {
                              return DropdownMenuItem<SportDate>(
                                value: value,
                                child: Center(
                                  child: CustomText(
                                    textAlign: TextAlign.center,
                                    text: value?.macDate,
                                    //textColor: blackTextColor,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (SportDate? newValue) {
                              mmaHistoryController.selectedDate.value =
                                  newValue;
                              mmaHistoryController
                                  .getHistoryList(newValue?.macDate ?? '');
                              mmaHistoryController.searchTxtController.text =
                                  '';
                            },
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.w),
                  child: CustomTextFormField(
                    controller: mmaHistoryController.searchTxtController,
                    hintText: 'search'.tr,
                    isValidate: false,
                    onChange: (value) {
                      mmaHistoryController.searchTennisList(value);
                    },
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => mmaHistoryController.isLoading1.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppTheme.premiumColor2,
                            ),
                          )
                        : mmaHistoryController
                                .searchTxtController.text.isNotEmpty
                            ? mmaHistoryController.searchList.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        mmaHistoryController.searchList.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return OtherMatchWidget(
                                        type: 'mma',
                                        matchModel: mmaHistoryController
                                            .searchList[index],
                                      );
                                    })
                                : Center(
                                    child: CustomText(
                                    text: 'no_data_found'.tr,
                                  ))
                            : mmaHistoryController.groupList.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        mmaHistoryController.groupList.length,
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
                                                    text: mmaHistoryController
                                                            .groupList[index]
                                                            .name ??
                                                        ''),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                              ],
                                            ),
                                          ),
                                          ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: mmaHistoryController
                                                  .groupList[index]
                                                  .otherList
                                                  ?.length,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index1) {
                                                return OtherMatchWidget(
                                                  type: 'mma',
                                                  matchModel:
                                                      mmaHistoryController
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
    ));
  }
}
