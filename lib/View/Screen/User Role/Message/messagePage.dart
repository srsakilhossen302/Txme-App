
import 'package:flutter/material.dart';

import '../../../Widgegt/CustomBottomNavBar/CustomBottomNavBar.dart';

class Messagepage extends StatefulWidget {
  const Messagepage({super.key});

  @override
  State<Messagepage> createState() => _MessagepageState();
}

class _MessagepageState extends State<Messagepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("fsdjhdfhj")
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 2),
    );
  }
}
