import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../View/Screen/Choose_Language/choose_language.dart';
import '../../View/Screen/Sign-in/Sign-in-with-Biometrics/Enter_email/enter_email.dart';
import '../../View/Screen/Sign-in/Sign-in-with-Biometrics/SignInWithBiometrics.dart';
import '../../View/Screen/Sign-in/Sign-in-with-Biometrics/Verify-Fingerprint/verifyFingerprint.dart';
import '../../View/Screen/Sign-in/Sign-in-with-Biometrics/VerifyFaceID/Face_Verification_Done/faceVerificationDone.dart';
import '../../View/Screen/Sign-in/Sign-in-with-Biometrics/VerifyFaceID/VerifyfaceidID.dart';
import '../../View/Screen/Sign-in/Sign-in-with-Biometrics/VerifyFaceID/verifyFaceID.dart';
import '../../View/Screen/Sign_As_Screen/sign_as_screen.dart';

class AppRoute {
  ///==================== Initial Routes ====================///
  static const String chooseLanguage = "/chooseLanguage";
  static const String signAsScreen = "/signAsScreen";
  static const String signinwithbiometrics = "/signinwithbiometrics";
  static const String verifyfingerprint = "/verifyfingerprint";
  static const String enterEmail = "/enterEmail";
  static const String verifyfaceid = "/verifyfaceid";
  static const String verifyFaceId = "/verifyFaceId";
  static const String faceverificationdone = "/faceverificationdone";


  static List<GetPage> routes = [
    ///==================== Authentication  Routes ====================///

    GetPage(name: chooseLanguage, page: () => const ChooseLanguage()),
    GetPage(name: signAsScreen, page: () => const SignAsScreen()),
    GetPage(name: signinwithbiometrics, page: () => const Signinwithbiometrics()),
    GetPage(name: verifyfingerprint, page: () => const Verifyfingerprint()),
    GetPage(name: enterEmail, page: () => const EnterEmail()),
    GetPage(name: verifyfaceid, page: () => const Verifyfaceid()),
    GetPage(name: verifyFaceId, page: () => const VerifyFaceId()),
    GetPage(name: faceverificationdone, page: () => const Faceverificationdone()),






  ];
}