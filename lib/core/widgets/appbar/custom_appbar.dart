import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../texts/app_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showBackArrow;
  final String? actionText;
  final VoidCallback? onActionPressed;
  final VoidCallback? onBackPressed;
  final Color backgroundColor;
  final Color iconColor;
  final TextStyle? titleTextStyle;
  final TextStyle? actionTextStyle;

  const CustomAppBar({
    super.key,
    this.title,
    this.showBackArrow = true,
    this.actionText,
    this.onActionPressed,
    this.onBackPressed,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.black,
    this.titleTextStyle,
    this.actionTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      automaticallyImplyLeading: false,
      surfaceTintColor: AppColors.white,

      leading: showBackArrow
          ? IconButton(
        icon: Image.asset(AppAssets.backArrow),
        onPressed: onBackPressed??() => context.pop(),
      )
          : null,
      title: title != null
          ? AppText(
              text: title!,
              color: iconColor,
              fontWeight: FontWeight.w600,
              fontSize: 28.sp,

      )
          : null,
      centerTitle: true,
      actions: [
        if (actionText != null)
          TextButton(
            onPressed: onActionPressed,
            child: Text(
              actionText!,
              style: actionTextStyle ??
                  TextStyle(
                    color: iconColor,
                    fontSize: 16.sp,
                  ),
            ),
          ),
      ],
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}





class CustomHeader extends StatelessWidget {
  final String? title;
  final double? height;
  final double? topMargin;
  final bool showBackArrow;
  final String? actionText;
  final VoidCallback? onActionPressed;
  final VoidCallback? onBackPressed;
  final Color backgroundColor;
  final Color iconColor;
  final TextStyle? titleTextStyle;
  final TextStyle? actionTextStyle;
  final double? textSize;
  final bool showSearch;
  final bool isTextCentered;
  final ValueChanged<String>? onSearchChanged;

  const CustomHeader({
    super.key,
    this.title,
    this.height,
    this.topMargin,
    this.showBackArrow = true,
    this.actionText,
    this.onActionPressed,
    this.onBackPressed,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.black,
    this.titleTextStyle,
    this.actionTextStyle,
    this.textSize,
    this.showSearch = false,
    this.isTextCentered = true,
    this.onSearchChanged,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: topMargin?? 44.h),
      //padding: EdgeInsets.only(left: 20.w),
      height: height??44.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back arrow
          if (showBackArrow)
            GestureDetector(
              onTap: onBackPressed??() => context.pop(),
              child: SvgPicture.asset(
                AppAssets.arrowBack,
                color: iconColor,
              ),
            ),
          // else

          // Title
          Expanded(
            child: isTextCentered?
            Center(
              child: title != null
                  ? AppText(
                text: title!,
                color: iconColor,
                fontWeight: FontWeight.w600,
                fontSize: textSize??28.sp,
              )
                  : const SizedBox.shrink(),
            ): title != null
                ? AppText(
              text: title!,
              color: iconColor,
              fontWeight: FontWeight.w600,
              fontSize: textSize??28.sp,
            )
                : const SizedBox.shrink(),
          ),

          // Action text
          if (showSearch)
            InkWell(
                onTap: onActionPressed,
                child: SvgPicture.asset(AppAssets.search))
          else if (actionText != null)
            TextButton(
              onPressed: onActionPressed,
              child: Text(
                actionText!,
                style: actionTextStyle ?? TextStyle(
                  color: iconColor,
                  fontSize: 16.sp,
                ),
              ),
            )
          else
            SizedBox(width: 48.w),
        ],
      ),
    );
  }

}

