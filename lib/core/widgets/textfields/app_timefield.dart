import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../constants/app_colors.dart';

class AppTimeField extends StatefulWidget {
  final String label;
  final bool isMandatory;
  final String hintText;
  final TextEditingController? controller;
  final String? errorText;
  final bool hasLabel;

  const AppTimeField({
    super.key,
    required this.label,
    this.isMandatory = false,
    this.hintText = '',
    this.controller,
    this.errorText,
    this.hasLabel = true,
  });

  @override
  State<AppTimeField> createState() => _AppTimeFieldState();
}

class _AppTimeFieldState extends State<AppTimeField> {
  late final TextEditingController _controller;
  late final bool _externalController;

  @override
  void initState() {
    super.initState();
    _externalController = widget.controller != null;
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (!_externalController) _controller.dispose();
    super.dispose();
  }

  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (ctx, child) {
        return MediaQuery(
          data: MediaQuery.of(ctx).copyWith(alwaysUse24HourFormat: true),
          child: Theme(
            data: Theme.of(ctx).copyWith(
              colorScheme: const ColorScheme.light(
                primary: AppColors.primaryColor,

                onPrimary: AppColors.white,
                onSurface: AppColors.black,
              ),
              timePickerTheme: TimePickerThemeData(

                backgroundColor: AppColors.white,
                hourMinuteColor: AppColors.primaryColor,
                hourMinuteTextColor: AppColors.white,
                dialBackgroundColor: Colors.grey.shade200,
                dialHandColor: AppColors.primaryColor,
              ),
            ),
            child: child!,
          ),
        );
      },
    );

    if (picked != null) {
      final dt = DateTime(0, 0, 0, picked.hour, picked.minute);
      final formatted = DateFormat.Hm().format(dt); // "14:15"
      setState(() => _controller.text = formatted);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Column(
          children: [
            RichText(
              text: TextSpan(
                text: widget.label,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'PolySans',
                ),
                children: widget.isMandatory
                    ? [
                  TextSpan(
                    text: ' *',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15.sp,
                    ),
                  ),
                ]
                    : [],
              ),
            ),
            SizedBox(height: 8.h),

          ],
        ),

        GestureDetector(
          onTap: () => _pickTime(context),
          child: AbsorbPointer( // Prevent manual typing
            child: TextFormField(
              controller: _controller,
              validator: (val) {
                if (widget.isMandatory && (val == null || val.isEmpty)) {
                  return 'Please select ${widget.label.toLowerCase()}';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                    color: AppColors.textFieldColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400
                ),
                filled: true,
                fillColor: AppColors.textFieldBackground,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),

                    borderSide: const BorderSide(
                        color: AppColors.primaryColor

                    )
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),

                    borderSide: const BorderSide(
                        color: AppColors.brightGrey

                    )
                ),

                border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                        color: AppColors.brightGrey

                    )
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
