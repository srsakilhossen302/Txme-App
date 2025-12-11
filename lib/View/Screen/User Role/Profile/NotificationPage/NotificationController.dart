import 'package:get/get.dart';

class NotificationController extends GetxController {
  var generalNotification = false.obs;
  var soundNotification = true.obs;
  var vibrateNotification = true.obs;

  void toggleGeneral() => generalNotification.value = !generalNotification.value;
  void toggleSound() => soundNotification.value = !soundNotification.value;
  void toggleVibrate() => vibrateNotification.value = !vibrateNotification.value;
}
