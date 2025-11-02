import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';
import 'app_text.dart';

class AuthTextLink extends StatelessWidget {
  final String question;
  final String actionText;
  final VoidCallback onTap;

  const AuthTextLink({
    super.key,
    required this.question,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: question,
          fontSize: 16.sp,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        ),

        GestureDetector(
          onTap: onTap,
          child: SizedBox(
            height: 40.h,
            child: AppText(
                text:" $actionText",
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
