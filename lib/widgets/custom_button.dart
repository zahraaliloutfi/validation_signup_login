import 'package:chat_application/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String? text;
  VoidCallback? onTap;
  CustomButton(
      {required this.text,
      this.onTap,
      this.backGroundColor,
      this.textColor,
      this.width,
      this.height,
      required this.outColor,
      this.fontSize,
      this.fontWeight});
  double? fontSize = 19;
  dynamic fontWeight;
  Color? backGroundColor;
  Color? textColor;
  double? width = double.infinity;
  double? height;
  Color outColor = kPrimaryColorBlue;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        child: Positioned(
          top: 50,
          child: Container(
            decoration: BoxDecoration(
              color: backGroundColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: outColor,
                width: 1,
              ),
            ),
            child: Center(
              child: Text(
                '$text',
                style: TextStyle(
                  fontWeight: fontWeight,
                  fontSize: fontSize,
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
      ),
      // child: Container(
      //   // width: MediaQuery.of(context).size.width / 2,
      //   // height: MediaQuery.of(context).size.height / 2,
      //   height: height,
      //   width: width,
      //   decoration: BoxDecoration(
      //     color: backGroundColor,
      //     borderRadius: BorderRadius.circular(10),
      //   ),
      //   child: Center(
      //     child: Padding(
      //       padding: const EdgeInsets.all(10),
      //       child: Text(
      //         '$text',
      //         style: TextStyle(
      //           fontSize: 15,
      //           color: textColor,
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}


// Center(
//             child: Container(
//               height: 100,
//               width: 200,
//               padding: EdgeInsets.all(10),
//               child: Positioned(
//                 top: 50,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     shape: BoxShape.rectangle,
//                     borderRadius: BorderRadius.circular(12),
//                     color: Colors.white,
//                     border: Border.all(
//                       color: Colors.black,
//                       width: 1,
//                     ),
//                   ),
//                   child: Text('text'),
//                 ),
//               ),
//             ),