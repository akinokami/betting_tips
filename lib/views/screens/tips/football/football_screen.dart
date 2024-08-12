import 'package:betting_tips/views/screens/tips/football/finish_screen.dart';
import 'package:betting_tips/views/screens/tips/football/upcoming_screen.dart';
import 'package:betting_tips/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/app_theme.dart';

class FootballScreen extends StatefulWidget {
  const FootballScreen({super.key});

  @override
  State<FootballScreen> createState() => _FootballScreenState();
}

class _FootballScreenState extends State<FootballScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppTheme.white,
        title: CustomText(
          text: 'football_tips'.tr,
          size: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          child: Container(
            height: 35.h,
            decoration: BoxDecoration(
              color: AppTheme.greyTicket,
              borderRadius: BorderRadius.circular(
                25.r,
              ),
            ),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              controller: tabController,
              onTap: (value) {
                //
              },
              padding: EdgeInsets.all(5.w),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  25.r,
                ),
                color: AppTheme.premiumColor2,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              dividerColor: Colors.transparent,
              labelStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
              tabs: [
                Tab(
                  text: 'upcoming'.tr,
                ),
                Tab(
                  text: 'finished'.tr,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: const [
              UpcomingScreen(),
              FinishScreen(),
            ],
          ),
        ),
      ]),
    );
  }
}
