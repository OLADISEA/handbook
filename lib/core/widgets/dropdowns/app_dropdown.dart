import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';
import '../texts/app_text.dart';

class AppDropdown extends StatefulWidget {
  final String hintText;
  final FontWeight? fontWeight;
  final String? label;
  final List<String> items;
  final String? value;
  final List<String>? selectedValues;
  final bool isMultiSelect;
  final bool isMandatory;
  final String? Function(String?)? validator;

  final void Function(String? singleValue, List<String>? multiValues) onChanged;

  const AppDropdown({
    super.key,
    this.fontWeight,
    required this.hintText,
    this.label,
    required this.items,
    this.value,
    this.selectedValues,
    this.isMultiSelect = false,
    required this.onChanged,
    this.isMandatory = false,
    this.validator
  });

  @override
  _AppDropdownState createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> {
  bool _isOpen = false;
  late List<String> _tempMulti;
  String? _tempSingle;

  @override
  void initState() {
    super.initState();
    _tempMulti = widget.selectedValues != null
        ? List.from(widget.selectedValues!)
        : <String>[];
    _tempSingle = widget.value;
  }


  @override
  void didUpdateWidget(covariant AppDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);

    // If parent changed the selected value, reflect that internally
    if (widget.value != oldWidget.value) {
      setState(() => _tempSingle = widget.value);
    }

    if (widget.selectedValues != oldWidget.selectedValues) {
      setState(() => _tempMulti = widget.selectedValues != null
          ? List.from(widget.selectedValues!)
          : <String>[]);
    }
  }

  void _toggleDropdown() {
    setState(() => _isOpen = !_isOpen);
  }

  void _applySelection() {
    widget.onChanged(
      widget.isMultiSelect ? null : _tempSingle,
      widget.isMultiSelect ? _tempMulti : null,
    );
    setState(() => _isOpen = false);
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: widget.isMultiSelect ? _tempMulti.join(', ') : widget.value,
      validator: widget.validator,
      builder: (fieldState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null) ...[
              RichText(
                text: TextSpan(
                  text: widget.label,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black,
                    fontFamily: 'PolySans',
                    fontWeight: widget.fontWeight ?? FontWeight.w600,
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

            // Dropdown trigger
            GestureDetector(
              onTap: _toggleDropdown,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                decoration: BoxDecoration(
                  color: AppColors.textFieldBackground,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: fieldState.hasError
                        ? Colors.red
                        : AppColors.brightGrey,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.isMultiSelect
                            ? (_tempMulti.isNotEmpty
                            ? _tempMulti.join(', ')
                            : widget.hintText)
                            : (_tempSingle ?? widget.hintText),
                        style: TextStyle(
                          color: (widget.isMultiSelect
                              ? _tempMulti.isNotEmpty
                              : _tempSingle != null)
                              ? Colors.black
                              : AppColors.pinCodeBorder,
                          fontSize: 16.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(
                      _isOpen
                          ? Icons.keyboard_arrow_up_outlined
                          : Icons.keyboard_arrow_down_outlined,
                      color: AppColors.pinCodeBorder,
                    ),
                  ],
                ),
              ),
            ),

            // Expanded options
            if (_isOpen) ...[
              SizedBox(height: 8.h),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.textFieldBackground,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.brightGrey),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var item in widget.items)
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (widget.isMultiSelect) {
                              if (_tempMulti.contains(item)) {
                                _tempMulti.remove(item);
                              } else {
                                _tempMulti.add(item);
                              }
                            } else {
                              _tempSingle = item;
                              _applySelection();
                            }
                            fieldState.didChange(widget.isMultiSelect
                                ? _tempMulti.join(', ')
                                : _tempSingle);
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 12.w),
                          child: Row(
                            children: [
                              Expanded(
                                child: AppText(
                                    text: item,
                                  fontWeight: item == 'Add new address'
                                      ? FontWeight.w600: FontWeight.w400,
                                  fontSize: 16.sp),
                              ),
                              if (widget.isMultiSelect) ...[
                                item == '+ Add new address'
                                    ?Icon(
                                    Icons.add_circle_outline,
                                    size: 24.h,
                                    color: AppColors.primaryColor,
                                  ):
                                Container(
                                  width: 20.w,
                                  height: 20.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: _tempMulti.contains(item)
                                          ? AppColors.primaryColor
                                          : AppColors.brightGrey,
                                      width: 2,
                                    ),
                                    color: _tempMulti.contains(item)
                                        ? AppColors.primaryColor
                                        : Colors.transparent,
                                  ),
                                  child: _tempMulti.contains(item)
                                      ? const Icon(Icons.check,
                                      size: 14, color: Colors.white
                                  )
                                      : null,
                                ),
                              ] else ...[
                                item == 'Add new address'
                                    ?Icon(
                                  Icons.add_circle_outline,
                                  size: 24.h,
                                  color: AppColors.primaryColor,
                                ):
                                Icon(
                                  _tempSingle == item
                                      ? Icons.check_circle
                                      : Icons.circle_outlined,
                                  color: _tempSingle == item
                                      ? AppColors.primaryColor
                                      : AppColors.brightGrey,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],

            // error message (if any)
            if (fieldState.hasError) ...[
              SizedBox(height: 6.h),
              AppText(
                text: fieldState.errorText ?? '',
                  color: Colors.red,
                  fontSize: 12.sp,
              ),
            ],
          ],
        );
      },
    );
  }

}
