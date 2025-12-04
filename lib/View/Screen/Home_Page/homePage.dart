import 'package:flutter/material.dart';

import '../../Widgegt/CustomBottomNavBar/CustomBottomNavBar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
      ),
      body: Center(
        child: Text(
          "<<<<<<<<<<<<<<<<<<========================>>>>>>>>>>>>>>>>>",
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 0),
    );
  }
}
