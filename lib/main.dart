import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Language/translator.dart';
import 'View/Screen/splashScreen/splash_screen_view.dart';
import 'core/App_Routes/app_routes.dart';
import 'core/dependency_injection/dependencies.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  /// GetX dependencies initialized here
  dependencies.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale("en", "US"),
        fallbackLocale: const Locale('en', 'US'),
        translations: Language(),
        defaultTransition: Transition.fadeIn,
        getPages: AppRoute.routes,
        home: const SplashScreenView(),
      ),
    );
  }
}
