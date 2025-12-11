import 'package:get/get.dart';

class VerificationController extends GetxController {
  // Verification statuses
  var emailStatus = "Verified".obs;
  var mobileStatus = "Verified".obs;
  var idStatus = "Verified".obs;
  var addressStatus = "Verified".obs;

  // Update any status (optional)
  void updateStatus(String type, String status) {
    switch (type) {
      case "email":
        emailStatus.value = status;
        break;
      case "mobile":
        mobileStatus.value = status;
        break;
      case "id":
        idStatus.value = status;
        break;
      case "address":
        addressStatus.value = status;
        break;
    }
  }
}
