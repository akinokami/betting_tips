import 'package:betting_tips/models/sport_date.dart';
import 'package:betting_tips/utils/app_theme.dart';
import 'package:betting_tips/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/tennis_history_controller.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/other_match_widget.dart';

class TennisHistoryScreen extends StatelessWidget {
  const TennisHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tennisHistoryController = Get.put(TennisHistoryController());
    return Scaffold(
        body: Obx(
      () => tennisHistoryController.isLoading.value
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
                            value: tennisHistoryController.selectedDate.value,
                            hint: CustomText(
                              text: 'select_date'.tr,
                              textColor: Colors.black,
                            ),
                            alignment: AlignmentDirectional.centerStart,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            items: tennisHistoryController.dateList
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
                              tennisHistoryController.selectedDate.value =
                                  newValue;
                              tennisHistoryController
                                  .getHistoryList(newValue?.macDate ?? '');
                              tennisHistoryController.searchTxtController.text =
                                  '';
                            },
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.w),
                  child: CustomTextFormField(
                    controller: tennisHistoryController.searchTxtController,
                    hintText: 'search'.tr,
                    isValidate: false,
                    onChange: (value) {
                      tennisHistoryController.searchBasketballList(value);
                    },
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => tennisHistoryController.isLoading1.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppTheme.premiumColor2,
                            ),
                          )
                        : tennisHistoryController
                                .searchTxtController.text.isNotEmpty
                            ? tennisHistoryController.searchList.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: tennisHistoryController
                                        .searchList.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return OtherMatchWidget(
                                        type: 'tennis',
                                        matchModel: tennisHistoryController
                                            .searchList[index],
                                      );
                                    })
                                : Center(
                                    child: CustomText(
                                    text: 'no_data_found'.tr,
                                  ))
                            : tennisHistoryController.groupList.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: tennisHistoryController
                                        .groupList.length,
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
                                                    text:
                                                        tennisHistoryController
                                                                .groupList[
                                                                    index]
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
                                              itemCount: tennisHistoryController
                                                  .groupList[index]
                                                  .otherList
                                                  ?.length,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index1) {
                                                return OtherMatchWidget(
                                                  type: 'tennis',
                                                  matchModel:
                                                      tennisHistoryController
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
