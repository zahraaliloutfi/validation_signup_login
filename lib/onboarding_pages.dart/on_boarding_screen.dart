import 'package:chat_application/auth_pages/login_screen.dart';
import 'package:chat_application/auth_pages/sign_up_screen.dart';
import 'package:chat_application/constants.dart';
import 'package:chat_application/home_screen.dart';
import 'package:chat_application/onboarding_pages.dart/onboarding4.dart';
import 'package:chat_application/widgets/custom_button.dart';
import 'package:chat_application/widgets/custum_on_bourding_container.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPage = 0;

  final controller = LiquidController();

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      OnBoardingContainer(
          customButton1: Container(),
          customButton2: Container(),
          image: onBoardingimage1,
          text1: 'Numerous free',
          text2: 'trial courses',
          text3: 'Free courses for you to',
          text4: 'find your way to learning',
          text5: '',
          index: 1,
          onPressed: () {
            int nextPage = controller.currentPage + 1;
            controller.animateToPage(page: nextPage);
          }),
      OnBoardingContainer(
        customButton1: Container(),
        customButton2: Container(),
        image: 'assets/images/onboarding_images/image2.jpg',
        text1: 'Quick and easy ',
        text2: 'learning',
        text3: 'Easy and fast learning at',
        text4: 'any time to help you ',
        text5: 'improve various skills',
        index: 2,
        onPressed: () => controller.jumpToPage(page: 2),
      ),

      OnBoardingContainer(
        customButton1: CustomButton(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpPage(),
                ));
          },
          text: 'Sing Up',
          backGroundColor: kPrimaryColorBlue,
          textColor: kPrimaryColorWhite,
          height: 50,
          width: 150,
          outColor: kPrimaryColorBlue,
        ),
        customButton2: CustomButton(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
          },
          text: 'Log In',
          backGroundColor: kPrimaryColorWhite,
          textColor: kPrimaryColorBlue,
          height: 50,
          width: 150,
          outColor: kPrimaryColorBlue,
        ),
        image: onBoardingimage5,
        text1: 'Create your own ',
        text2: 'learning study plan',
        text3: 'Study according to the',
        text4: 'study plan, make study',
        text5: 'more motivated',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreeen(),
            ),
          );
        },
      ),

      // OnBoardingContainer(
      //   image: onBoardingimage1,
      //   index: 0,
      //   onPressed: () {},
      //   text1: '',
      //   text2: '',
      //   text3: '',
      //   text4: '',
      //   text5: '',
      // ),
      onBoarding4(),
    ];
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            LiquidSwipe(
              onPageChangeCallback: OnPageChangeCallback,
              pages: pages,
              liquidController: controller,
              // slideIconWidget: Icon(Icons.arrow_back_ios),
              // enableSideReveal: true,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedSmoothIndicator(
                      activeIndex: controller.currentPage,
                      count: 4,
                      effect: const WormEffect(
                        dotColor: kPrimaryColor,
                        activeDotColor: kPrimaryColorBlue,
                        dotHeight: 5,
                        dotWidth: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  OnPageChangeCallback(int activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
  }
}
