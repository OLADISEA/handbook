import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_chatbot/core/widgets/texts/app_text.dart';
import 'package:ui_chatbot/widget/reusable_text.dart';

import '../../../../config/app_colors.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../widget/my_button.dart';
import '../../../../widget/my_textfield.dart';
import '../bloc/auth_bloc/auth_bloc.dart';
import '../bloc/auth_bloc/auth_event.dart';
import '../bloc/auth_bloc/auth_state.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({Key? key, this.onTap}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Controllers for input fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  // For dropdown (Program)
  String? selectedProgram;
  final List<String> programs = [
    'Computer Science',
    'Software Engineering',
    'Cyber Security',
    'ICT',

  ];

  void register(BuildContext context) {
    if (passwordController.text == confirmPassController.text) {
      print(true);
      try {
        //auth.signInWithEmailAndPass(emailController.text, passwordController.text);
        // Handle additional fields like name and program as needed
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords don't match"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 150.h,left: 23.w,right: 23.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo
                  Center(
                    child: Icon(
                      Icons.message,
                      size: 60,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),

                  // Welcome message
                  Center(
                    child: Text(
                      "Let's create an account for you",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary, fontSize: 16.sp),
                    ),
                  ),
                  const SizedBox(height: 25,),


                  Padding(
                    padding: EdgeInsets.only(left: 1.w),
                    child: Reusable(text: "Name",fontSize: 14.sp,),
                  ),
                  SizedBox(height: 3.h,),
                  AppTextField(controller: nameController, obscureText: false, hintText: "Name",),
                  SizedBox(height: 15.h,),


                  Padding(
                    padding: EdgeInsets.only(left: 1.w),
                    child: Reusable(text: "Program",fontSize: 14.sp,),
                  ),
                  SizedBox(height: 3.h,),
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButtonFormField<String>(
                      value: selectedProgram,
                      hint: AppText(
                        fontSize: 14.sp,
                          text: "Select Program",
                          color: AppColors.black
                      ),
                      items: programs.map((String program) {
                        return DropdownMenuItem<String>(
                          value: program,
                          child: Text(program),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedProgram = newValue!;
                        });
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 15.h,),

                  // Email text field
                  Padding(
                    padding: EdgeInsets.only(left: 1.w),
                    child: Reusable(text: "Email",fontSize: 14.sp,),
                  ),
                  SizedBox(height: 3.h,),
                  AppTextField(controller: emailController, obscureText: false, hintText: "Email",),
                  SizedBox(height: 15.h,),

                  // Password text field
                  Padding(
                    padding: EdgeInsets.only(left: 1.w),
                    child: Reusable(text: "Password",fontSize: 14.sp,),
                  ),
                  SizedBox(height: 3.h,),
                  AppTextField(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: !state.isPasswordVisible,
                    suffixIcon: IconButton(
                      icon: Icon(
                        state.isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        context.read<AuthBloc>().add(TogglePasswordVisibilityEvent());
                      },
                    ),
                  ),
                  SizedBox(height: 15.h,),

                  // Confirm password text field
                  Padding(
                    padding: EdgeInsets.only(left: 1.w),
                    child: Reusable(text: "Confirm Password",fontSize: 14.sp,),
                  ),
                  SizedBox(height: 3.h,),
                  AppTextField(controller: confirmPassController, hintText: "Confirm Password",
                    obscureText: !state.isPasswordVisible,
                    suffixIcon: IconButton(
                    icon: Icon(
                    state.isPasswordVisible
                    ? Icons.visibility
                        : Icons.visibility_off,
                    ),
                    onPressed: () {
                      context.read<AuthBloc>().add(
                          TogglePasswordVisibilityEvent());
                    }
                  ),
                  ),
                  SizedBox(height: 10.h,),
                  const Reusable(text: "By continuing, you agree to the Terms of Use. Read our Privacy Policy."),
                  SizedBox(height: 25.h,),

                  // Register button
                  MyButton(
                    text: "Register",
                    textColor: Colors.white,
                    buttonColor: AppColor.gradientColor1,
                    fontSize: 15.sp,
                    onTap: () => register(context),
                  ),
                  const SizedBox(height: 25,),

                  // Already have an account text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                          text: "Already have an account? ",
                          fontSize: 15.sp,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: AppText(
                            text:" Log in",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 40.h,),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}






























// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ui_chatbot/bloc/auth_bloc/auth_bloc.dart';
// import 'package:ui_chatbot/bloc/auth_bloc/auth_state.dart';
//
// import '../../bloc/auth_bloc/auth_event.dart';
// import '../../config/app_colors.dart';
// import '../../services/auth/auth_services.dart';
// import '../../widget/my_button.dart';
// import '../../widget/my_textfield.dart';
//
// class RegisterPage extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPassController = TextEditingController();
//
//
//   final void Function()? onTap;
//   RegisterPage({Key? key, this.onTap}) : super(key: key);
//
//   void register(BuildContext context){
//     final auth = AuthService();
//     if(passwordController.text == confirmPassController.text){
//       try{
//         auth.signInWithEmailAndPass(emailController.text, passwordController.text);
//       }catch (e){
//         showDialog(context: context, builder: (context)=>
//             AlertDialog(
//               title: Text(e.toString()),
//             )
//         );
//       }
//     }else{
//       showDialog(context: context, builder: (context)=>
//       const AlertDialog(
//         title: Text("Password don't match"),
//       )
//       );
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AuthBloc,AuthState>(
//       builder: (BuildContext context, AuthState state) {
//         return Scaffold(
//           backgroundColor: Theme.of(context).colorScheme.background,
//           body: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               //logo
//               Icon(
//                 Icons.message,
//                 size: 60,
//                 color: Theme.of(context).colorScheme.primary,
//               ),
//
//               //welcome back message
//               Text(
//                 "Let's create an account for you",
//                 style: TextStyle(
//                     color: Theme.of(context).colorScheme.primary,
//                     fontSize: 16
//                 ),
//               ),
//               const SizedBox(height: 25,),
//
//               //email textfield
//               MyTextField(controller: emailController,obscureText: false,hintText: "Email",),
//
//               const SizedBox(height: 10,),
//
//               //password textfield
//               MyTextField(
//                   controller: passwordController,
//                   hintText: "Password",
//                   obscureText: !state.isPasswordVisible,
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       state.isPasswordVisible
//                           ? Icons.visibility
//                           : Icons.visibility_off,
//                     ), onPressed: () {
//                     context.read<AuthBloc>().add(TogglePasswordVisibilityEvent());
//                   },
//                   ),
//
//               ),
//
//               //confirm password
//
//               const SizedBox(height: 10,),
//
//
//               MyTextField(
//                   controller: confirmPassController,
//                   hintText: "Confirm Password",
//                   obscureText: true),
//
//
//               const SizedBox(height: 25,),
//
//               //login button
//               MyButton(
//                 text: "Register",
//                 textColor: Colors.white,
//                 buttonColor: AppColor.gradientColor1,
//                 fontSize: 15.sp,
//                 onTap: () => register(context),
//               ),
//
//               const SizedBox(height: 25,),
//
//               //register now text button
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Already have an account?",
//                     style: TextStyle(
//                         color: Theme.of(context).colorScheme.primary
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: onTap,
//                     child: Text("Log in",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Theme.of(context).colorScheme.primary
//                       ),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         );
//       },
//
//     );
//   }
// }
