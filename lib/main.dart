import 'package:chat_application/pages/login_screen.dart';
import 'package:chat_application/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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
    return const MaterialApp(
      home: RegisterPage(),
      // routes: {
      //   'LoginPage': (context) => const LoginPage(),
      //   RegisterPage.id: (context) => const RegisterPage(),

      // },
      // debugShowCheckedModeBanner: false,
      // initialRoute: const SignInWithGoogleScreen(),
    );
  }
}
