import 'package:betting_tips/utils/app_theme.dart';
import 'package:betting_tips/views/widgets/custom_card.dart';
import 'package:betting_tips/views/widgets/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../models/match_model.dart';

class MatchWidget extends StatelessWidget {
  const MatchWidget({
    super.key,
    required this.matchModel,
  });

  final MatchModel? matchModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: matchModel?.isDatePlaceholder == true,
          child: Container(
            height: 40.h,
            width: double.infinity,
            color: AppTheme.premiumColor2,
            child: Center(
              child: CustomText(
                text: matchModel?.justDate ?? '',
                textColor: AppTheme.white,
                size: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Visibility(
          visible: matchModel?.isLeaguePlaceholder == true,
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
                  imageUrl: matchModel?.img ?? '',
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
                  child: CustomText(text: matchModel?.leagueName),
                ),
                CustomText(text: matchModel?.justDate),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: matchModel?.isDatePlaceholder != true &&
              matchModel?.isLeaguePlaceholder != true,
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
                          text: matchModel?.homeTeam,
                          maxLines: 2,
                        ),
                      ),
                    ),
                    Container(
                      width: 20.w,
                      height: 20.w,
                      decoration: BoxDecoration(
                          color: AppTheme.premiumColor2,
                          borderRadius: BorderRadius.circular(100.r)),
                      alignment: Alignment.center,
                      child: const CustomText(
                        text: 'vs',
                        textColor: AppTheme.white,
                      ),
                    ),
                    SizedBox(
                      width: 1.sw * 0.30,
                      child: Center(
                        child: CustomText(
                          text: matchModel?.awayTeam,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                matchModel?.hasAi == true
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 1.sw * 0.30,
                            child: Center(
                              child: CustomText(
                                text: "${matchModel?.aiHome ?? ''} %",
                                textColor: (matchModel?.aiHome ?? 0) >
                                            (matchModel?.aiDraw ?? 0) &&
                                        (matchModel?.aiHome ?? 0) >
                                            (matchModel?.aiAway ?? 0)
                                    ? AppTheme.green
                                    : (matchModel?.aiHome ?? 0) <
                                                (matchModel?.aiDraw ?? 0) &&
                                            (matchModel?.aiHome ?? 0) <
                                                (matchModel?.aiAway ?? 0)
                                        ? AppTheme.red
                                        : Colors.orange,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          CustomText(
                            text: "${matchModel?.aiDraw ?? ''} %",
                            textColor: (matchModel?.aiDraw ?? 0) >
                                        (matchModel?.aiHome ?? 0) &&
                                    (matchModel?.aiDraw ?? 0) >
                                        (matchModel?.aiAway ?? 0)
                                ? AppTheme.green
                                : (matchModel?.aiDraw ?? 0) <
                                            (matchModel?.aiHome ?? 0) &&
                                        (matchModel?.aiDraw ?? 0) <
                                            (matchModel?.aiAway ?? 0)
                                    ? AppTheme.red
                                    : Colors.orange,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            width: 1.sw * 0.30,
                            child: Center(
                              child: CustomText(
                                text: "${matchModel?.aiAway ?? ''} %",
                                textColor: (matchModel?.aiAway ?? 0) >
                                            (matchModel?.aiHome ?? 0) &&
                                        (matchModel?.aiAway ?? 0) >
                                            (matchModel?.aiDraw ?? 0)
                                    ? AppTheme.green
                                    : (matchModel?.aiAway ?? 0) <
                                                (matchModel?.aiHome ?? 0) &&
                                            (matchModel?.aiAway ?? 0) <
                                                (matchModel?.aiDraw ?? 0)
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
                      text: matchModel?.matchTime ?? '',
                    ),
                    Visibility(
                      visible: matchModel?.hasAi == true,
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
                              text: matchModel?.prediction,
                              fontWeight: FontWeight.bold,
                            ),
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
