import 'package:chat_application/auth_pages/login_screen.dart';
import 'package:chat_application/auth_pages/sign_up_screen.dart';
import 'package:chat_application/dialoge_screen.dart';
import 'package:chat_application/home_screen.dart';
import 'package:chat_application/onboarding_pages.dart/first_time_onboarding.dart';
import 'package:chat_application/onboarding_pages.dart/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScholarApp());
}

class ScholarApp extends StatelessWidget {
  const ScholarApp({super.key});
//Please reload window to activate Language Support for Java.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
      // routes: {
      //   'LoginPage': (context) => const LoginPage(),
      //   RegisterPage.id: (context) => const RegisterPage(),

      // },
      // debugShowCheckedModeBanner: false,
      // initialRoute: const SignInWithGoogleScreen(),
    );
  }
}
