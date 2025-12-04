import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../View/Screen/Choose_Language/choose_language.dart';
import '../../View/Screen/Home_Page/homePage.dart';
import '../../View/Screen/Sign _up/Create_Account/CreateAccount.dart';
import '../../View/Screen/Sign _up/Sign_Up_Email/Sign_up_Email.dart';
import '../../View/Screen/Sign _up/Sign_Up_Phone/Sign_Up_Phone.dart';
import '../../View/Screen/Sign _up/Verifyotppage/Verifyotppage.dart';
import '../../View/Screen/Sign-in/Sign-in-with-Biometrics/Enter_email/enter_email.dart';
import '../../View/Screen/Sign-in/Sign-in-with-Biometrics/SignInWithBiometrics.dart';
import '../../View/Screen/Sign-in/Sign-in-with-Biometrics/Verify-Fingerprint/verifyFingerprint.dart';
import '../../View/Screen/Sign-in/Sign-in-with-Biometrics/VerifyFaceID/Face_Verification_Done/faceVerificationDone.dart';
import '../../View/Screen/Sign-in/Sign-in-with-Biometrics/VerifyFaceID/VerifyfaceidID.dart';
import '../../View/Screen/Sign-in/Sign-in-with-Biometrics/VerifyFaceID/verifyFaceID.dart';
import '../../View/Screen/Sign-in/Verify_OTP_Page/verifyOTPPage.dart';
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
  static const String verifyotppage = "/verifyotppage";
  static const String homepage = "/homepage";
  static const String signUpEmail = "/signUpEmail";
  static const String verifyotppageS = "/verifyotppageS";
  static const String signUpPhone = "/signUpPhone";
  static const String createaccount = "/createaccount";


  static List<GetPage> routes = [
    ///==================== Authentication  Routes ====================///

    GetPage(name: chooseLanguage, page: () => const ChooseLanguage()),
    GetPage(name: signAsScreen, page: () => const SignAsScreen()),
    GetPage(name: signinwithbiometrics, page: () => const SigninWithBiometrics()),
    GetPage(name: verifyfingerprint, page: () => const Verifyfingerprint()),
    GetPage(name: enterEmail, page: () => const EnterEmail()),
    GetPage(name: verifyfaceid, page: () => const Verifyfaceid()),
    GetPage(name: verifyFaceId, page: () => const VerifyFaceId()),
    GetPage(name: faceverificationdone, page: () => const Faceverificationdone()),
    GetPage(name: verifyotppage, page: () => const Verifyotppage()),
    GetPage(name: homepage, page: () => const Homepage()),
    GetPage(name: signUpEmail, page: () => const SignUpEmail()),
    GetPage(name: verifyotppageS, page: () => const VerifyotppageS()),
    GetPage(name: signUpPhone, page: () => const SignUpPhone()),
    GetPage(name: createaccount, page: () =>  CreateAccountScreen()),






  ];
}