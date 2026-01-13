import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_chatbot/core/widgets/texts/app_text.dart';
import 'package:ui_chatbot/core/widgets/buttons/primary_button.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  double _rating = 0.0;
  final TextEditingController _commentController = TextEditingController();

  // Selected responses
  String? _satisfaction;
  String? _accuracy;
  String? _recommend;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF6C63FF);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      appBar: AppBar(
        title: AppText(text: 'App Evaluation', fontSize: 18.sp, fontWeight: FontWeight.bold),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 24.h),

            _buildSectionCard(
              title: "Overall Experience",
              child: Column(
                children: [
                  AppText(text: "How would you rate the Handbook Bot?", fontSize: 14.sp),
                  SizedBox(height: 12.h),
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 40.sp,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(Icons.star_rounded, color: Colors.amber),
                    onRatingUpdate: (rating) => setState(() => _rating = rating),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            _buildSectionCard(
              title: "Handbook Accuracy",
              child: _buildChoiceGroup(
                question: "Did the bot provide correct information based on the Departmental Handbook?",
                options: ["Very Accurate", "Mostly Accurate", "Inaccurate"],
                selected: _accuracy,
                onSelected: (val) => setState(() => _accuracy = val),
              ),
            ),

            SizedBox(height: 16.h),

            _buildSectionCard(
              title: "Utility",
              child: _buildChoiceGroup(
                question: "Did the bot help you understand your course requirements better?",
                options: ["Yes, very helpful", "Somewhat", "Not at all"],
                selected: _satisfaction,
                onSelected: (val) => setState(() => _satisfaction = val),
              ),
            ),

            SizedBox(height: 16.h),

            _buildSectionCard(
              title: "Additional Comments",
              child: TextField(
                controller: _commentController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Tell us how we can make this bot better for CS students...",
                  fillColor: Colors.grey.shade50,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
              ),
            ),

            SizedBox(height: 32.h),

            PrimaryButton(
              text: "Submit Evaluation",
              onPressed: _submitFeedback,
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xFF6C63FF).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          const Icon(Icons.analytics_outlined, color: Color(0xFF6C63FF), size: 30),
          SizedBox(width: 12.w),
          Expanded(
            child: AppText(
              text: "Your feedback helps us evaluate the efficiency of this AI system for the Computer Science Department.",
              fontSize: 13.sp,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(text: title, fontWeight: FontWeight.bold, fontSize: 15.sp, color: const Color(0xFF6C63FF)),
          SizedBox(height: 12.h),
          child,
        ],
      ),
    );
  }

  Widget _buildChoiceGroup({
    required String question,
    required List<String> options,
    required String? selected,
    required Function(String) onSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(text: question, fontSize: 13.sp, color: Colors.black54),
        SizedBox(height: 12.h),
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: options.map((option) {
            final isSelected = selected == option;
            return GestureDetector(
              onTap: () => onSelected(option),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF6C63FF) : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: AppText(
                  text: option,
                  color: isSelected ? Colors.white : Colors.black87,
                  fontSize: 12.sp,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  void _submitFeedback() {
    if (_rating == 0 && _accuracy == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please complete the evaluation before submitting.")),
      );
      return;
    }
    // Success Dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        title: const Icon(Icons.check_circle, color: Colors.green, size: 50),
        content: const Text(
          "Thank you! Your feedback has been recorded for the project research evaluation.",
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Go back to previous screen
            },
            child: const Text("Done"),
          )
        ],
      ),
    );
  }
}