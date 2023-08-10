import 'package:flutter/material.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import '../constants.dart';

class OnBoardingContainer extends StatelessWidget {
  OnBoardingContainer(
      {super.key,
      this.image,
      this.text1,
      this.text2,
      this.text3,
      this.text5,
      this.text4,
      this.index,
      this.onPressed,
      required this.customButton1,
      required this.customButton2});
  String? image;
  final String? text1;
  final String? text2;
  final String? text3;
  final String? text4;
  final String? text5;
  Widget customButton1;
  Widget customButton2;
  final int? index;
  VoidCallback? onPressed;
  LiquidController? controller = LiquidController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: kPrimaryColorWhite,
      child: Column(
        children: [
          Container(
            child: Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: onPressed,
                    child: const Text(
                      'Skip',
                      style: TextStyle(color: kPrimaryColorGrey),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Image.asset(
              image!,
              height: size.height * 0.5,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Text(
                  text1!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 19,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    text2!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 19,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    text3!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: kPrimaryColorGrey,
                    ),
                  ),
                ),
                Text(
                  text4!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: kPrimaryColorGrey,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  text5!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: kPrimaryColorGrey,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(child: customButton1),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(child: customButton2!),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
