import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_chatbot/core/constants/app_colors.dart';
import 'package:ui_chatbot/core/widgets/buttons/primary_button.dart';
import 'package:ui_chatbot/core/widgets/texts/app_text.dart';
import '../../../../core/widgets/textfields/app_textfield.dart';
import '../bloc/auth_bloc/auth_bloc.dart';
import '../bloc/auth_bloc/auth_event.dart';
import '../bloc/auth_bloc/auth_state.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = AppColors.primaryColor;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: primaryColor, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? "Error"), backgroundColor: Colors.red),
            );
          }
          // Note: In a real app, you might want a 'success' status,
          // but here we check if loading finished without an error.
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              AppText(
                text: "Reset Password 🔑",
                fontSize: 26.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              SizedBox(height: 10.h),
              AppText(
                text: "Enter your email address and we will send you a link to reset your password.",
                fontSize: 14.sp,
                color: Colors.grey.shade600,
              ),
              SizedBox(height: 40.h),

              AppTextField(
                label: 'Student Email',
                controller: emailController,
                obscureText: false,
                hintText: "example@stu.ui.edu.ng",
                prefixIcon: Icon(Icons.email_outlined, color: primaryColor),
              ),

              SizedBox(height: 30.h),

              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  bool isLoading = state.status == AuthStatus.loading;
                  return PrimaryButton(
                    text: isLoading ? "Sending Link..." : "Send Reset Link",
                    onPressed: isLoading ? (){} : () {
                      if (emailController.text.isNotEmpty) {
                        context.read<AuthBloc>().add(
                            ForgotPasswordRequested(emailController.text.trim())
                        );
                        _showSuccessDialog(context);
                      }
                    },
                    color: primaryColor,
                    textColor: Colors.white,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        title: AppText(text: "Check your Mail", fontWeight: FontWeight.bold, fontSize: 18.sp),
        content: AppText(
          text: "We have sent a password recovery instructions to your email.",
          fontSize: 14.sp,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Go back to Login
            },
            child: AppText(text: "Back to Login", color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}