import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constants.dart';
import '../helper/show_snack_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

GlobalKey<FormState> formKey = GlobalKey();

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? password;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  Image.asset(
                    'assets/images/scholar.png',
                    height: 150,
                  ),
                  const Text(
                    'Scholar chat',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontFamily: 'pacifico',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    onChanged: (String data) {
                      email = data;
                    },
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    onChanged: (data) {
                      password = data;
                    },
                    hintText: 'Password',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await registerUser();
                          showSnackBar(context, 'Success');
                          Navigator.pop(context);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showSnackBar(context, 'weak password');
                          } else if (e.code == 'email-already-in-use') {
                            showSnackBar(context, 'amail is already exsist');
                          }
                        } catch (e) {
                          showSnackBar(context, 'errorrrrrrrrrrrrrrrrr');
                        }
                        isLoading = false;
                        setState(() {});
                      } else {}
                    },
                    text: 'Register',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'don\'t have an account?',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'login',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
