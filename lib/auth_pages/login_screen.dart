import 'package:chat_application/constants.dart';
import 'package:chat_application/auth_pages/sign_up_screen.dart';
import 'package:chat_application/onboarding_pages.dart/on_boarding_screen.dart';
import 'package:chat_application/validation_logic.dart/facebook_login.dart';
import 'package:chat_application/validation_logic.dart/google_login_in.dart';
import 'package:chat_application/widgets/custom_button.dart';
import 'package:chat_application/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../auth_helper/show_snack_bar.dart';
import '../widgets/custom_gesture _detector.dart';

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
  bool isLoadin = true;
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  // GoogleLogIn google = GoogleLogIn();
  // FacebookLogIn facebook = FacebookLogIn();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Column(
          children: [
            Container(
              alignment: AlignmentDirectional.bottomStart,
              color: kPrimaryColor,
              height: 120,
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
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
                decoration: BoxDecoration(
                    color: kPrimaryColorWhite,
                    borderRadius: BorderRadius.circular(17)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ModalProgressHUD(
                      inAsyncCall: isLoading,
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
                              height: 30,
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
                                  icon: Icon(
                                    _isObscure
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: kPrimaryColorblack,
                                  ),
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
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
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
                              outColor: kPrimaryColorBlue,
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
                              backGroundColor: kPrimaryColorBlue,
                              fontSize: 19,
                              height: 50,
                              textColor: kPrimaryColorWhite,
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
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignUpPage(),
                                        ),
                                      );
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
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    width: 100,
                                    color: kPrimaryColorGrey,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Or login with',
                                  style: TextStyle(color: kPrimaryColorGrey),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    width: 100,
                                    color: kPrimaryColorGrey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomGestureDetectoreButton(
                                  isLoadin: isLoadin,
                                  onTap: () => () async {
                                    try {
                                      await const GoogleLogIn()
                                          .signInWithGoogle();

                                      print('success');
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  OnBoardingScreen()));
                                    } catch (e) {
                                      print('errrrrrrrrrrrrrrrrrror is $e');
                                    }
                                    // setState(() {
                                    //   isLoadin = false;
                                    // });
                                  },
                                  child: const CircleAvatar(
                                    backgroundImage:
                                        AssetImage(authGoogleImage),
                                    radius: 25.0,
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                CustomGestureDetectoreButton(
                                    onTap: () => () async {
                                          try {
                                            await const FacebookLogIn()
                                                .signInWithFacebook();

                                            print('success');
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        OnBoardingScreen()));
                                          } catch (e) {
                                            print(
                                                'errrrrrrrrrrrrrrrrrror is $e');
                                          }
                                          // setState(() {
                                          //   isLoadin = false;
                                          // });
                                        },
                                    isLoadin: isLoadin,
                                    child: const CircleAvatar(
                                      backgroundImage:
                                          AssetImage(authFacebookImage),
                                      radius: 20.0,
                                    )),
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