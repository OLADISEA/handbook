import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_chatbot/core/widgets/buttons/primary_button.dart'; // Assuming this is your custom button
import 'package:ui_chatbot/core/widgets/texts/app_text.dart'; // Assuming this is your custom text widget
import 'package:ui_chatbot/config/app_colors.dart'; // Assuming this holds your color constants

class CgpaCalculatorScreen extends StatefulWidget {
  const CgpaCalculatorScreen({super.key});

  @override
  State<CgpaCalculatorScreen> createState() => _CgpaCalculatorScreenState();
}

class _CgpaCalculatorScreenState extends State<CgpaCalculatorScreen> {
  final List<CourseEntry> _courses = [CourseEntry()];
  double _cgpa = 0.0;
  String _classOfDegree = "Not Classified";
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final _formKey = GlobalKey<FormState>();

  void _addCourse() {
    _courses.add(CourseEntry());
    _listKey.currentState?.insertItem(_courses.length - 1);
  }

  void _removeCourse(int index) {
    final removedItem = _courses[index]; // Capture the data here

    _courses.removeAt(index); // Now remove from data source

    _listKey.currentState?.removeItem(
      index,
          (context, animation) => _buildCourseCard(index, animation, item: removedItem),
      duration: const Duration(milliseconds: 300),
    );
  }

  void _calculate() {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields for courses')),
      );
      return;
    }

    double totalWeightedPoints = 0;
    int totalUnits = 0;

    for (var course in _courses) {
      totalWeightedPoints += (course.units! * course.gradePoint!);
      totalUnits += course.units!;
    }

    setState(() {
      _cgpa = totalUnits == 0 ? 0.0 : totalWeightedPoints / totalUnits;
      _classOfDegree = _getClassOfDegree(_cgpa);
    });
  }

  String _getClassOfDegree(double cgpa) {
    if (cgpa >= 3.50) return "First Class Honours";
    if (cgpa >= 3.00) return "Second Class Upper";
    if (cgpa >= 2.00) return "Second Class Lower";
    if (cgpa >= 1.00) return "Third Class Honours";
    return "Pass";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      appBar: AppBar(
        title: const Text('Academic Progress'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            _buildResultHeader(),
            Expanded(
              child: AnimatedList(
                key: _listKey,
                initialItemCount: _courses.length,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                itemBuilder: (context, index, animation) => _buildCourseCard(index, animation),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.sp),
              child: PrimaryButton(
                text: 'Calculate Final CGPA',
                onPressed: _calculate,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 70.h),
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF6C63FF),
          onPressed: _addCourse,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildResultHeader() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(16.sp),
      padding: EdgeInsets.all(24.sp),
      decoration: BoxDecoration(
        //KL:0-----0 color: _getClassColor(_cgpa).withValues(alpha: 0.3),
        border: Border.all(color: _getClassColor(_cgpa).withValues(alpha: 0.5)),
        gradient: const LinearGradient(
          colors: [Color(0xFF6C63FF), Color(0xFF3F3D56)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6C63FF).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
          children: [
          AppText(text: 'Current CGPA', color: Colors.white70, fontSize: 14.sp),
      SizedBox(height: 8.h),
      AppText(
        text: _cgpa.toStringAsFixed(2),
        color: Colors.white,
        fontSize: 42.sp,
        fontWeight: FontWeight.bold,
      ),
      SizedBox(height: 8.h),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
            color: Colors.white.withValues(alpha:0.2),
            borderRadius: BorderRadius.circular(20.r),
      ),
      child: AppText(
        text: _classOfDegree,
        color: Colors.white,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
    ],
    ),
    );
  }

  Widget _buildCourseCard(int index, Animation<double> animation, {CourseEntry? item}) {
    // If 'item' is null, we are building a normal list item
    // If 'item' is not null, we are building the disappearing removal animation
    final entry = item ?? _courses[index];

    return SizeTransition(
      sizeFactor: animation,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: 'Course ${index + 1}',
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
                // Hide delete button during the removal animation to prevent double-clicks
                if (item == null)
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline, color: Colors.redAccent),
                    onPressed: () => _removeCourse(index),
                  ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildDropdown<int>(
                    label: 'Units',
                    value: entry.units, // Use 'entry' instead of _courses[index]
                    items: [1, 2, 3, 4, 5, 6],
                    validator: (value) => value == null ? 'Required' : null,
                    onChanged: item != null ? (null) : (val) => setState(() => entry.units = val),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  flex: 3,
                  child: _buildDropdown<int>(
                    label: 'Grade',
                    value: entry.gradePoint, // Use 'entry' instead of _courses[index]
                    items: const [4, 3, 2, 1, 0],
                    itemLabels: const ['A (70-100)', 'B (60-69)', 'C (50-59)', 'D (45-49)', 'E/F (0-44)'],
                    validator: (value) => value == null ? 'Required' : null,
                    onChanged: item != null ? null : (val) => setState(() => entry.gradePoint = val),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown<T>({
    required String label,
    required T? value,
    required List<T> items,
    List<String>? itemLabels,
    required ValueChanged<T?>? onChanged,
    String? Function(T?)? validator,
  }) {
    return DropdownButtonFormField<T>(
      value: value,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey.shade50,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Color(0xFF6C63FF), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Colors.redAccent, width: 2),
        ),
      ),
      items: List.generate(items.length, (i) {
        return DropdownMenuItem(
          value: items[i],
          child: Text(itemLabels != null ? itemLabels[i] : items[i].toString()),
        );
      }),
      onChanged: onChanged,
    );
  }
}

Color _getClassColor(double cgpa) {
  if (cgpa >= 3.50) return Colors.amber; // Gold
  if (cgpa >= 3.00) return Colors.blueGrey.shade200; // Silver
  if (cgpa >= 2.00) return Colors.orange.shade300; // Bronze
  return Colors.transparent;
}

class CourseEntry {
  int? units;
  int? gradePoint;
}



