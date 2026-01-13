import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_chatbot/core/constants/app_colors.dart';
import 'package:ui_chatbot/core/widgets/texts/app_text.dart';
import 'package:ui_chatbot/features/settings/change_password_screen.dart';
import 'package:ui_chatbot/features/settings/privacy_policy_screen.dart';

import '../auth/presentation/view/login_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    // Academic branding colors from your UI CS Handbook context
    const primaryColor = Color(0xFF6C63FF);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFF8F9FE),
      appBar: AppBar(
        title: AppText(text: 'Settings', fontSize: 20.sp, fontWeight: FontWeight.bold),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        children: [
          _buildSectionHeader('PREFERENCES'),
          _buildSettingsGroup([
            _buildSettingsTile(
              icon: Icons.dark_mode_outlined,
              title: 'Dark Mode',
              subtitle: 'Adjust app appearance',
              trailing: Switch.adaptive(
                activeColor: primaryColor,
                value: _isDarkMode,
                onChanged: (v) => setState(() => _isDarkMode = v),
              ),
            ),
            _buildSettingsTile(
              icon: Icons.notifications_active_outlined,
              title: 'Notifications',
              subtitle: 'Manage alerts & updates',
              trailing: Switch.adaptive(
                activeColor: primaryColor,
                value: _notificationsEnabled,
                onChanged: (v) => setState(() => _notificationsEnabled = v),
              ),
            ),
          ]),

          SizedBox(height: 24.h),
          _buildSectionHeader('SECURITY & ACCOUNT'),
          _buildSettingsGroup([
            _buildSettingsTile(
              icon: Icons.lock_outline,
              title: 'Change Password',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ChangePasswordScreen())),
            ),
            _buildSettingsTile(
              icon: Icons.privacy_tip_outlined,
              title: 'Privacy Policy',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen())),
            ),
          ]),

          SizedBox(height: 24.h),
          _buildSectionHeader('APP INFO'),
          _buildSettingsGroup([
            _buildSettingsTile(
              icon: Icons.info_outline,
              title: 'Version',
              trailing: AppText(text: '1.0.0 (Stable)', color: Colors.grey, fontSize: 14.sp),
            ),
            _buildSettingsTile(
              icon: Icons.bug_report_outlined,
              title: 'Send Feedback',
              onTap: () {}, // Mentioned in Figure 4.7 of your project [cite: 482]
            ),
          ]),

          SizedBox(height: 32.h),
          TextButton.icon(
            onPressed: () => _showLogoutDialog(context),
            icon: const Icon(Icons.logout_rounded, color: Colors.redAccent),
            label: AppText(text: 'Log Out', color: Colors.redAccent, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w, bottom: 8.h),
      child: AppText(
        text: title,
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF6C63FF).withOpacity(0.8),
      ),
    );
  }

  Widget _buildSettingsGroup(List<Widget> tiles) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(children: tiles),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      leading: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: const Color(0xFF6C63FF).withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(icon, color: const Color(0xFF6C63FF), size: 22.sp),
      ),
      title: AppText(text: title, fontWeight: FontWeight.w600, fontSize: 15.sp),
      subtitle: subtitle != null ? AppText(text: subtitle, fontSize: 12.sp, color: Colors.grey) : null,
      trailing: trailing ?? Icon(Icons.chevron_right, size: 20.sp, color: Colors.grey),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Log Out?'),
        content: const Text('Are you sure you want to sign out of the Handbook Bot?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
                  (Route<dynamic> route) => false, // This condition 'false' ensures all previous routes are removed
            );
          }, child: const Text('Log Out', style: TextStyle(color: Colors.red))),
        ],
      ),
    );
  }
}