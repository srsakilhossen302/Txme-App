import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import 'package:txme_app/Utils/StaticString/static_string.dart';

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
        title: Row(
          children: [
            Text(AppString.Welcome, style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 24.sp
            ),),
            Text(AppString.Oliver, style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700
            ),)
          ],
        ),
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
