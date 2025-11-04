import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';

class LoadingTransactionList extends StatelessWidget {
  final double? height;
  final int itemCount;
  const LoadingTransactionList({super.key, this.itemCount = 4, this.height});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      separatorBuilder: (_, __) => Divider(height: 1.h, color: AppColors.grey300),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          child: Row(
            children: [
              Container(
                width: 40.w,
                height: height??40.w,
                decoration: const BoxDecoration(
                  color: AppColors.grey300,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // First line
                    Container(
                      width: 0.5.sw,
                      height: 12.h,
                      color: AppColors.grey300,
                    ),
                    SizedBox(height: 8.h),
                    // Second line shorter
                    Container(
                      width: 0.3.sw,
                      height: 10.h,
                      color: AppColors.grey300,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              // Right placeholder: amount
              Container(
                width: 60.w,
                height: 12.h,
                color: AppColors.grey300,
              ),
            ],
          ),
        );
      },
    );
  }
}
