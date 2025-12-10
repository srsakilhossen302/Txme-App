import 'package:get/get.dart';

class ProfileController extends GetxController {
  var userName = "Mahram".obs;
  var rating = 4.5.obs;

  void logout() {
    // এখানে API / SharedPrefs / Token Delete করতে পারো
  }
}
