

import 'package:flutter/material.dart';

class CustomGestureDetectoreButton extends StatelessWidget {
  const CustomGestureDetectoreButton({
    required this.onTap,
    required this.child,
    super.key,
    required this.isLoadin,
  });

  final bool isLoadin;
  final Function onTap;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: child,
    );
  }
}