import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';

class TermsAndPrivacyText extends StatelessWidget {
  final VoidCallback onTermsTapped;
  final VoidCallback onPrivacyTapped;

  const TermsAndPrivacyText({
    super.key,
    required this.onTermsTapped,
    required this.onPrivacyTapped,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        text: "By continuing, you agree to SharpSharp’s ",
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15.sp,
          color: AppColors.black200,
        ),
        children: [
          TextSpan(
            text: "Terms & Conditions",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15.sp,
              color: AppColors.black200,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTermsTapped,
          ),
          TextSpan(
            text: " and ",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15.sp,
                color: AppColors.black200
            ),
          ),
          TextSpan(
            text: "Privacy Policy",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15.sp,
              color: AppColors.black200,
            ),
            recognizer: TapGestureRecognizer()..onTap = onPrivacyTapped,
          ),
        ],
      ),
    );
  }
}
