import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../View/Screen/Choose_Language/choose_language.dart';
import '../../View/Screen/Sign-in/Sign-in-with-Biometrics/SignInWithBiometrics.dart';
import '../../View/Screen/Sign_As_Screen/sign_as_screen.dart';

class AppRoute {
  ///==================== Initial Routes ====================///
  static const String chooseLanguage = "/chooseLanguage";
  static const String signAsScreen = "/signAsScreen";
  static const String signinwithbiometrics = "/signinwithbiometrics";


  static List<GetPage> routes = [
    ///==================== Authentication  Routes ====================///

    GetPage(name: chooseLanguage, page: () => const ChooseLanguage()),
    GetPage(name: signAsScreen, page: () => const SignAsScreen()),
    GetPage(name: signinwithbiometrics, page: () => const Signinwithbiometrics()),






  ];
}