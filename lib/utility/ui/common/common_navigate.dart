import 'package:flutter/material.dart';
import 'package:signup/screens/login_screen/login_screen.dart';
import 'package:signup/screens/onboarding_screen/onboarding_screen.dart';
import 'package:signup/screens/splash_screen/splash_screen.dart';
import 'package:signup/screens/success_screen/success_screen.dart';
import 'package:signup/utility/ui/common/no_internet_dialog.dart';
import 'package:signup/utility/ui/common/server_error_dialog.dart';

class CommonNavigate {
  CommonNavigate({required this.parentContext});
  final BuildContext parentContext;

  navigateSplashScreen() {
    Navigator.pushReplacement(parentContext,
        MaterialPageRoute(builder: (context) => const SplashScreen()));
  }

  navigateOnboardingScreen() {
    Navigator.pushReplacement(
      parentContext,
      MaterialPageRoute(builder: (context) => const OnboardingScreen()),
    );
  }

  navigateLoginScreen() {
    Navigator.pushReplacement(
      parentContext,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  navigateSuccessScreen() {
    Navigator.pushReplacement(parentContext,
        MaterialPageRoute(builder: (context) => const SuccessScreen()));
  }

  navigateFreezeSuccessScreen() {
    Navigator.push(
        parentContext,
        MaterialPageRoute(
            builder: (context) => const SuccessScreen(
                  data: "Freezed membership successfully",
                )));
  }

  navigateRenewSuccessScreen() {
    Navigator.push(
        parentContext,
        MaterialPageRoute(
            builder: (context) => const SuccessScreen(
                  data: "Renew membership successfully",
                )));
  }

  navigateUnfreezeSuccessScreen() {
    Navigator.push(
        parentContext,
        MaterialPageRoute(
            builder: (context) => const SuccessScreen(
                  data: "Unfreezed membership successfully",
                )));
  }

  navigateServerError() {
    ServerErrorDialog(parentContext: parentContext).show();
  }

  navigateNoInternet() {
    NoInternetDialog(parentContext: parentContext).show();
  }
}
