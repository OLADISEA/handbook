import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ui_chatbot/widget/reusable_text.dart';

import '../../config/app_colors.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // Controllers for the text fields
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  // Selected Program
  String? _selectedProgram;

  // List of Programs (dropdown options)
  final List<String> _programs = [
    'Computer Science',
    'Mathematics',
    'Physics',
    'Law',
    'Software Engineering',
    'Data Science',
    'Cybersecurity'
  ];
  // Image picker for profile picture
  File? _image;
  final _picker = ImagePicker();

  // Key for the form
  final _formKey = GlobalKey<FormState>();

  // Method to pick an image
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Container(
        margin: EdgeInsets.only(left: 23.w,right: 23.w,top: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back_ios_new_outlined)
                ),
                SizedBox(width: 80.w,),
                Reusable(text: "Settings",fontSize: 25.sp,fontWeight: FontWeight.bold,)
              ],
            ),

            SizedBox(height: 20.h),

            // Form for student details
            Container(
              padding: EdgeInsets.all(16.h),
              decoration: BoxDecoration(
                color: AppColor.kWhite,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Form(
                key: _formKey, // Associate the form key
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Picture
                    Center(
                      child: GestureDetector(
                        onTap: _pickImage, // Pick image on tap
                        child: CircleAvatar(
                          radius: 50.r,
                          backgroundImage: _image != null
                              ? FileImage(_image!)
                              : const AssetImage('assets/images/default_image.png')
                          as ImageProvider, // Default profile picture
                          child: _image == null
                              ? Icon(Icons.camera_alt, size: 40.sp, color: Colors.white)
                              : null,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),

                    // Name field
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),

                    // Program dropdown
                    DropdownButtonFormField<String>(
                      value: _selectedProgram,
                      items: _programs
                          .map((program) => DropdownMenuItem<String>(
                        value: program,
                        child: Text(program),
                      ))
                          .toList(),
                      decoration: InputDecoration(
                        labelText: 'Select Program',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        prefixIcon: Icon(Icons.school),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _selectedProgram = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select your program';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),

                    // Email field
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),

                    // Save button
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Save the student details (name, program, email)
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Details Saved!'),
                            ),
                          );
                          // You can add logic to store the entered details in a database or local storage
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.gradientColor1,
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
