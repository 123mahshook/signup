import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:signup/app/contracts/base_service.dart';
import 'package:flutter/material.dart';
import 'package:signup/utility/ui/common/common_navigate.dart';

class GoogleSignInProvider extends ChangeNotifier with BaseService {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  Future googleLogin(BuildContext context) async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
      CommonNavigate(parentContext: context).navigateSuccessScreen();
    } catch (e) {
      // TODO
      print(e);
    }
    notifyListeners();
  }

  Future logout(BuildContext context) async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    CommonNavigate(parentContext: context).navigateSplashScreen();
  }
}
