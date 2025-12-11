import 'package:flutter/material.dart';
import 'package:txme_app/Utils/AppImg/app_img.dart';

class CustomLogoutPopup extends StatelessWidget {
  const CustomLogoutPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Close icon
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close, size: 22),
              ),
            ),

            const SizedBox(height: 10),

            // Image
            Image.asset(
             AppImg.LogoutV,
              height: 90,
            ),

            const SizedBox(height: 15),

            // Title
            const Text(
              "Logout",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 8),

            // Subtitle
            const Text(
              "Are you sure to logout?",
              style: TextStyle(
                fontSize: 13,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 25),

            // Logout button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // TODO: Add logout function
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF5A36),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  "Logout",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Cancel button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFFF5A36), width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFFFF5A36),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}