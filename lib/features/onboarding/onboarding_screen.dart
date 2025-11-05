import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_chatbot/config/app_colors.dart';
import 'package:ui_chatbot/core/widgets/buttons/primary_button.dart';
import 'package:ui_chatbot/widget/my_button.dart';
import '../../core/constants/app_colors.dart';
import '../../services/auth/login_or_register.dart';
import '../../widget/reusable_text.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  bool checkBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        padding: EdgeInsets.only(top: 50.h),
        child: Column(
          children: [
            // PageView to scroll between different onboarding screens
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  buildOnboardingPage(
                    imagePath: "assets/images/chatbot-image.png",
                    title: "Welcome to UI ChatBot",
                    description:
                    "Ask Career related Questions and choose a field of your interest.",
                  ),
                  buildOnboardingPage(
                    imagePath: "assets/images/chatbot-image.png",
                    title: "Connect Easily",
                    description:
                    "UI ChatBot helps you to easily connect with career advisors.",
                  ),
                  buildOnboardingPage(
                    imagePath: "assets/images/chatbot-image.png",
                    title: "Discover Opportunities",
                    description:
                    "Explore various career opportunities tailored to your interest.",
                  ),
                ],
              ),
            ),

            // Page Indicator (dots)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return buildIndicator(index == _currentPage);
              }),
            ),

            // Get Started Button
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: PrimaryButton(
                text: _currentPage == 2 ? "Get Started" : "Next",
                onPressed: () {
                  if (_currentPage == 2) {
                    // Navigate to AuthGate if it's the last page
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const LoginOrRegister()),
                    );
                  } else {
                    // Move to the next page
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                textColor: Colors.white,
                color: AppColors.primaryColor,
                textSize: 15.sp,
              ),
            ),
            SizedBox(height: 20.h),

            // Checkbox for Terms and Conditions
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     IconButton(
            //       onPressed: () {
            //         setState(() {
            //           checkBox = !checkBox;
            //         });
            //       },
            //       icon: Icon(
            //         checkBox ? Icons.check_box : Icons.check_box_outline_blank,
            //       ),
            //     ),
            //     Reusable(
            //       text: "Accept the Terms and Conditions",
            //       fontSize: 15.sp,
            //     ),
            //   ],
            // ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  // Widget to build individual onboarding page
  Widget buildOnboardingPage({
    required String imagePath,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 200.h),
          SizedBox(height: 40.h),
          Reusable(
            text: title,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
          Reusable(
            text: description,
            fontSize: 18.sp,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Widget for the indicator (dot)
  Widget buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 8.h,
      width: isActive ? 20.w : 8.w,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}






























// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ui_chatbot/config/app_colors.dart';
// import 'package:ui_chatbot/features/auth/login_page.dart';
// import 'package:ui_chatbot/services/auth/auth_gate.dart';
// import 'package:ui_chatbot/widget/my_button.dart';
//
// import '../../widget/reusable_text.dart';
//
//
// class OnboardingPage extends StatefulWidget {
//   const OnboardingPage({super.key});
//
//   @override
//   State<OnboardingPage> createState() => _OnboardingPageState();
// }
//
// class _OnboardingPageState extends State<OnboardingPage> {
//
//   bool checkBox = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: EdgeInsets.only(left: 30.w,top: 100.h,right: 30.w),
//         child: Column(
//           children: [
//             Image.asset("assets/images/chatbot-image.png"),
//             SizedBox(height: 40.h),
//             Container(
//               padding: EdgeInsets.all(15.h),
//
//               child: Reusable(text: "Welcome to UI ChatBot",fontSize: 22.sp,),
//             ),
//             SizedBox(height: 40.h,),
//             MyButton(text: "Get Started",onTap: (){
//               Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const AuthGate()));
//
//             }, textColor: Colors.white, buttonColor: AppColor.gradientColor1, fontSize: 15.sp,),
//             SizedBox(height: 35.h,),
//             Container(
//                 padding: EdgeInsets.only(left: 15.w,right: 15.w),
//                 height: 60.h,
//                 child: Reusable(text: "Ask Career related Questions and choose a field of your interest",fontSize: 18.sp,textAlign: TextAlign.center,)),
//             SizedBox(height: 10.h,),
//             Row(
//               //mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(onPressed: (){
//                   setState(() {
//                     checkBox = !checkBox;
//                   });
//                 }, icon: Icon(checkBox?Icons.check_box:Icons.check_box_outline_blank)),
//                 Reusable(text: "Accept the Terms and Conditions", fontSize: 15.sp,)
//
//               ],
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
