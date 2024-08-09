import 'package:betting_tips/controller/upcoming_controller.dart';
import 'package:betting_tips/utils/app_theme.dart';
import 'package:betting_tips/views/widgets/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../utils/global.dart';
import '../../widgets/custom_card.dart';

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({super.key});

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  bool isAccepted = false;
  bool isChecked = false;
  String first = '';

  @override
  void initState() {
    super.initState();
    final box = GetStorage();
    first = box.read('first') ?? '';
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        if (first == '') {
          if (context.mounted) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (ctx) => Builder(builder: (context) {
                return StatefulBuilder(
                  builder: (context, StateSetter setState) {
                    return AlertDialog(
                      content: SizedBox(
                        height: 1.sh * 0.80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SingleChildScrollView(
                              child: SizedBox(
                                height: 1.sh * 0.65,
                                width: double.infinity,
                                child: InAppWebView(
                                  initialData: Global.language == "vi"
                                      ? InAppWebViewInitialData(
                                          data: Global.policyHtmlVi)
                                      : InAppWebViewInitialData(
                                          data: Global.policyHtmlEn),
                                  initialOptions: InAppWebViewGroupOptions(
                                    android: AndroidInAppWebViewOptions(
                                      cacheMode: AndroidCacheMode.LOAD_DEFAULT,
                                      useHybridComposition: true,
                                      useShouldInterceptRequest: true,
                                    ),
                                    crossPlatform: InAppWebViewOptions(
                                      cacheEnabled: true,
                                      useShouldOverrideUrlLoading: true,
                                      javaScriptEnabled: true,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  activeColor: AppTheme.premiumColor2,
                                  side: BorderSide(
                                    width: 1.5,
                                    color: isChecked
                                        ? AppTheme.premiumColor2
                                        : Colors.black,
                                  ),
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                      if (isChecked) {
                                        isAccepted = true;
                                      } else {
                                        isAccepted = false;
                                      }
                                    });
                                  },
                                ),
                                CustomText(
                                  text: 'agree'.tr,
                                  size: 12,
                                ),
                              ],
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateColor.resolveWith((states) =>
                                          isAccepted
                                              ? AppTheme.premiumColor2
                                              : AppTheme.greyTicket)),
                              // ignore: sort_child_properties_last
                              child: CustomText(
                                text: 'accept'.tr,
                                size: 12,
                              ),
                              onPressed: isAccepted
                                  ? () async {
                                      final box = GetStorage();
                                      box.write('first', 'notfirst');
                                      Navigator.pop(context);
                                    }
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            );
          }
        }
      } catch (e) {
        print("Error fetching SharedPreferences: $e");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final upcomingController = Get.put(UpcomingController());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppTheme.white,
          title: CustomText(
            text: 'upcoming_tips'.tr,
            size: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: Obx(
          () => upcomingController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppTheme.premiumColor2,
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: upcomingController.upcomingList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Visibility(
                          visible: upcomingController
                                  .upcomingList[index].isDatePlaceholder ==
                              true,
                          child: Container(
                            height: 40.h,
                            width: double.infinity,
                            color: AppTheme.premiumColor2,
                            child: Center(
                              child: CustomText(
                                text: upcomingController
                                        .upcomingList[index].justDate ??
                                    '',
                                textColor: AppTheme.white,
                                size: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: upcomingController
                                  .upcomingList[index].isLeaguePlaceholder ==
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
                                  imageUrl: upcomingController
                                          .upcomingList[index].img ??
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
                                      text: upcomingController
                                          .upcomingList[index].leagueName),
                                ),
                                CustomText(
                                    text: upcomingController
                                        .upcomingList[index].justDate),
                                SizedBox(
                                  width: 10.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: upcomingController
                                      .upcomingList[index].isDatePlaceholder !=
                                  true &&
                              upcomingController.upcomingList[index]
                                      .isLeaguePlaceholder !=
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
                                          text: upcomingController
                                              .upcomingList[index].homeTeam,
                                          maxLines: 2,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 20.w,
                                      height: 20.w,
                                      decoration: BoxDecoration(
                                          color: AppTheme.premiumColor2,
                                          borderRadius:
                                              BorderRadius.circular(100.r)),
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
                                          text: upcomingController
                                              .upcomingList[index].awayTeam,
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
                                              "${upcomingController.upcomingList[index].aiHome ?? ''}",
                                        ),
                                      ),
                                    ),
                                    CustomText(
                                      text:
                                          "${upcomingController.upcomingList[index].aiDraw ?? ''}",
                                    ),
                                    SizedBox(
                                      width: 1.sw * 0.30,
                                      child: Center(
                                        child: CustomText(
                                          text:
                                              "${upcomingController.upcomingList[index].aiAway ?? ''}",
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
                                    //     DateTime.parse(upcomingController
                                    //             .upcomingList[index].date ??
                                    //         ''),
                                    //   ),
                                    // ),
                                    CustomText(
                                      text: upcomingController
                                          .upcomingList[index].prediction,
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
