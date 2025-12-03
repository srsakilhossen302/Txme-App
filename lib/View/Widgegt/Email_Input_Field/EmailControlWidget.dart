//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class EmailControlWidget extends StatefulWidget {
//   @override
//   _EmailControlWidgetState createState() => _EmailControlWidgetState();
// }
//
// class _EmailControlWidgetState extends State<EmailControlWidget> {
//   final TextEditingController _controller = TextEditingController();
//   String _email = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _controller.addListener(_updateEmail);
//   }
//
//   @override
//   void dispose() {
//     _controller.removeListener(_updateEmail);
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _updateEmail() {
//     setState(() {
//       _email = _controller.text;
//     });
//   }
//
//   void _submit() {
//     if (_email.isNotEmpty && _email.contains('@')) {
//       print('Email Submitted: $_email');
//     } else {
//       print('Please enter a valid email');
//     }
//   }
// }