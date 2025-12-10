
import 'package:flutter/material.dart';

import '../../../Widgegt/CustomBottomNavBar/CustomBottomNavBar.dart';

class Bookingspage extends StatefulWidget {
  const Bookingspage({super.key});

  @override
  State<Bookingspage> createState() => _BookingspageState();
}

class _BookingspageState extends State<Bookingspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("dfsjkjkfdkjdf")
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 1),
    );
  }
}
