import 'package:betting_tips/controller/finish_controller.dart';
import 'package:betting_tips/utils/app_theme.dart';
import 'package:betting_tips/views/widgets/custom_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/custom_text.dart';

class FinishScreen extends StatelessWidget {
  const FinishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final finishController = Get.put(FinishController());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppTheme.white,
          title: CustomText(
            text: 'finished_tips'.tr,
            size: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: Obx(
          () => finishController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppTheme.premiumColor2,
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: finishController.finishList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Visibility(
                          visible: finishController
                                  .finishList[index].isDatePlaceholder ==
                              true,
                          child: Container(
                            height: 40.h,
                            width: double.infinity,
                            color: AppTheme.premiumColor2,
                            child: Center(
                              child: CustomText(
                                text: finishController
                                        .finishList[index].justDate ??
                                    '',
                                textColor: AppTheme.white,
                                size: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: finishController
                                  .finishList[index].isLeaguePlaceholder ==
                              true,
                          child: Container(
                            color: AppTheme.greyTicket,
                            height: 40.h,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10.w,
                                ),
                                CachedNetworkImage(
                                  width: 15.w,
                                  height: 15.h,
                                  imageUrl:
                                      finishController.finishList[index].img ??
                                          '',
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(
                                    color: AppTheme.premiumColor2,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: CustomText(
                                      text: finishController
                                          .finishList[index].leagueName),
                                ),
                                CustomText(
                                    text: finishController
                                        .finishList[index].justDate),
                                SizedBox(
                                  width: 10.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: finishController
                                      .finishList[index].isDatePlaceholder !=
                                  true &&
                              finishController
                                      .finishList[index].isLeaguePlaceholder !=
                                  true,
                          child: CustomCard(
                            height: 90.h,
                            widget: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 1.sw * 0.30,
                                      child: Center(
                                        child: CustomText(
                                          text: finishController
                                              .finishList[index].homeTeam,
                                          maxLines: 2,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 15.w,
                                      padding: EdgeInsets.only(
                                          left: 5.w, right: 5.w),
                                      decoration: BoxDecoration(
                                          color: finishController
                                                          .finishList[index]
                                                          .hasAi ==
                                                      true &&
                                                  finishController
                                                          .finishList[index]
                                                          .aiCorrect ==
                                                      true
                                              ? AppTheme.green
                                              : AppTheme.greyTicket,
                                          borderRadius:
                                              BorderRadius.circular(3.r)),
                                      alignment: Alignment.center,
                                      child: Row(
                                        children: [
                                          CustomText(
                                            text: finishController
                                                .finishList[index].homeGoals,
                                            textColor: finishController
                                                            .finishList[index]
                                                            .hasAi ==
                                                        true &&
                                                    finishController
                                                            .finishList[index]
                                                            .aiCorrect ==
                                                        true
                                                ? AppTheme.white
                                                : AppTheme.black,
                                          ),
                                          const CustomText(
                                            text: ' - ',
                                            textColor: AppTheme.white,
                                          ),
                                          CustomText(
                                            text: finishController
                                                .finishList[index].awayGoals,
                                            textColor: finishController
                                                            .finishList[index]
                                                            .hasAi ==
                                                        true &&
                                                    finishController
                                                            .finishList[index]
                                                            .aiCorrect ==
                                                        true
                                                ? AppTheme.white
                                                : AppTheme.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 1.sw * 0.30,
                                      child: Center(
                                        child: CustomText(
                                          text: finishController
                                              .finishList[index].awayTeam,
                                          maxLines: 2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 1.sw * 0.30,
                                      child: Center(
                                        child: CustomText(
                                          text:
                                              "${finishController.finishList[index].aiHome ?? ''}",
                                        ),
                                      ),
                                    ),
                                    CustomText(
                                      text:
                                          "${finishController.finishList[index].aiDraw ?? ''}",
                                    ),
                                    SizedBox(
                                      width: 1.sw * 0.30,
                                      child: Center(
                                        child: CustomText(
                                          text:
                                              "${finishController.finishList[index].aiAway ?? ''}",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    // CustomText(
                                    //   text: DateFormat('hh:mm').format(
                                    //     DateTime.parse(finishController
                                    //             .finishList[index].date ??
                                    //         ''),
                                    //   ),
                                    // ),
                                    CustomText(
                                      text: finishController
                                          .finishList[index].prediction,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  }),
        ));
  }
}
