import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../texts/app_text.dart';


class ConnectivityPage extends StatelessWidget {
  const ConnectivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 250.h,),
            Icon(
              Icons.signal_wifi_off,
              size: 120.sp,
              color: AppColors.white,
            ),
            SizedBox(height: 32.h),
            // Title
            AppText(
              text: "No Internet Connection",
              color: AppColors.white,
              fontSize: 28.sp,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            // Subtitle
            AppText(
              text: "Please check your internet connection and try again.",
              color: AppColors.white.withValues(alpha: 0.8),
              fontSize: 16.sp,
              textAlign: TextAlign.center,
            ),
            Image.asset(
              AppAssets.noInternetConnection,
              height: 100.h,
              width: 100.w,
              color: AppColors.white.withValues(alpha: 0.3),
            ),
            SizedBox(height: 40.h),
            const Spacer(),
            // Optional footer image (e.g., SharpSharp logo or subtle graphic)

            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}