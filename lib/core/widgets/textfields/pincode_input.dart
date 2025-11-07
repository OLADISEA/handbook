import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../constants/app_colors.dart';
import '../texts/app_text.dart';

class PincodeInputAndTimer extends StatefulWidget {
  final int pincodeLength;
  final int countdownTime; // seconds
  final ValueChanged<String>? onChanged;
  final VoidCallback onResend;
  final String phone;

  const PincodeInputAndTimer({
    super.key,
    this.pincodeLength = 5,
    this.countdownTime = 30,
    this.onChanged,
    this.phone = '',
    required this.onResend,
  });

  @override
  _PincodeInputAndTimerState createState() => _PincodeInputAndTimerState();
}

class _PincodeInputAndTimerState extends State<PincodeInputAndTimer> {
  late int _remainingTime;
  Timer? _timer;
  String _currentText = "";

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _remainingTime = widget.countdownTime;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime == 0) {
        timer.cancel();
        setState(() {});
      } else {
        setState(() {
          _remainingTime--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PinCodeTextField(
          appContext: context,
          length: widget.pincodeLength,
          animationType: AnimationType.fade,
          //cursorColor: Colors.black,
          keyboardType: TextInputType.number,
          textStyle: TextStyle(fontSize: 18.sp, fontFamily: 'PolySans'),
          pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(8.r),
              fieldHeight: 60.h,
              fieldWidth: 50.w,
              // fieldHeight: 64.h,
              // fieldWidth: 58.6.w,
              activeFillColor: Colors.transparent,
              inactiveFillColor: Colors.transparent,
              selectedFillColor: Colors.transparent,
              activeColor: AppColors.pinCodeBorder,
              selectedColor: AppColors.primaryColor,
              inactiveColor: AppColors.pinCodeBorder,
              borderWidth: 1.h),
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          onChanged: (value) {
            setState(() {
              _currentText = value;
            });
            if (widget.onChanged != null) widget.onChanged!(value);
          },
          beforeTextPaste: (text) {
            return true;
          },
        ),
        //SizedBox(height: 24.h),
        GestureDetector(
          onTap: _remainingTime == 0
              ? () {
                  widget.onResend();
                  _startTimer();
                }
              : null,
          child: _remainingTime != 0
              ? Row(
                  children: [
                    AppText(
                      text: "Resend code in ",
                      fontWeight: _remainingTime == 0
                          ? FontWeight.w600
                          : FontWeight.w400,
                      fontSize: 15.sp,
                      color: AppColors.black,
                    ),
                    AppText(
                      text: _remainingTime.toString(),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                )
              : InkWell(
                  //TODO: Removed the logic for resending the verification code and restarting the timer into the parent
                  // onTap: () {
                  //   context.read<ResendOtpBloc>().add(OtpRequest(
                  //       phone: '0${Utilities.removeFirstZero(widget.phone)}'));
                  // },
                  onTap: _remainingTime == 0 ? widget.onResend : null,
                  child: AppText(
                    text: "Resend code",
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                    color: AppColors.otpResend,
                  ),
                ),
        ),
      ],
    );
  }
}
