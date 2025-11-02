// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class AuthService{
//   final FirebaseAuth auth = FirebaseAuth.instance;
//   final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//
//   //get current user
//   User? getCurrentUser(){
//     return auth.currentUser;
//   }
//
//
//   //sign in method
//   Future<UserCredential> signInWithEmailAndPass(String email, String password) async{
//     try{
//       UserCredential userCredential = await auth.signInWithEmailAndPassword(
//           email: email,
//           password: password
//       );
//
//       // save user info into a separate doc if the user does not exist
//       firebaseFirestore.collection("Users").doc(userCredential.user!.uid).set(
//           {
//             "uid": userCredential.user!.uid,
//             "email": email
//           }
//       );
//       return userCredential;
//     }on FirebaseAuthException catch(e){
//       throw Exception(e.code);
//     }
//   }
//
//   //Sign up method
//   Future<UserCredential> signUpWithEmailAndPassword(String email, String password) async{
//     try{
//       UserCredential userCredential = await auth.createUserWithEmailAndPassword(
//           email: email,
//           password: password
//       );
//       // save user info into a separate doc
//       firebaseFirestore.collection("Users").doc(userCredential.user!.uid).set(
//           {
//             "uid": userCredential.user!.uid,
//             "email": email
//           }
//       );
//       return userCredential;
//     }on FirebaseAuthException catch(e){
//       throw Exception(e.code);
//     }
//   }
//
//
//   //Sign out method
//   Future<void> signOut() async{
//     await auth.signOut();
//   }
// }