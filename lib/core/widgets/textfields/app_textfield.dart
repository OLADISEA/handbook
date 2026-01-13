import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';
import '../texts/app_text.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final bool isMandatory;
  final bool obscureText;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final String? initialValue;
  final String? Function(String?)? validator;
  final bool isEditable;
  final bool hasLabel;

  const AppTextField({
    super.key,
    required this.label,
    this.obscureText = false,
    this.isMandatory = false,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.errorText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.onChanged,
    this.initialValue,
    this.textInputAction,
    this.validator,
    this.isEditable = true,
    this.hasLabel = true
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hasLabel
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: label,
                style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w400),
                children: isMandatory
                    ? [
                  TextSpan(
                    text: ' *',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.sp,
                    ),
                  )
                ]
                    : [],
              ),
            ),
            SizedBox(height: 8.h),
          ],
        ): const SizedBox.shrink(),

        TextFormField(
          style: TextStyle(fontSize: 16.sp),
          obscureText: obscureText,
          controller: controller,
          initialValue: initialValue,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          //maxLength: 11,
          onChanged: onChanged,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          enabled: isEditable,
          readOnly: !isEditable,
          maxLength: label.toLowerCase().contains('phone') ? 10 : null,
          buildCounter: (BuildContext context,
              {int? currentLength, int? maxLength, bool? isFocused}) {
            return null; // ✅ This removes the counter widget
          },
          textInputAction: textInputAction,
          decoration: InputDecoration(
            counterText: "",
            filled: true,
            fillColor: AppColors.textFieldBackground,
            hintText: hintText,
            hintStyle: TextStyle(
                color: AppColors.textFieldColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400),
            //errorText: errorText,
            suffixIcon: suffixIcon,
            prefixIcon: keyboardType == TextInputType.phone
                ? Padding(
                    padding:
                        EdgeInsets.only(left: 15.w, right: 15.w,bottom: 0.h),
                    child: Text(
                      "+234",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                : prefixIcon,
            prefixIconConstraints: BoxConstraints(minWidth: 40.w),
            focusedBorder:OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(8.r),
            ),
            enabledBorder: isEditable
                ? OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.brightGrey),
                    borderRadius: BorderRadius.circular(8.r),
                  )
                : InputBorder.none,
            border: isEditable
                ? OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.brightGrey),
                    borderRadius: BorderRadius.circular(8.r),
                  )
                : InputBorder.none,
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.transparent,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            // errorBorder: OutlineInputBorder(
            //   borderSide: BorderSide(
            //       color: AppColors.red
            //   ),
            //   borderRadius: BorderRadius.circular(8.r),
            // ),
            //contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          ),
        ),
        if (errorText?.isNotEmpty ?? false) ...[
          SizedBox(height: 5.h),
          AppText(
            text: errorText!,
            color: AppColors.red,
          ),
        ]
      ],
    );
  }
}
