import 'package:flutter/material.dart';

class CustomOtpFields extends StatefulWidget {
  final int length;       // OTP length
  final double size;      // box size
  final double spacing;   // gap between boxes

  const CustomOtpFields({
    super.key,
    this.length = 6,
    this.size = 50,
    this.spacing = 12,
  });

  @override
  State<CustomOtpFields> createState() => _CustomOtpFieldsState();
}

class _CustomOtpFieldsState extends State<CustomOtpFields> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(widget.length, (_) => TextEditingController());
    focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var c in controllers) c.dispose();
    for (var f in focusNodes) f.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.length, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.spacing / 2),
          child: Container(
            width: widget.size,
            height: widget.size,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,      // 🔵 ঠিক ছবির মতো নীল বর্ডার
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(10), // 🔵 ছবির মতো গোল কোণ
            ),
            child: TextField(
              controller: controllers[index],
              focusNode: focusNodes[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
              maxLength: 1,
              decoration: const InputDecoration(
                counterText: "",
                border: InputBorder.none,
              ),
              onChanged: (value) {
                if (value.isNotEmpty && index < widget.length - 1) {
                  focusNodes[index + 1].requestFocus();
                } else if (value.isEmpty && index > 0) {
                  focusNodes[index - 1].requestFocus();
                }
              },
            ),
          ),
        );
      }),
    );
  }
}
