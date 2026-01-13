import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ui_chatbot/core/widgets/texts/app_text.dart';
import 'package:ui_chatbot/core/widgets/buttons/primary_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers with dummy data
  final _nameController = TextEditingController(text: 'Oladokun Tosin');
  final _matricController = TextEditingController(text: '222499');
  final _emailController = TextEditingController(text: 'ladisea55@gmail.com');

  String _selectedLevel = '400 Level';
  String _selectedProgram = 'Computer Science';

  File? _image;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) setState(() => _image = File(pickedFile.path));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 30.h),
                    _buildInputField(label: 'Full Name', controller: _nameController, icon: Icons.person_outline),
                    SizedBox(height: 16.h),
                    _buildInputField(label: 'Matric Number', controller: _matricController, icon: Icons.badge_outlined, isReadOnly: true),
                    SizedBox(height: 16.h),
                    _buildDropdownField(
                      label: 'Academic Level',
                      value: _selectedLevel,
                      items: ['100 Level', '200 Level', '300 Level', '400 Level', '500 Level'],
                      onChanged: (val) => setState(() => _selectedLevel = val!),
                    ),
                    SizedBox(height: 16.h),
                    _buildInputField(label: 'Email Address', controller: _emailController, icon: Icons.email_outlined, isReadOnly: true),
                    SizedBox(height: 30.h),
                    PrimaryButton(
                      text: 'Update Profile',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile Updated Successfully!')));
                        }
                      },
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180.h,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6C63FF), Color(0xFF3F3D56)],
              begin: Alignment.topLeft, end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white)),
                  const Spacer(),
                  AppText(text: 'My Profile', color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold),
                  const Spacer(),
                  SizedBox(width: 40.w),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -40.h,
          child: Stack(
            children: [
              CircleAvatar(
                radius: 55.r,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 50.r,
                  backgroundImage: _image != null ? FileImage(_image!) : const AssetImage('assets/images/default_image.png') as ImageProvider,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 18.r,
                    backgroundColor: const Color(0xFF6C63FF),
                    child: Icon(Icons.camera_alt, size: 18.sp, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInputField({required String label, required TextEditingController controller, required IconData icon, bool isReadOnly = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(text: label, fontSize: 14.sp, fontWeight: FontWeight.w600, color: Colors.black54),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          readOnly: isReadOnly,
          style: TextStyle(fontSize: 15.sp, color: isReadOnly ? Colors.grey : Colors.black87),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: const Color(0xFF6C63FF), size: 20.sp),
            filled: true,
            fillColor: isReadOnly ? Colors.grey[100] : Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide.none),
            contentPadding: EdgeInsets.symmetric(vertical: 16.h),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({required String label, required String value, required List<String> items, required ValueChanged<String?> onChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(text: label, fontSize: 14.sp, fontWeight: FontWeight.w600, color: Colors.black54),
        SizedBox(height: 8.h),
        DropdownButtonFormField<String>(
          value: value,
          items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.school_outlined, color: const Color(0xFF6C63FF), size: 20.sp),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }
}