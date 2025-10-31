import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/app_colors.dart';

class AppIcon extends StatelessWidget {
  final Color? color;
  final Color? iconColor;
  final double? size;
  final double? width;
  final double? height;
  final Color? borderColor;
  final String imagePath;
  final VoidCallback onTap;
  const AppIcon({this.color, this.borderColor, this.iconColor, this.size, this.width, this.height, required this.imagePath, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width?? 32.w,
        height: height?? 32.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color?? AppColors.white,
          border: Border.all(
            color: borderColor?? AppColors.transparent
          )
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(size??0),
          child: iconColor != null
              ?SvgPicture.asset(imagePath, colorFilter: ColorFilter.mode(iconColor!, BlendMode.srcIn),)
              :SvgPicture.asset(imagePath, ),
        ),
      ),
    );
  }
}
