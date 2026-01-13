import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../../features/chat/chatbot_page.dart';
import '../../features/onboarding/onboarding_screen.dart';
import '../../services/auth/login_or_register.dart';

class RootNavigationService {
  static Future<Widget> getStartScreen() async {
    final prefs = await SharedPreferences.getInstance();
    bool? onboardingComplete = prefs.getBool('onboarding_complete');

    User? user = FirebaseAuth.instance.currentUser;

    if (onboardingComplete != true) {
      return const OnboardingPage();
    } else if (user == null) {
      return const LoginOrRegister();
    } else {
      return const ChatBotPage();
    }
  }
}