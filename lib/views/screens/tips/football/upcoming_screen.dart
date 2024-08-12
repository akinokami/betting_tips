import 'package:betting_tips/controller/upcoming_controller.dart';
import 'package:betting_tips/utils/app_theme.dart';
import 'package:betting_tips/views/widgets/custom_text.dart';
import 'package:betting_tips/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../utils/global.dart';
import '../../../widgets/match_widget.dart';

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
                                  child: WebViewWidget(
                                      controller: WebViewController()
                                        ..loadHtmlString(Global.language == "vi"
                                            ? Global.policyHtmlVi
                                            : Global.policyHtmlEn))),
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
        // print("Error fetching SharedPreferences: $e");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final upcomingController = Get.put(UpcomingController());
    return Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   centerTitle: true,
        //   backgroundColor: AppTheme.white,
        //   title: CustomText(
        //     text: 'upcoming_tips'.tr,
        //     size: 15.sp,
        //     fontWeight: FontWeight.w500,
        //   ),
        // ),
        body: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10.w),
          child: CustomTextFormField(
            controller: upcomingController.searchTxtController,
            hintText: 'search'.tr,
            isValidate: false,
            onChange: (value) {
              upcomingController.searchUpcomingList(value);
            },
          ),
        ),
        Expanded(
          child: Obx(
            () => upcomingController.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppTheme.premiumColor2,
                    ),
                  )
                : upcomingController.searchList.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: upcomingController.searchList.length,
                        itemBuilder: (context, index) {
                          return MatchWidget(
                            matchModel: upcomingController.searchList[index],
                          );
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
