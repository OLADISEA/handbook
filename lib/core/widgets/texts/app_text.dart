import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final double? lineHeight;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextDecoration? decoration;
  final String? fontFamily;

  const AppText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight = FontWeight.w400,
    this.color = AppColors.black,
    this.lineHeight,
    this.textAlign = TextAlign.start,
    this.overflow,
    this.maxLines,
    this.decoration,
    this.fontFamily
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: true,
      textScaler: const TextScaler.linear(1.0),

      style: TextStyle(
          fontFamilyFallback: ['sans-serif', 'Arial', 'Roboto'],

          fontFamily: fontFamily??'Lato',
          overflow: overflow?? TextOverflow.visible,
          height: lineHeight?? 1,
          fontSize: fontSize?? 16.sp,
          fontWeight: fontWeight,
          color: color,
          decoration: decoration??TextDecoration.none


      ),
    );
  }
}
