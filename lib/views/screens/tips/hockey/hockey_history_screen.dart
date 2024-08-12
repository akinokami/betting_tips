import 'package:betting_tips/models/sport_date.dart';
import 'package:betting_tips/utils/app_theme.dart';
import 'package:betting_tips/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/hockey_history_controller.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/other_match_widget.dart';

class HockeyHistoryScreen extends StatelessWidget {
  const HockeyHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hockeyHistoryController = Get.put(HockeyHistoryController());
    return Scaffold(
        body: Obx(
      () => hockeyHistoryController.isLoading.value
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
                            value: hockeyHistoryController.selectedDate.value,
                            hint: CustomText(
                              text: 'select_date'.tr,
                              textColor: Colors.black,
                            ),
                            alignment: AlignmentDirectional.centerStart,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            items: hockeyHistoryController.dateList
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
                              hockeyHistoryController.selectedDate.value =
                                  newValue;
                              hockeyHistoryController
                                  .getHistoryList(newValue?.macDate ?? '');
                              hockeyHistoryController.searchTxtController.text =
                                  '';
                            },
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.w),
                  child: CustomTextFormField(
                    controller: hockeyHistoryController.searchTxtController,
                    hintText: 'search'.tr,
                    isValidate: false,
                    onChange: (value) {
                      hockeyHistoryController.searchBasketballList(value);
                    },
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => hockeyHistoryController.isLoading1.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppTheme.premiumColor2,
                            ),
                          )
                        : hockeyHistoryController
                                .searchTxtController.text.isNotEmpty
                            ? hockeyHistoryController.searchList.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: hockeyHistoryController
                                        .searchList.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return OtherMatchWidget(
                                        type: 'tennis',
                                        matchModel: hockeyHistoryController
                                            .searchList[index],
                                      );
                                    })
                                : Center(
                                    child: CustomText(
                                    text: 'no_data_found'.tr,
                                  ))
                            : hockeyHistoryController.groupList.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: hockeyHistoryController
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
                                                        hockeyHistoryController
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
                                              itemCount: hockeyHistoryController
                                                  .groupList[index]
                                                  .otherList
                                                  ?.length,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index1) {
                                                return OtherMatchWidget(
                                                  type: 'tennis',
                                                  matchModel:
                                                      hockeyHistoryController
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
