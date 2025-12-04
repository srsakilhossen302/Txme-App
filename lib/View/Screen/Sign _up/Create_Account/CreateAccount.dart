// lib/screens/create_account_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'AccountController.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key});

  final AccountController c = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black54),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Create Account",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // প্রোফাইল পিক + ক্যামেরা
            GestureDetector(
              onTap: c.openCamera,
              child: Obx(() => Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.orange.shade400, width: 4),
                    ),
                  ),
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: c.profileImage.value != null
                          ? DecorationImage(
                        image: FileImage(c.profileImage.value!),
                        fit: BoxFit.cover,
                      )
                          : null,
                    ),
                    child: c.profileImage.value == null
                        ? Icon(Icons.camera_alt, size: 44, color: Colors.orange.shade600)
                        : null,
                  ),
                ],
              )),
            ),

            const SizedBox(height: 12),
            const Text(
              "Open Your Camera",
              style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 50),

            // Full Name
            const Align(
                alignment: Alignment.centerLeft,
                child: Text("Full Name*", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
            const SizedBox(height: 8),
            TextField(
              controller: c.nameController,
              decoration: InputDecoration(
                hintText: "Sadat Khan",
                hintStyle: TextStyle(color: Colors.grey.shade400),
                filled: true,
                fillColor: Colors.grey.shade50,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.orange.shade300)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.orange.shade300)),
              ),
            ),

            const SizedBox(height: 30),

            // Date of Birth
            const Align(
                alignment: Alignment.centerLeft,
                child: Text("Date of Birth", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
            const SizedBox(height: 8),
            TextField(
              controller: c.dobController,
              readOnly: true,
              onTap: c.selectDate,
              decoration: InputDecoration(
                hintText: "select your date of birth",
                hintStyle: TextStyle(color: Colors.grey.shade400),
                suffixIcon: const Icon(Icons.calendar_today, color: Colors.orange),
                filled: true,
                fillColor: Colors.grey.shade50,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.orange.shade300)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.orange.shade300)),
              ),
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}