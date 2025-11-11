import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';

class PullToRefreshError extends StatelessWidget {
  final String message;

  const PullToRefreshError({
    super.key,
    this.message = 'Something went wrong.\nPull down to refresh.',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.refresh, size: 40, color: AppColors.black),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
