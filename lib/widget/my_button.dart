import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_chatbot/widget/reusable_text.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final Color buttonColor;
  final double? width;
  final void Function()? onTap;
  const MyButton({super.key, required this.text, this.onTap, required this.textColor, required this.buttonColor, this.width, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: width?? double.infinity,
        //padding: EdgeInsets.all(20.h),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(15.r)
        ),
        child: Center(
          child: Reusable(text: text,fontSize: fontSize,textColor: textColor,),
        ),
      ),
    );
  }
}
