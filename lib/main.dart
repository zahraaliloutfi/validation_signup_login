import 'package:chat_application/busness_card.dart';
import 'package:chat_application/pages/login_screen.dart';
import 'package:chat_application/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScholarApp());
}

class ScholarApp extends StatelessWidget {
  const ScholarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'LoginPage': (context) => const LoginPage(),
                'bunesscard': (context) =>  BusnessCardApp(),
        RegisterPage.id: (context) =>  RegisterPage(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: 'LoginPage',
    );
  }
}
