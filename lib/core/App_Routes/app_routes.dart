import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../View/Screen/Choose_Language/LanguagePage.dart';
import '../../View/Screen/Service Provider Role/HomePage/ProviderHomeScreen.dart';
import '../../View/Screen/Service Provider Role/Provider Profile/ProviderProfile.dart';
import '../../View/Screen/Sign _up/Create_Account/CreateAccount.dart';
import '../../View/Screen/Sign _up/FaceIDSetupScreen/FaceIDSetupScreen.dart';
import '../../View/Screen/Sign _up/FaceIDSetupScreen/FaceIDSetupScreen2.dart';
import '../../View/Screen/Sign _up/FaceIDSetupScreen/SignUpDone.dart';
import '../../View/Screen/Sign _up/Sign_Up_Email/Sign_up_Email.dart';
import '../../View/Screen/Sign _up/Sign_Up_Phone/Sign_Up_Phone.dart';
import '../../View/Screen/Sign _up/VerifyYourIdentity/UploadDocuments1.dart';
import '../../View/Screen/Sign _up/VerifyYourIdentity/UploadDocuments2.dart';
import '../../View/Screen/Sign _up/VerifyYourIdentity/VerifyYourIdentity.dart';
import '../../View/Screen/Sign _up/Verifyotppage/Verifyotppage.dart';
import '../../View/Screen/Sign-in/Sign-in-with-Biometrics/Enter_email/enter_email.dart';
import '../../View/Screen/Sign-in/Sign-in-with-Biometrics/SignInWithBiometrics.dart';
import '../../View/Screen/Sign-in/Sign-in-with-Biometrics/Verify-Fingerprint/verifyFingerprint.dart';
import '../../View/Screen/Sign-in/Sign-in-with-Biometrics/VerifyFaceID/Face_Verification_Done/faceVerificationDone.dart';
import '../../View/Screen/Sign-in/Sign-in-with-Biometrics/VerifyFaceID/VerifyfaceidID.dart';
import '../../View/Screen/Sign-in/Sign-in-with-Biometrics/VerifyFaceID/verifyFaceID.dart';
import '../../View/Screen/Sign-in/Verify_OTP_Page/verifyOTPPage.dart';
import '../../View/Screen/Sign_As_Screen/sign_as_screen.dart';
import '../../View/Screen/User Role/BookingsViewClient/Bookings/bookingsPage.dart';
import '../../View/Screen/User Role/Home_Page/AppoinmentScreen/AppoinmentScreen.dart';
import '../../View/Screen/User Role/Home_Page/ElectricianProviders/ElectricianProviders.dart' show WorkerCard, Electricianproviders;
import '../../View/Screen/User Role/Home_Page/NotificationPage/NotificationPage.dart';
import '../../View/Screen/User Role/Home_Page/Popularservices/Popularservices.dart';
import '../../View/Screen/User Role/Home_Page/SearchFilter/SearchFilter.dart';
import '../../View/Screen/User Role/Home_Page/homePage.dart';
import '../../View/Screen/User Role/Message/messagePage.dart';
import '../../View/Screen/User Role/Profile/MyProfile.dart';

class AppRoute {
  ///==================== Initial Routes ====================///
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
  static const String faceIDSetupScreen = "/faceIDSetupScreen";
  static const String faceIDSetupScreen2 = "/faceIDSetupScreen2";
  static const String signupdone = "/signupdone";
  static const String verifyyouridentity = "/verifyyouridentity";
  static const String uploaddocuments1 = "/uploaddocuments1";
  static const String uploaddocuments2 = "/uploaddocuments2";
  static const String searchfilter = "/searchfilter";
  static const String languagepage = "/languagepage";
  static const String electricianproviders = "/electricianproviders";
  static const String popularservices = "/popularservices";
  static const String notificationPage = "/notificationPage";
  static const String appointmentsPage = "/appointmentsPage";
  static const String profilePage = "/profilePage";
  static const String messagepage = "/messagepage";
  static const String bookingspage = "/bookingspage";
  static const String providerProfilePage = "/providerProfilePage";
  static const String providerHomeScreen = "/providerHomeScreen";



  static List<GetPage> routes = [
    ///==================== Authentication  Routes ====================///

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
    GetPage(name: faceIDSetupScreen, page: () =>  FaceIDSetupScreen()),
    GetPage(name: faceIDSetupScreen2, page: () =>  FaceIDSetupScreen2()),
    GetPage(name: signupdone, page: () =>  Signupdone()),
    GetPage(name: verifyyouridentity, page: () =>  Verifyyouridentity()),
    GetPage(name: uploaddocuments1, page: () =>  Uploaddocuments1()),
    GetPage(name: uploaddocuments2, page: () =>  Uploaddocuments2()),
    GetPage(name: searchfilter, page: () =>  Searchfilter()),
    GetPage(name: searchfilter, page: () =>  Searchfilter()),
    GetPage(name: languagepage, page: () =>  Languagepage()),
    GetPage(name: electricianproviders, page: () =>  Electricianproviders()),
    GetPage(name: popularservices, page: () =>  Popularservices()),
    GetPage(name: notificationPage, page: () =>  NotificationPage()),
    GetPage(name: appointmentsPage, page: () =>  AppointmentsPage()),
    GetPage(name: profilePage, page: () =>  ProfilePage()),
    GetPage(name: messagepage, page: () =>  Messagepage()),
    GetPage(name: bookingspage, page: () =>  Bookingspage()),
    GetPage(name: providerProfilePage, page: () =>  ProviderProfilePage()),
    GetPage(name: providerHomeScreen, page: () =>  ProviderHomeScreen()),








  ];
}