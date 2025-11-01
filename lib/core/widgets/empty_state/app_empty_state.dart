import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/widgets/texts/app_text.dart';
import '../../constants/app_assets.dart';

class AppEmptyState extends StatelessWidget {
  final String title;
  final String subtitle;
  const AppEmptyState({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.w),
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        height: 375.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 50.h,),
            SvgPicture.asset(AppAssets.transactionEmpty),
            const SizedBox(height: 16),
            AppText(
                text: title,
                textAlign: TextAlign.center,
                fontSize: 20.sp, fontWeight: FontWeight.bold
            ),
            const SizedBox(height: 8),
            AppText(
              text: subtitle,
              textAlign: TextAlign.center,
              fontSize: 14.sp,
            ),
            const SizedBox(height: 16),

          ],
        ),
      ),
    );

  }
}
