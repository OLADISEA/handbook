import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_chatbot/config/app_colors.dart';
import 'package:ui_chatbot/core/widgets/texts/app_text.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
import '../../core/service/root_navigation_service.dart';
import '../../widget/reusable_text.dart';
import '../onboarding/onboarding_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Color blueColor = const Color(0xFF2E98E9);
  final Color purpleColor = const Color(0xFF7F39FB);

  @override
  void initState() {
    _checkNavigation();
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OnboardingPage()));
    });
    super.initState();
  }

  Future<void> _checkNavigation() async {
    // Add a delay for the splash animation to show
    await Future.delayed(const Duration(milliseconds: 3000));

    // Get the correct screen
    Widget startScreen = await RootNavigationService.getStartScreen();

    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => startScreen),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColor.gradientColor1, AppColor.gradientColor2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                transform: GradientRotation(80 * pi / 180), // 80 degrees in radians
              ),
            ),
          ),
          Opacity(
            opacity: 0.24,
            child: ColorFiltered(
              colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor,
                  BlendMode.color
              ),
              child: Image.asset(
                AppAssets.splash,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),

          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 300.h,),
                Container(
                  height: 200.h,
                  width: 200.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 180.h,
                      child: Transform.rotate(
                        angle: -30 * pi / 180,
                        child: AppText(
                          fontFamily: 'qurova',
                          textAlign: TextAlign.center,
                          text: "HandyBot",
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 280.h,),
                Reusable(text: "Your Intelligent Guide to the UI Computer Science Handbook",textColor: Colors.white,fontSize: 12.sp,)
              ],
            ),

        ],
      ),
    );
  }
}
