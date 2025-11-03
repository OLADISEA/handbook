import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_chatbot/config/app_colors.dart';
import 'package:ui_chatbot/core/constants/app_colors.dart';
import 'package:ui_chatbot/core/widgets/buttons/primary_button.dart';
import 'package:ui_chatbot/core/widgets/texts/app_text.dart';
import 'package:ui_chatbot/widget/reusable_text.dart';

import '../../../../widget/my_button.dart';
import '../../../../widget/my_textfield.dart';
import '../../../chat/chatbot_page.dart';
import '../bloc/auth_bloc/auth_bloc.dart';
import '../bloc/auth_bloc/auth_event.dart';
import '../bloc/auth_bloc/auth_state.dart';


class LoginPage extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  final void Function()? onTap;

  LoginPage({super.key, this.onTap});


  void login(BuildContext context) async{
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const ChatBotPage()));


    // try{
    //   await authService.signInWithEmailAndPass(emailController.text, passwordController.text);
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const ChatBotPage()));
    // }catch(e){
    //   showDialog(context: context, builder: (context)=>
    //       AlertDialog(
    //         title: Text(e.toString()),
    //       )
    //   );
    // }

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc,AuthState>(
      builder: (BuildContext context, AuthState state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          //backgroundColor: Theme.of(context).colorScheme.background,
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 23.w,right: 23.w, top: 74.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //SizedBox(height: 64.h,),
            
                  Center(
                      child: AppText(
                        fontFamily: 'qurova',
                        color: AppColors.primaryColor,
                        text: 'HandiBot',
                        fontSize: 24.sp,)),
                  SizedBox(height: 60.h,),
                  //logo
                  Center(
                    child: Icon(
                    Icons.message,
                    size: 60,
                    color: Theme.of(context).colorScheme.primary,
                                ),
                  ),
            
              //welcome back message
                    Center(
                      child: Text(
                        "Welcome back, you've been missed",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16.sp
                        ),
                      ),
                    ),
                    SizedBox(height: 25.h,),
                    Padding(
                      padding: EdgeInsets.only(left: 1.w),
                      child: Reusable(text: "Email",fontSize: 15.sp,),
                    ),
                        SizedBox(height: 5.h,),
            
                        //email TextField
                  AppTextField(controller: emailController,obscureText: false,hintText: "Email",),
            
                    SizedBox(height: 15.h,),
            
                    Padding(
                      padding: EdgeInsets.only(left: 1.w),
                      child: Reusable(text: "Password",fontSize: 15.sp,),
                    ),
                    SizedBox(height: 5.h,),
            
                        //password TextField
                  AppTextField(
                      controller: passwordController,
                      hintText: "Password",
                      obscureText: !state.isPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(
                          state.isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ), onPressed: () {
                        context.read<AuthBloc>().add(TogglePasswordVisibilityEvent());
                      },
                      ),
                    ),
                      SizedBox(height: 10.h,),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 4.w), // optional spacing from edge
                      child: AppText(
                        text: "Forgot Password?",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),


                  SizedBox(height: 25.h,),
            
                      //login button
                      PrimaryButton(
                        text: "Login",
                        onPressed: () => login(context),
                        textColor: Colors.white,
                        color: AppColors.primaryColor,
                        textSize: 15.sp,
            
                      ),
            
                      SizedBox(height: 25.h,),
            
                      //register now text button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppText(
                            text: "Not a member? ",
                            color: AppColors.black,
                            fontSize: 15.sp,),
                          GestureDetector(
                            onTap: onTap,
                            child: Text("Register now",
                              style: TextStyle(
                                fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor
                              ),
                            
                            ),
                          )
                        ],
                      )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
