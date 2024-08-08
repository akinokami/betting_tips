import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/global.dart';
import '../../widgets/custom_text.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppTheme.white,
        iconTheme: const IconThemeData(color: AppTheme.black),
        title: CustomText(
          text: '',
          size: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: InAppWebView(
        initialData: Global.language == "vi"
            ? InAppWebViewInitialData(data: Global.policyHtmlVi)
            : InAppWebViewInitialData(data: Global.policyHtmlEn),
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
    );
  }
}
