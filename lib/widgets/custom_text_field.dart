import 'package:chat_application/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String? hintText;
  Widget? suffix;
  bool obscureText;
  Function(String)? onChanged;
  CustomTextFormField(
      {super.key,
      this.onChanged,
      this.hintText,
      this.suffix,
      required this.obscureText});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: obscureText,
        // keyboardType: TextInputType.emailAddress,
        validator: (data) {
          if (data!.isEmpty) {
            return 'field if empty ';
          }
          return null;
          // else if (!EmailValidator.validate(data)) {
          //   return 'invalid';
          // }
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          suffixIcon: suffix,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryColorGrey,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColorGrey),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryColorGrey,
            ),
          ),
        ),
      ),
    );
  }
}
