import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_chatbot/core/constants/app_colors.dart';

import '../../core/widgets/texts/app_text.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
          backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
          title: const Text('Privacy Policy')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(text: "Ethics & Data Privacy", fontSize: 22.sp, fontWeight: FontWeight.bold),
            SizedBox(height: 16.h),
            _buildPolicyPoint("1. Consent", "All interaction logs are collected only after user informed consent to improve the RAG pipeline accuracy[cite: 382]."),
            _buildPolicyPoint("2. Data Anonymization", "Interaction logs are anonymized and stored securely. No personally identifiable information (PII) is published or shared[cite: 382, 415]."),
            _buildPolicyPoint("3. Purpose of Collection", "Data is used solely to refine the chatbot's ability to navigate the Department of Computer Science Handbook and reduce advisor workload[cite: 695]."),
            _buildPolicyPoint("4. Academic Integrity", "The chatbot serves as a guide. Students are encouraged to verify critical graduation requirements with official departmental advisors during office hours[cite: 654]."),
          ],
        ),
      ),
    );
  }

  Widget _buildPolicyPoint(String title, String body) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(text: title, fontWeight: FontWeight.bold, fontSize: 16.sp),
          SizedBox(height: 4.h),
          AppText(text: body, color: Colors.black54),
        ],
      ),
    );
  }
}