import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_chatbot/core/widgets/buttons/primary_button.dart';
import 'package:ui_chatbot/core/widgets/texts/app_text.dart';
import 'package:ui_chatbot/core/constants/app_colors.dart';
import '../../../chat/chatbot_page.dart';
import '../bloc/auth_bloc/auth_bloc.dart';
import '../bloc/auth_bloc/auth_event.dart';
import '../bloc/auth_bloc/auth_state.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // final TextEditingController confirmPassController = TextEditingController();

  String? selectedLevel;
  final List<String> academicLevels = [
    '100 Level',
    '200 Level',
    '300 Level',
    '400 Level',
    '500 Level',
    'M.Sc. Student',
  ];
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF6C63FF);

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.authenticated) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Registration Successful!")),
            );
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const ChatBotPage()),
            );
          }
          if (state.status == AuthStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? "Error"), backgroundColor: Colors.red),
            );
          }
          // Add logic to handle registration success/failure from Bloc
        },
        builder: (context, state) {
          bool isLoading = state.status == AuthStatus.loading;
          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40.h),

                    // 1. Brand Header
                    Center(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(16.r),
                            decoration: BoxDecoration(
                              color: primaryColor.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.school_outlined, size: 50.sp, color: primaryColor),
                          ),
                          SizedBox(height: 16.h),
                          AppText(text: "Create Account", fontSize: 24.sp, fontWeight: FontWeight.bold),
                          SizedBox(height: 8.h),
                          AppText(
                            text: "Join the UI Computer Science community",
                            fontSize: 14.sp,
                            color: Colors.grey.shade600,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 32.h),

                    // 2. Input Fields
                    _buildLabel("Full Name"),
                    _buildTextField(
                      controller: nameController,
                      hint: "Enter your full name",
                      icon: Icons.person_outline,
                      validator: (val) => val!.isEmpty ? "Please enter your name" : null,
                    ),

                    SizedBox(height: 16.h),
                    _buildLabel("Academic Level"),
                    _buildDropdown(primaryColor),

                    SizedBox(height: 16.h),
                    _buildLabel("University Email"),
                    _buildTextField(
                      controller: emailController,
                      hint: "e.g. name@stu.ui.edu.ng",
                      icon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) => !val!.contains('@') ? "Enter a valid email" : null,
                    ),

                    SizedBox(height: 16.h),
                    _buildLabel("Password"),
                    _buildTextField(
                      controller: passwordController,
                      hint: "Create a strong password",
                      icon: Icons.lock_outline,
                      obscureText: !state.isPasswordVisible,
                      suffix: IconButton(
                        icon: Icon(state.isPasswordVisible ? Icons.visibility : Icons.visibility_off, size: 20.sp),
                        onPressed: () => context.read<AuthBloc>().add(TogglePasswordVisibilityEvent()),
                      ),
                      validator: (val) => val!.length < 6 ? "Minimum 6 characters" : null,
                    ),

                    // SizedBox(height: 16.h),
                    // _buildLabel("Confirm Password"),
                    // _buildTextField(
                    //   controller: confirmPassController,
                    //   hint: "Repeat your password",
                    //   icon: Icons.lock_reset,
                    //   obscureText: !state.isPasswordVisible,
                    //   validator: (val) => val != passwordController.text ? "Passwords do not match" : null,
                    // ),

                    SizedBox(height: 24.h),

                    // 3. Agreement Text
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 11.sp, height: 1.5),
                          children: [
                            const TextSpan(text: "By registering, you agree to our "),
                            TextSpan(text: "Terms of Service", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold)),
                            const TextSpan(text: " and "),
                            TextSpan(text: "Privacy Policy", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 32.h),

                    // 4. Register Button
                    PrimaryButton(
                      text: isLoading ? "Creating Account..." : "Sign Up",
                      onPressed: isLoading
                          ? (){} // Disables button while loading
                          : () {
                        if (_formKey.currentState!.validate() && selectedLevel != null) {
                          context.read<AuthBloc>().add(
                            RegisterRequested(
                              nameController.text.trim(),
                              emailController.text.trim(),
                              passwordController.text.trim(),
                              selectedLevel!,
                            ),
                          );
                        }
                      },
                    ),

                    SizedBox(height: 24.h),

                    // 5. Footer
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(text: "Already have an account? ", fontSize: 14.sp),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: AppText(
                            text: "Log In",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                  ],
                ),
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
      child: AppText(text: text, fontSize: 13.sp, fontWeight: FontWeight.w600, color: Colors.black87),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool obscureText = false,
    Widget? suffix,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      style: TextStyle(fontSize: 15.sp),
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: const Color(0xFF6C63FF), size: 20.sp),
        suffixIcon: suffix,
        filled: true,
        fillColor: Colors.grey.shade50,
        contentPadding: EdgeInsets.symmetric(vertical: 16.h),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide(color: Colors.grey.shade200)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide(color: Colors.grey.shade200)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: const BorderSide(color: Color(0xFF6C63FF))),
      ),
    );
  }

  Widget _buildDropdown(Color primaryColor) {
    return DropdownButtonFormField<String>(
      dropdownColor: AppColors.white,
      initialValue: selectedLevel,
      validator: (val) => val == null ? "Please select a program" : null,
      decoration: InputDecoration(
        prefixIcon: Icon(
            Icons.book_outlined,
            color: primaryColor,
            size: 20.sp),
        filled: true,
        fillColor: Colors.grey.shade50,
        contentPadding: EdgeInsets.symmetric(vertical: 16.h),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Colors.grey.shade200)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Colors.grey.shade200)),
      ),
      hint: Text("What is your current level?", style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade500)),
      items: academicLevels.map((level) =>
          DropdownMenuItem(
              value: level,
              child: Text(level)
      )).toList(),
      onChanged: (val) => setState(() => selectedLevel = val),
    );
  }
}