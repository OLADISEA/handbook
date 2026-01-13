import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';
import '../texts/app_text.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final double? textSize;
  final Color? color;
  final Color? borderColor;
  final double? borderRadius;
  final Widget? icon;

  final Color? textColor;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.textSize,
    this.color,
    this.icon,
    this.borderColor,
    this.textColor,
    this.borderRadius
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 350.w,
      height: height ?? 55.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          side: BorderSide(
              color: borderColor?? AppColors.transparent
          ),
          shadowColor: AppColors.white,
          elevation: 0,
          backgroundColor: color ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius??12.r),

          ),
        ),
        onPressed: onPressed,
        child: Center(
            child: icon == null
                ?AppText(
              text: text,
              fontSize: textSize??16.sp,
              fontWeight: FontWeight.w600,
              color: textColor?? AppColors.white,lineHeight: 1,)
                : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon!,
                SizedBox(width: 8.w),
                AppText(
                  text: text,
                  fontSize: textSize ?? 16.sp,
                  fontWeight: FontWeight.w600,
                  color: textColor ?? AppColors.white,
                  lineHeight: 1,
                ),
              ],
            ),
        )

      ),
    );
  }
}


class PrimaryTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? textSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final TextDecoration? textDecoration;

  const PrimaryTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textSize,
    this.textColor,
    this.fontWeight,
    this.padding,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: padding ?? EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      ),
      child: AppText(
        text: text,
        fontSize: textSize ?? 16.sp,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: textColor ?? AppColors.primaryColor,
        lineHeight: 1,
      ),
    );
  }
}

class PrimarySmallButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final double? textSize;
  final Color? color;
  final Color? borderColor;
  final double? borderRadius;

  final Color? textColor;

  const PrimarySmallButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.textSize,
    this.color,
    this.borderColor,
    this.textColor,
    this.borderRadius
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 350.w,
      height: height ?? 55.h,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            side: BorderSide(
                color: borderColor?? AppColors.transparent
            ),
            shadowColor: AppColors.white,
            elevation: 0,
            backgroundColor: color ?? AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius??12.r),

            ),
            //padding: EdgeInsets.symmetric(vertical: 14.h),
          ),
          onPressed: onPressed,
          child: AppText(
            text: text,
            fontSize: textSize??16.sp,
            fontWeight: FontWeight.w600,
            color: textColor?? AppColors.white,lineHeight: 1,)

      ),
    );
  }
}


