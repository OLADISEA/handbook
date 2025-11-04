import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../texts/app_text.dart';

class EventDatefield extends StatefulWidget {

  final String? label;
  final String? hintText;
  final double? hintTextSize;
  final double? labelTextSize;
  final String? errorText;
  final bool isMandatory;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final DateTime? selectedDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? initialDate;
  final String? Function(String?)? validator;



  const EventDatefield({
    super.key,
    this.label = '',
    this.hintText,
    this.errorText,
    this.isMandatory = false,
    this.controller,
    this.onChanged,
    this.selectedDate,
    this.hintTextSize,
    this.labelTextSize,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.validator,

  });

  @override
  _EventDatefieldState createState() => _EventDatefieldState();
}

class _EventDatefieldState extends State<EventDatefield> {
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
    final DateTime now = DateTime.now();

    DateTime initial = widget.initialDate ?? now;
    DateTime first = widget.firstDate ?? DateTime(1900);
    DateTime last = widget.lastDate ?? DateTime(now.year);

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: first,
      lastDate: last,
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
        _localController.text = _formatDate(pickedDate, includeYear: true);
      });

      widget.onChanged?.call(_localController.text);
    }
  }


  // Future<void> _selectDate(BuildContext context) async {
  //   DateTime initialDate = DateTime(DateTime.now().year);
  //
  //
  //   DateTime? pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: initialDate,
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime(DateTime.now().year),
  //     builder: (BuildContext context, Widget? child) {
  //       return Theme(
  //         data: Theme.of(context).copyWith(
  //           colorScheme: const ColorScheme.light(
  //             primary: Colors.blue,
  //             onPrimary: AppColors.white,
  //             onSurface: AppColors.black,
  //           ),
  //           textButtonTheme: TextButtonThemeData(
  //             style: TextButton.styleFrom(
  //               foregroundColor: Colors.blue,
  //             ),
  //           ),
  //           dialogTheme: const DialogThemeData(backgroundColor: Colors.white),
  //         ),
  //         child: child!,
  //       );
  //     },
  //   );
  //
  //   if (pickedDate != null) {
  //     setState(() {
  //       _userPicked = true;
  //     });
  //
  //     _localController.text = _formatDate(pickedDate); // will include year
  //     print(_localController.text);
  //     print(_localController.text);
  //     print(_localController.text);
  //     print(_localController.text);
  //
  //     if (widget.onChanged != null) {
  //       //final backendFormat = "${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
  //       //widget.onChanged!(backendFormat); //  send only MM-DD-YY
  //       widget.onChanged!(_localController.text); //  send only MM-DD-YY
  //     }
  //   }
  // }


  // Future<void> _selectDate(BuildContext context) async {
  //   DateTime initialDate = DateTime(DateTime.now().year);
  //   DateTime? pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: initialDate,
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime(DateTime.now().year),
  //     builder: (BuildContext context, Widget? child) {
  //       return Theme(
  //         data: Theme.of(context).copyWith(
  //           colorScheme: const ColorScheme.light(
  //             primary: Colors.blue,
  //             onPrimary: AppColors.white,
  //             onSurface: AppColors.black,
  //           ),
  //           textButtonTheme: TextButtonThemeData(
  //             style: TextButton.styleFrom(
  //               foregroundColor: Colors.blue,
  //             ),
  //           ), dialogTheme: const DialogThemeData(backgroundColor: Colors.white),
  //         ),
  //         child: child!,
  //       );
  //     },
  //   );
  //
  //   if (pickedDate != null) {
  //     final formattedDate = _formatDate(pickedDate); // UI display format
  //     _localController.text = formattedDate;
  //
  //     if (widget.onChanged != null) {
  //       final backendFormat = "${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
  //       print(backendFormat);
  //
  //       widget.onChanged!(backendFormat); // Backend-safe format (no year)
  //     }
  //   }
  //
  //   // if (pickedDate != null) {
  //   //   final formattedDate = _formatDate(pickedDate);
  //   //   _localController.text = formattedDate;
  //   //   if (widget.onChanged != null) {
  //   //     print(formattedDate);
  //   //     widget.onChanged!(formattedDate);
  //   //   }
  //   // }
  //
  //
  //   // if (pickedDate != null) {
  //   //   final formattedDate = "${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
  //   //
  //   //   //final formattedDate = "${pickedDate.month}-${pickedDate.day}";
  //   //   //String formattedDate = DateFormat('MMMM dd').format(pickedDate);
  //   //   _localController.text = formattedDate;
  //   //   if (widget.onChanged != null) {
  //   //     widget.onChanged!(formattedDate);
  //   //   }
  //   // }
  // }

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
                contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
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
