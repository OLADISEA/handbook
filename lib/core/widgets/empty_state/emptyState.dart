import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/widgets/texts/app_text.dart';
import '../../constants/app_assets.dart';

class EmptyState extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  const EmptyState({super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      //height: 375.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          //SizedBox(height: 50.h,),
          SvgPicture.asset(imagePath),
          SizedBox(height: 20.h),
          AppText(
              text: title,
              textAlign: TextAlign.center,
              fontSize: 20.sp, fontWeight: FontWeight.w600
          ),
          SizedBox(height: 10.h),
          AppText(
            text: subtitle,
            textAlign: TextAlign.center,
            fontSize: 14.sp,
            lineHeight: 1.2875,
          ),
          //const SizedBox(height: 16),

        ],
      ),
    );

  }
}
