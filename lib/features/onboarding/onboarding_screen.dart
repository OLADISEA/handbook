import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_chatbot/config/app_colors.dart';
import '../../core/constants/app_colors.dart';
import '../../services/auth/login_or_register.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Data tailored for your UI CS Handbook Project
  final List<Map<String, String>> onboardingData = [
    {
      "title": "Welcome to HandiBot",
      "description": "Your AI-powered assistant for the UI Computer Science Handbook. Instant answers, anytime.",
      "image": "assets/images/chatbot-image.png",
    },
    {
      "title": "Smart Search",
      "description": "No more flipping through 50 pages. Ask about prerequisites, rules, and departmental policies.",
      "image": "assets/images/chatbot-image.png",
    },
    {
      "title": "Precision Calculator",
      "description": "Compute your academic standing accurately with our built-in grade tool.",
      "image": "assets/images/chatbot-image.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. Dynamic Background Blobs
          AnimatedPositioned(
            duration: const Duration(milliseconds: 800),
            top: _currentPage == 0 ? -50.h : -150.h,
            left: _currentPage == 1 ? -50.w : -100.w,
            child: _buildBlob(300.r, AppColors.primaryColor.withOpacity(0.1)),
          ),

          SafeArea(
            child: Column(
              children: [
                // 2. Skip Button
                _buildSkipButton(),

                // 3. Main Content with PageView
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) => setState(() => _currentPage = index),
                    itemCount: onboardingData.length,
                    itemBuilder: (context, index) {
                      return _buildPageContent(index);
                    },
                  ),
                ),

                // 4. Bottom Controls
                _buildBottomControls(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkipButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Visibility(
          visible: _currentPage != 2,
          child: TextButton(
            onPressed: () => _pageController.animateToPage(2,
                duration: const Duration(milliseconds: 600), curve: Curves.easeInOut),
            child: Text("Skip", style: TextStyle(color: Colors.grey, fontSize: 16.sp)),
          ),
        ),
      ),
    );
  }

  Widget _buildPageContent(int index) {
    bool isSelected = _currentPage == index;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Scaling Image Animation
        AnimatedScale(
          scale: isSelected ? 1.0 : 0.7,
          duration: const Duration(milliseconds: 500),
          child: Image.asset(onboardingData[index]['image']!, height: 250.h),
        ),
        SizedBox(height: 50.h),
        // Fading Text Animation
        AnimatedOpacity(
          opacity: isSelected ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Column(
              children: [
                Text(
                  onboardingData[index]['title']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                SizedBox(height: 15.h),
                Text(
                  onboardingData[index]['description']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.sp, color: Colors.grey[600], height: 1.5),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomControls() {
    return Padding(
      padding: EdgeInsets.all(30.w),
      child: Column(
        children: [
          // Custom Dot Indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(onboardingData.length, (index) => _buildDot(index)),
          ),
          SizedBox(height: 40.h),
          // Gradient Button
          GestureDetector(
            onTap: () async{
              if (_currentPage == 2) {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('onboarding_complete', true);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginOrRegister()));
              } else {
                _pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.ease);
              }
            },
            child: Container(
              height: 55.h,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [AppColors.primaryColor, AppColors.primaryColor.withOpacity(0.8)]),
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(color: AppColors.primaryColor.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 5))
                ],
              ),
              child: Center(
                child: Text(
                  _currentPage == 2 ? "Get Started" : "Next",
                  style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 8),
      height: 8.h,
      width: _currentPage == index ? 24.w : 8.w,
      decoration: BoxDecoration(
        color: _currentPage == index ? AppColors.primaryColor : Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Widget _buildBlob(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}