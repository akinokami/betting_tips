import 'package:betting_tips/utils/app_theme.dart';
import 'package:betting_tips/views/widgets/custom_card.dart';
import 'package:betting_tips/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../models/other_model.dart';

class OtherMatchWidget extends StatelessWidget {
  const OtherMatchWidget({
    super.key,
    required this.type,
    required this.matchModel,
  });
  final String type;
  final OtherModel? matchModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
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
                        text: matchModel?.macHome,
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
                        text: matchModel?.macAway,
                        maxLines: 2,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Visibility(
                visible: type == 'basketball' || type == 'tennis',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 1.sw * 0.30,
                      child: Center(
                        child: CustomText(
                          text: "${matchModel?.mac1y ?? ''} %",
                          textColor: (matchModel?.mac1y ?? 0) >
                                  (matchModel?.mac2y ?? 0)
                              ? AppTheme.green
                              : AppTheme.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 1.sw * 0.30,
                      child: Center(
                        child: CustomText(
                          text: "${matchModel?.mac2y ?? ''} %",
                          textColor: (matchModel?.mac2y ?? 0) >
                                  (matchModel?.mac1y ?? 0)
                              ? AppTheme.green
                              : AppTheme.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     SizedBox(
              //       width: 1.sw * 0.30,
              //       child: Center(
              //         child: CustomText(
              //           text: "${matchModel?.aiHome ?? ''} %",
              //           textColor: (matchModel?.aiHome ?? 0) >
              //                       (matchModel?.aiDraw ?? 0) &&
              //                   (matchModel?.aiHome ?? 0) >
              //                       (matchModel?.aiAway ?? 0)
              //               ? AppTheme.green
              //               : (matchModel?.aiHome ?? 0) <
              //                           (matchModel?.aiDraw ?? 0) &&
              //                       (matchModel?.aiHome ?? 0) <
              //                           (matchModel?.aiAway ?? 0)
              //                   ? AppTheme.red
              //                   : Colors.orange,
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //     ),
              //     CustomText(
              //       text: "${matchModel?.aiDraw ?? ''} %",
              //       textColor:
              //           (matchModel?.aiDraw ?? 0) > (matchModel?.aiHome ?? 0) &&
              //                   (matchModel?.aiDraw ?? 0) >
              //                       (matchModel?.aiAway ?? 0)
              //               ? AppTheme.green
              //               : (matchModel?.aiDraw ?? 0) <
              //                           (matchModel?.aiHome ?? 0) &&
              //                       (matchModel?.aiDraw ?? 0) <
              //                           (matchModel?.aiAway ?? 0)
              //                   ? AppTheme.red
              //                   : Colors.orange,
              //       fontWeight: FontWeight.w500,
              //     ),
              //     SizedBox(
              //       width: 1.sw * 0.30,
              //       child: Center(
              //         child: CustomText(
              //           text: "${matchModel?.aiAway ?? ''} %",
              //           textColor: (matchModel?.aiAway ?? 0) >
              //                       (matchModel?.aiHome ?? 0) &&
              //                   (matchModel?.aiAway ?? 0) >
              //                       (matchModel?.aiDraw ?? 0)
              //               ? AppTheme.green
              //               : (matchModel?.aiAway ?? 0) <
              //                           (matchModel?.aiHome ?? 0) &&
              //                       (matchModel?.aiAway ?? 0) <
              //                           (matchModel?.aiDraw ?? 0)
              //                   ? AppTheme.red
              //                   : Colors.orange,
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: matchModel?.macDate ?? '',
                  ),
                  Visibility(
                    visible: type == 'basketball' || type == 'tennis',
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
                            text: (matchModel?.mac1y ?? 0) >
                                    (matchModel?.mac2y ?? 0)
                                ? '1'
                                : '2',
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
        )
      ],
    );
  }
}
