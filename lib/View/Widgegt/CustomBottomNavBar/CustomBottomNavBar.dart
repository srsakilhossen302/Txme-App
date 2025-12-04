import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:txme_app/Utils/AppColors/app_colors.dart';
import 'package:txme_app/core/App_Routes/app_routes.dart';


class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomNavBar({super.key, required this.selectedIndex});

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Get.toNamed(AppRoute.homepage);
        break;
      case 1:
        //Get.offNamed(Routes.BOOKINGS_PAGE);
        break;
      case 2:
        //Get.offNamed(Routes.MESSAGE_PAGE);
        break;
      case 3:
        //Get.offNamed(Routes.PROFILE_PAGE);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, -2),
          )
        ],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.home_outlined, "Home", 0),
          _navItem(Icons.sticky_note_2_outlined, "Bookings", 1),
          _navItem(Icons.message_outlined, "Message", 2),
          _navItem(Icons.person_outline, "Profile", 3),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    final bool isActive = selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 26,
            color: isActive ? Color(0xffFF5A36) : AppColors.gray,
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? Color(0xffFF5A36) :AppColors.gray,
              fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
