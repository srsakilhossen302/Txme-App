import 'package:get/get.dart';
import '../../View/Screen/User Role/Profile/EditProfile/EditProfileController.dart';
import '../../View/Screen/User Role/Profile/NotificationPage/NotificationController.dart';
import '../../View/Screen/User Role/Profile/VerificationPage/VerificationController.dart';

class dependencies {
  static void init() {
    Get.put(EditProfileController(), permanent: true);
    Get.put(VerificationController(), permanent: true);
    Get.put(NotificationController(), permanent: true);
  }
}
