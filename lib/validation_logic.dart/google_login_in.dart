import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../auth_pages/sign_up_screen.dart';

class GoogleLogIn extends StatelessWidget {
  const GoogleLogIn({super.key});
  static String id = 'googlelogin';
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              onPressed: () async {
                try {
                  await signInWithGoogle();
                  Navigator.pushNamed(context, SignUpPage.id);
                } catch (e) {
                  print('errrrrrrrrrrrrrrrrrror is $e');
                }
              },
              child: const Text("sign-in"),
            ),
          ),
        ],
      ),
    );
  }
}
