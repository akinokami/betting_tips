import 'package:betting_tips/controller/finish_controller.dart';
import 'package:betting_tips/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/match_result_widget.dart';

class FinishScreen extends StatelessWidget {
  const FinishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final finishController = Get.put(FinishController());
    return Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   centerTitle: true,
        //   backgroundColor: AppTheme.white,
        //   title: CustomText(
        //     text: 'finished_tips'.tr,
        //     size: 15.sp,
        //     fontWeight: FontWeight.w500,
        //   ),
        // ),
        body: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10.w),
          child: CustomTextFormField(
            controller: finishController.searchTxtController,
            hintText: 'search'.tr,
            isValidate: false,
            onChange: (value) {
              finishController.searchFinishList(value);
            },
          ),
        ),
        Expanded(
          child: Obx(
            () => finishController.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppTheme.premiumColor2,
                    ),
                  )
                : finishController.searchList.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: finishController.searchList.length,
                        itemBuilder: (context, index) {
                          return MatchResultWidget(
                              mResultModel: finishController.searchList[index]);
                        })
                    : Center(
                        child: CustomText(
                        text: 'no_data_found'.tr,
                      )),
          ),
        ),
      ],
    ));
  }
}
