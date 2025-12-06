import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';  // If you're using GetX for navigation
import 'package:txme_app/Utils/AppColors/app_colors.dart';
import 'package:txme_app/Utils/StaticString/static_string.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/App_Routes/app_routes.dart';
import '../../../Widgegt/Custom_Button/custom_button.dart';

class Uploaddocuments2 extends StatefulWidget {
  const Uploaddocuments2({super.key});

  @override
  State<Uploaddocuments2> createState() => _Uploaddocuments2State();
}

class _Uploaddocuments2State extends State<Uploaddocuments2> {
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  XFile? _imageFile;
  bool _isCameraInitialized = false;

  // Initialize camera
  Future<void> _initializeCamera() async {
    // Check and request permission
    await Permission.camera.request();

    // Check if permission is granted
    if (await Permission.camera.isGranted) {
      // Get available cameras
      _cameras = await availableCameras();

      // Initialize the camera controller with the first available camera
      _cameraController = CameraController(_cameras[0], ResolutionPreset.medium);
      await _cameraController.initialize();
      setState(() {
        _isCameraInitialized = true;
      });
    } else {
      // Handle permission denied
      print("Camera permission denied");
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeCamera();  // Initialize camera
  }

  @override
  void dispose() {
    _cameraController.dispose();  // Dispose camera controller
    super.dispose();
  }

  // Take a picture
  Future<void> _takePicture() async {
    // Ensure camera is initialized before taking a picture
    if (!_isCameraInitialized) {
      print("Camera is not initialized yet.");
      return;
    }

    try {
      XFile file = await _cameraController.takePicture();
      setState(() {
        _imageFile = file;  // Store the image file
      });
    } catch (e) {
      print("Error capturing image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_sharp),
        ),
        title: Text(AppString.Identity),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),  // Use ScreenUtil for padding
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 11.w, right: 130.w),
              child: Text(
                AppString.UploadPassportFront.tr,
                style: TextStyle(
                  color: AppColors.black700,
                  fontSize: 14.sp,  // Use ScreenUtil for font size
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 10.h),

            // Passport Front Upload Button (Camera Icon)
            GestureDetector(
              onTap: () {
                if (_isCameraInitialized) {
                  _takePicture();  // Trigger camera to take a picture
                }
              },
              child: Container(
                width: 353.w,
                height: 95.h,
                decoration: BoxDecoration(
                  color: Color(0xffF7F7F7),
                  borderRadius: BorderRadius.circular(8.r), // Rounded corners
                ),
                child: _imageFile == null  // If no image, show camera icon
                    ? Icon(
                  Icons.camera_alt_outlined,
                  size: 50.sp,  // Use ScreenUtil for icon size
                )
                    : Image.file(File(_imageFile!.path)),  // Show captured image
              ),
            ),
            SizedBox(height: 34.h),

            // Custom Upload Button
            CustomButton(
              height: 56.h,
              width: 353.w,
              BoxDecoration: BoxDecoration(
                color: AppColors.red601,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Text(
                  AppString.Upload,
                  style: TextStyle(
                    color: AppColors.FFFFFF,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,  // Use ScreenUtil for font size
                  ),
                ),
              ),
              onTap: () {
                Get.toNamed(AppRoute.verifyyouridentity);
              },
            ),
          ],
        ),
      ),
    );
  }
}
