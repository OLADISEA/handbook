import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: Colors.black54,
        child: Center(
          child: SpinKitFadingGrid(
            color: Colors.white,  // ← add this
            size: 40.sp,
          ),
        ),
      ),
    );
  }
}
