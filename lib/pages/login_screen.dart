import 'package:chat_application/constants.dart';
import 'package:chat_application/pages/register_page.dart';
import 'package:chat_application/widgets/custom_button.dart';
import 'package:chat_application/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/show_snack_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  bool _isObscure = true;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          Container(
            color: kPrimaryColor,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: kPrimaryColorWhite,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ModalProgressHUD(
                    inAsyncCall: isLoading,
                    child: Form(
                      key: formKey,
                      child: ListView(
                        children: [
                          Text(
                            'Your email',
                            style: TextStyle(
                              color: kPrimaryColorGrey,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            obscureText: false,
                            onChanged: (String data) {
                              email = data;
                            },
                            hintText: 'Email',
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'password',
                            style: TextStyle(color: kPrimaryColorGrey),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            obscureText: _isObscure,
                            suffix: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                            onChanged: (data) {
                              password = data;
                            },
                            hintText: 'Password',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                'Forget password?',
                                style: TextStyle(
                                  color: kPrimaryColorGrey,
                                ),
                              ),
                            ],
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
                                  await loginUser();
                                  showSnackBar(context, 'Success');
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    print('No user found for that email.');
                                    showSnackBar(context,
                                        'No user found for that email.');
                                  } else if (e.code == 'wrong-password') {
                                    print(
                                        'Wrong password provided for that user.');
                                    showSnackBar(context,
                                        'Wrong password provided for that user.');
                                  }
                                } catch (e) {
                                  print(e);
                                  showSnackBar(
                                      context, 'errorrrrrrrrrrrrrrrrr');
                                }
                                isLoading = false;
                                setState(() {});
                              } else {
                                // showSnackBar(context, 'not found');
                              }
                            },
                            text: 'Log In',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'dont have an account?',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: kPrimaryColorGrey,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  try {
                                    Navigator.pushNamed(
                                        context, RegisterPage.id);
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: kPrimaryColorBlue,
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
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
//GestureDetector(
                  //   onTap: () {
                  //     Navigator.push(context, MaterialPageRoute(
                  //       builder: (context) {
                  //         return RegisterPage();
                  //       },
                  //     ));
                  //   },
                  //   child: Text(
                  //     'Register',
                  //     style: TextStyle(
                  //       fontSize: 13,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
//  in class(register) ==>>>>> String id = 'RegisterPage';
//Navigator.pushNamed(context, RegisterPage().id);