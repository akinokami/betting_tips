import 'package:betting_tips/models/m_result_model.dart';
import 'package:betting_tips/views/widgets/custom_card.dart';
import 'package:betting_tips/views/widgets/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/app_theme.dart';

class MatchResultWidget extends StatelessWidget {
  const MatchResultWidget({
    super.key,
    required this.mResultModel,
  });

  final MResultModel? mResultModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: mResultModel?.isDatePlaceholder == true,
          child: Container(
            height: 40.h,
            width: double.infinity,
            color: AppTheme.premiumColor2,
            child: Center(
              child: CustomText(
                text: mResultModel?.justDate ?? '',
                textColor: AppTheme.white,
                size: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Visibility(
          visible: mResultModel?.isLeaguePlaceholder == true,
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
                  imageUrl: mResultModel?.img ?? '',
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(
                    color: AppTheme.premiumColor2,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: CustomText(text: mResultModel?.leagueName),
                ),
                CustomText(text: mResultModel?.justDate),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: mResultModel?.isDatePlaceholder != true &&
              mResultModel?.isLeaguePlaceholder != true,
          child: CustomCard(
            height: 90.h,
            widget: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 1.sw * 0.30,
                      child: Center(
                        child: CustomText(
                          text: mResultModel?.homeTeam,
                          maxLines: 2,
                        ),
                      ),
                    ),
                    Container(
                      height: 15.w,
                      padding: EdgeInsets.only(left: 5.w, right: 5.w),
                      decoration: BoxDecoration(
                          color: mResultModel?.hasAi == true &&
                                  mResultModel?.aiCorrect == true
                              ? AppTheme.green
                              : AppTheme.greyTicket,
                          borderRadius: BorderRadius.circular(3.r)),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          CustomText(
                            text: mResultModel?.homeGoals,
                            textColor: mResultModel?.hasAi == true &&
                                    mResultModel?.aiCorrect == true
                                ? AppTheme.white
                                : AppTheme.black,
                          ),
                          CustomText(
                            text: ' - ',
                            textColor: mResultModel?.hasAi == true &&
                                    mResultModel?.aiCorrect == true
                                ? AppTheme.white
                                : AppTheme.black,
                          ),
                          CustomText(
                            text: mResultModel?.awayGoals,
                            textColor: mResultModel?.hasAi == true &&
                                    mResultModel?.aiCorrect == true
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
                          text: mResultModel?.awayTeam,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                mResultModel?.hasAi == true
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 1.sw * 0.30,
                            child: Center(
                              child: CustomText(
                                text: "${mResultModel?.aiHome ?? ''} %",
                                textColor: (mResultModel?.aiHome ?? 0) >
                                            (mResultModel?.aiDraw ?? 0) &&
                                        (mResultModel?.aiHome ?? 0) >
                                            (mResultModel?.aiAway ?? 0)
                                    ? AppTheme.green
                                    : (mResultModel?.aiHome ?? 0) <
                                                (mResultModel?.aiDraw ?? 0) &&
                                            (mResultModel?.aiHome ?? 0) <
                                                (mResultModel?.aiAway ?? 0)
                                        ? AppTheme.red
                                        : Colors.orange,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          CustomText(
                            text: "${mResultModel?.aiDraw ?? ''} %",
                            textColor: (mResultModel?.aiDraw ?? 0) >
                                        (mResultModel?.aiHome ?? 0) &&
                                    (mResultModel?.aiDraw ?? 0) >
                                        (mResultModel?.aiAway ?? 0)
                                ? AppTheme.green
                                : (mResultModel?.aiDraw ?? 0) <
                                            (mResultModel?.aiHome ?? 0) &&
                                        (mResultModel?.aiDraw ?? 0) <
                                            (mResultModel?.aiAway ?? 0)
                                    ? AppTheme.red
                                    : Colors.orange,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            width: 1.sw * 0.30,
                            child: Center(
                              child: CustomText(
                                text: "${mResultModel?.aiAway ?? ''} %",
                                textColor: (mResultModel?.aiAway ?? 0) >
                                            (mResultModel?.aiHome ?? 0) &&
                                        (mResultModel?.aiAway ?? 0) >
                                            (mResultModel?.aiDraw ?? 0)
                                    ? AppTheme.green
                                    : (mResultModel?.aiAway ?? 0) <
                                                (mResultModel?.aiHome ?? 0) &&
                                            (mResultModel?.aiAway ?? 0) <
                                                (mResultModel?.aiDraw ?? 0)
                                        ? AppTheme.red
                                        : Colors.orange,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )
                    : CustomText(text: 'no_tip_for_this_match'.tr),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: mResultModel?.matchTime ?? '',
                    ),
                    Visibility(
                      visible: mResultModel?.hasAi == true,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: AppTheme.greyTicket,
                            borderRadius: BorderRadius.circular(3.r)),
                        child: Row(
                          children: [
                            CustomText(text: 'predition'.tr),
                            SizedBox(width: 3.w),
                            CustomText(
                              text: mResultModel?.prediction,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(width: 3.w),
                            Visibility(
                              visible: mResultModel?.hasAi == true,
                              child: mResultModel?.aiCorrect == true
                                  ? Icon(
                                      Icons.check_circle,
                                      size: 18.sp,
                                      color: AppTheme.green,
                                    )
                                  : Icon(
                                      Icons.cancel,
                                      size: 18.sp,
                                      color: AppTheme.red,
                                    ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
