import 'package:flutter/material.dart';

class OtpBoxes extends StatelessWidget {
  final int length;

  const OtpBoxes({super.key, this.length = 6});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: 45,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xffACCCF2), // Light blue border like your image
              width: 2,
            ),
          ),
          // child: const Center(
          //   child: Text(
          //     "|", // The cursor-like line
          //     style: TextStyle(
          //       color: Colors.grey,
          //       fontSize: 22,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
        );
      }),
    );
  }
}
