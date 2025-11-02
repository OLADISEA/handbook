// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import '../../features/chat/chatbot_page.dart';
// import 'login_or_register.dart';
//
//
//
// class AuthGate extends StatelessWidget {
//   const AuthGate({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(
//           stream: FirebaseAuth.instance.authStateChanges(),
//           builder: (context,snapshot){
//             // check if user is logged in
//             if(snapshot.hasData){
//               return const ChatBotPage();
//             }else{
//               return const LoginOrRegister();
//             }
//           }
//       ),
//     );
//   }
// }
