import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final double height;
  final double width;
  final Decoration? BoxDecoration;
  final Widget? child;
  final void Function()? onTap;



  const CustomButton({
    super.key,
    required this.height,
    required this.width,
    required this.BoxDecoration,
    required this.child,
    required this.onTap,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration,
        child: child,
      ),
    );
  }
}
