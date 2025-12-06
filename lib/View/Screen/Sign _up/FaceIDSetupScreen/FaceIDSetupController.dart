import 'package:get/get.dart';

class FaceIDSetupController extends GetxController {
  // Step indicator
  var currentStep = 1.obs;  // Track current step (Registration or FaceID)

  // Function to update the current step
  void updateStep(int step) {
    currentStep.value = step;
  }
}
