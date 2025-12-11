
import 'package:flutter/material.dart';
import 'package:txme_app/Utils/AppImg/app_img.dart';

import '../../../../Widgegt/CustomBottomNavBar/CustomBottomNavBar.dart';


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





        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 1),
    );
  }
}
