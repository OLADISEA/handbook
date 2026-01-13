import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_chatbot/core/constants/app_colors.dart';
import 'package:ui_chatbot/core/widgets/buttons/primary_button.dart';
import 'package:ui_chatbot/core/widgets/texts/app_text.dart';
import '../../../../core/widgets/textfields/app_textfield.dart';
import '../../../chat/chatbot_page.dart';
import '../bloc/auth_bloc/auth_bloc.dart';
import '../bloc/auth_bloc/auth_event.dart';
import '../bloc/auth_bloc/auth_state.dart';
import 'forgot_password_screen.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final void Function()? onTap;

  LoginPage({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final primaryColor = AppColors.primaryColor;

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.authenticated) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const ChatBotPage()),
            );
          }
          if (state.status == AuthStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? "Auth Error"),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          bool isLoading = state.status == AuthStatus.loading;

          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.h),

                  // 1. Branding Header
                  Center(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16.r),
                          decoration: BoxDecoration(
                            color: primaryColor.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.bolt_rounded, size: 50.sp, color: primaryColor),
                        ),
                        SizedBox(height: 16.h),
                        AppText(
                          text: 'HandiBot',
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                        SizedBox(height: 8.h),
                        AppText(
                          text: "Welcome back, you've been missed!",
                          fontSize: 14.sp,
                          color: Colors.grey.shade600,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 40.h),

                  // 2. Input Fields
                  //_buildLabel("University Email"),
                  AppTextField(
                    label: 'Student Email',
                    controller: emailController,
                    obscureText: false,
                    hintText: "Enter your student email",
                  ),

                  SizedBox(height: 20.h),

                  //_buildLabel("Password"),
                  AppTextField(
                    label: 'Password',
                    controller: passwordController,
                    hintText: "Enter your password",
                    obscureText: !state.isPasswordVisible,
                    suffixIcon: IconButton(
                      icon: Icon(
                        state.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: primaryColor,
                        size: 20.sp,
                      ),
                      onPressed: () {
                        context.read<AuthBloc>().add(TogglePasswordVisibilityEvent());
                      },
                    ),
                  ),

                  // 3. Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                        );
                      },
                      child: AppText(
                        text: "Forgot Password?",
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      ),
                    ),
                  ),

                  SizedBox(height: 30.h),

                  // 4. Login Button
                  PrimaryButton(
                    text: isLoading ? "Logging in..." : "Login",
                    onPressed: isLoading
                        ? (){}
                        : () {
                      context.read<AuthBloc>().add(
                        LoginRequested(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        ),
                      );
                    },
                    textColor: Colors.white,
                    color: primaryColor,
                  ),

                  SizedBox(height: 25.h),

                  // 5. Registration Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(text: "Not a member? ", fontSize: 14.sp),
                      GestureDetector(
                        onTap: onTap,
                        child: Text(
                          "Register now",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w, bottom: 8.h),
      child: AppText(
        text: text,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }
}