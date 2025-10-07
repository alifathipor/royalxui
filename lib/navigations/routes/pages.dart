import 'package:get/get.dart';
import 'package:royalxui/navigations/bindings/auth_bindings.dart';
import 'package:royalxui/navigations/bindings/home_bindings.dart';
import 'package:royalxui/navigations/bindings/onboarding_screen_bindings.dart';
import 'package:royalxui/navigations/bindings/settings_bindings.dart';
import 'package:royalxui/navigations/bindings/splash_screen_bindings.dart';
import 'package:royalxui/pages/auth/auth_sc.dart';
import 'package:royalxui/pages/main/home/home_sc.dart';
import 'package:royalxui/pages/main/settings/settings_sc.dart';
import 'package:royalxui/pages/onboarding/onboarding_sc.dart';
import 'package:royalxui/pages/splashScreen/splash_screen_sc.dart';
import 'package:royalxui/toolkit.dart' as t;

class Pages {
  static final routes = [
    GetPage(
      name: t.Routes.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: t.Routes.onBoardingScreen,
      page: () => const OnBoardingScreen(),
      binding: OnBoardingBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: t.Routes.authScreen,
      page: () => const AuthScreen(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: t.Routes.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
     GetPage(
      name: t.Routes.settingsScreen,
      page: () => const SettingsScreen(),
      binding: SettingsBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
