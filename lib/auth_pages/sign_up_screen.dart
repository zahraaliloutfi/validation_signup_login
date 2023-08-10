import 'package:chat_application/auth_pages/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constants.dart';
import '../auth_helper/show_snack_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static String id = 'SignUpPage';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

GlobalKey<FormState> formKey = GlobalKey();

class _SignUpPageState extends State<SignUpPage> {
  String? email;
  bool _isObscure = true;
  bool _isObscureIcon = true;
  String? password;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Column(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                color: kPrimaryColor,
                height: 120,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign Up',
                        // textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        ' Enter your details below & free sign up',
                        style: TextStyle(
                          fontSize: 10,
                          color: kPrimaryColorGrey,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: kPrimaryColorWhite,
                      borderRadius: BorderRadius.circular(17)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: formKey,
                        child: ListView(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Your email',
                              style: TextStyle(
                                color: kPrimaryColorGrey,
                              ),
                            ),
                            const SizedBox(
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
                              height: 20,
                            ),
                            const Text(
                              'password',
                              style: TextStyle(color: kPrimaryColorGrey),
                            ),
                            const SizedBox(
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
                            CustomButton(
                              backGroundColor: kPrimaryColorBlue,
                              height: 50,
                              fontSize: 19,
                              textColor: kPrimaryColorWhite,
                              outColor: kPrimaryColorBlue,
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
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      showSnackBar(
                                          context, 'email is already exsist');
                                    }
                                  } catch (e) {
                                    showSnackBar(
                                        context, 'errorrrrrrrrrrrrrrrrr');
                                  }
                                  isLoading = false;
                                  setState(() {});
                                } else {}
                              },
                              text: 'Sign Up',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                IconButton(
                                    icon: Icon(
                                      _isObscureIcon
                                          ? Icons.check_box
                                          : Icons.check_box_outline_blank,
                                      color: kPrimaryColorGrey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObscureIcon = !_isObscureIcon;
                                      });
                                    }),
                                const Text(
                                  """By creating an account you have to agree
      with our them & condication.""",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: kPrimaryColorGrey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'don\'t have an account ? ',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: kPrimaryColorGrey,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginPage(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'log in',
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
            ],
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
