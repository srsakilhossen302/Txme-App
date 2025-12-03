import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:txme_app/core/App_Routes/app_routes.dart';

import '../../../../../Utils/AppColors/app_colors.dart';
import '../../../../../Utils/AppIcons/app_icons.dart';
import '../../../../../Utils/StaticString/static_string.dart';
import '../../../../Widgegt/Custom_Button/custom_button.dart';

class VerifyFaceId extends StatefulWidget {
  const VerifyFaceId({super.key});

  @override
  State<VerifyFaceId> createState() => _VerifyFaceIdState();
}

class _VerifyFaceIdState extends State<VerifyFaceId> {
  CameraController? cameraController;
  bool isCameraInitialized = false;
  late FaceDetector faceDetector;

  double faceProgress = 0.0;

  @override
  void initState() {
    super.initState();
    initCamera();
    faceDetector = FaceDetector(
      options: FaceDetectorOptions(
        enableContours: false,
        enableClassification: false,
      ),
    );
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
      (e) => e.lensDirection == CameraLensDirection.front,
    );

    cameraController = CameraController(
      frontCamera,
      ResolutionPreset.medium,
      enableAudio: false,
    );

    await cameraController!.initialize();
    cameraController!.startImageStream(processCameraImage);

    setState(() => isCameraInitialized = true);
  }

  /// PROCESS CAMERA FRAME → NEW INPUTIMAGE API (NO ERROR)
  Future<void> processCameraImage(CameraImage image) async {
    final WriteBuffer allBytes = WriteBuffer();

    for (Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }

    final bytes = allBytes.done().buffer.asUint8List();

    final Size imageSize = Size(
      image.width.toDouble(),
      image.height.toDouble(),
    );

    final InputImageRotation imageRotation = InputImageRotation.rotation0deg;

    final InputImageFormat inputImageFormat =
        InputImageFormatValue.fromRawValue(image.format.raw) ??
        InputImageFormat.nv21;

    /// NEW METADATA (latest API)
    final InputImageMetadata metadata = InputImageMetadata(
      size: imageSize,
      rotation: imageRotation,
      format: inputImageFormat,
      bytesPerRow: image.planes[0].bytesPerRow,
    );

    /// Create InputImage (NO OLD API)
    final inputImage = InputImage.fromBytes(bytes: bytes, metadata: metadata);

    final faces = await faceDetector.processImage(inputImage);

    if (faces.isNotEmpty) {
      final face = faces.first;

      double area = face.boundingBox.width * face.boundingBox.height;

      double progress = (area / 70000).clamp(0, 1);

      setState(() => faceProgress = progress);

      if (progress >= 1) {
        print("FACE VERIFIED!");
      }
    }
  }

  @override
  void dispose() {
    cameraController?.dispose();
    faceDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          if (isCameraInitialized)
            CameraPreview(cameraController!)
          else
            const Center(child: CircularProgressIndicator(color: Colors.white)),

          /// Animated detection circle
          Container(
            width: 280.w,
            height: 280.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.blueAccent.withOpacity(0.8),
                width: 6.w,
              ),
            ),
            child: CircularProgressIndicator(
              value: faceProgress,
              strokeWidth: 4.w,
              valueColor: AlwaysStoppedAnimation(Colors.lightBlueAccent),
              backgroundColor: Colors.transparent,
            ),
          ),

          Positioned(
            bottom: 130.h,
            left: 20.w,
            right: 20.w,
            child: CustomButton(
              height: 55.h,
              width: 353.w,
              BoxDecoration: BoxDecoration(
                color: AppColors.red601,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppIcons.faceIdScan,
                    color: AppColors.FFFFFF,
                    height: 22.h,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    AppString.authenticateFaceID,
                    style: TextStyle(
                      color: AppColors.FFFFFF,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Get.toNamed(AppRoute.faceverificationdone);
              },
            ),
          ),
        ],
      ),
    );
  }
}
