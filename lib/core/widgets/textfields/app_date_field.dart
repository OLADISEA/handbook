import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../texts/app_text.dart';

class AppDateField extends StatefulWidget {

  final String? label;
  final String? hintText;
  final double? hintTextSize;
  final double? labelTextSize;
  final String? errorText;
  final bool isMandatory;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final DateTime? selectedDate;
  final String? Function(String?)? validator;



  const AppDateField({
    super.key,
    this.label = '',
    this.hintText,
    this.errorText,
    this.isMandatory = false,
    this.controller,
    this.validator,

    this.onChanged,
    this.selectedDate,
    this.hintTextSize,
    this.labelTextSize,
  });

  @override
  _AppDateFieldState createState() => _AppDateFieldState();
}

class _AppDateFieldState extends State<AppDateField> {
  final TextEditingController _localController = TextEditingController();

  bool _userPicked = false;

  @override
  void initState() {
    super.initState();

    if (widget.selectedDate != null) {
      _localController.text = _formatDate(widget.selectedDate!, includeYear: true);
    } else if (widget.controller != null) {
      _localController.text = widget.controller!.text;
    }
  }


  @override
  void dispose() {
    _localController.dispose();
    super.dispose();
  }

  // String _formatDate(DateTime date) {
  //   return "${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}-${date.year}";
  // }

  String _formatDate(DateTime date, {bool includeYear = true}) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    final year = date.year;
    return includeYear ? "$year-$month-$day" : "$month-$day";
  }




  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = DateTime(DateTime.now().year);


    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(DateTime.now().year),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor,
              onPrimary: AppColors.white,
              onSurface: AppColors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryColor,
              ),
            ),
            dialogTheme: const DialogThemeData(backgroundColor: Colors.white),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _userPicked = true;
      });

      _localController.text = _formatDate(pickedDate); // will include year
      print(_localController.text);
      print(_localController.text);
      print(_localController.text);
      print(_localController.text);

      if (widget.onChanged != null) {
        //final backendFormat = "${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
        //widget.onChanged!(backendFormat); //  send only MM-DD-YY
        widget.onChanged!(_localController.text); //  send only MM-DD-YY
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label with optional red asterisk
        Column(
          children: [
            RichText(
              text: TextSpan(
                text: widget.label,
                style: TextStyle(
                  fontSize: widget.labelTextSize??16.sp,
                  color: AppColors.black,
                  fontFamily: 'PolySans',
                ),
                children: widget.isMandatory
                    ? [
                  TextSpan(
                    text: ' *',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.sp,
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
          onTap: () => _selectDate(context),
          child: AbsorbPointer(
            child: TextFormField(
              controller: _localController,
              validator: widget.validator,

              // validator: (val) {
              //   if (widget.isMandatory && (val == null || val.isEmpty)) {
              //     return 'Please select ${widget.label?.toLowerCase()}';
              //   }
              //   return null;
              // },
              readOnly: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.textFieldBackground,
                hintText: widget.hintText??"Month and Day",
                hintStyle: TextStyle(
                    color: AppColors.textFieldColor,
                    fontSize: widget.hintTextSize??16.sp,
                    fontWeight: FontWeight.w400
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),

                    borderSide: const BorderSide(
                        color: AppColors.primaryColor

                    )
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(color: AppColors.red, width: 1.5),
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
                suffixIcon :Image.asset(AppAssets.calendar),
                //contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
              ),
            ),
          ),
        ),
        if (widget.errorText?.isNotEmpty ?? false) ...[
          SizedBox(height: 5.h),
          AppText(
            text: widget.errorText!,
            color: AppColors.red,
          ),
        ]
        // if(widget.errorText != null)
        //   AppText(text: widget.errorText!, color: AppColors.red,)
      ],
    );
  }
}
