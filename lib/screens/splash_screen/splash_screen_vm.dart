import 'package:firebase_auth/firebase_auth.dart';
import 'package:signup/app/contracts/base_view_model.dart';
import 'package:signup/app/repositeries/preference/app_preference_repo.dart';
import 'package:signup/app/services/auth/check_auth_service.dart';
import 'package:signup/core/models/api_models/api_action_status_message.dart';
import 'package:signup/core/repositeries/preference/preference_repo.dart';
import 'package:signup/utility/ui/common/common_navigate.dart';

class SplashScreenVM extends BaseViewModel {
  //final _pushNotificationService = PushNotificationService();
  //String _firebaseToken = "";
  // final _fcmService = FcmService();
  //final userData = FirebaseAuth.instance.currentUser!;
  @override
  void dispose() {
    // TODO: implement dispose
  }

  SplashScreenVM() {
    //initialiseNotification();
    //checkAuth();
  }

  checkAuth() async {
    /*if (userData.email != null) {
      CommonNavigate(parentContext: parentContext!).navigateSuccessScreen();
    } else {
      CommonNavigate(parentContext: parentContext!).navigateOnboardingScreen();
    }*/
    /*if (await AppPreferenceRepo().getVisitedData()) {
      ApiActionStatusMessageModel stat = await CheckAuthService().check();
      if (stat.status!) {
        if (stat.actionStatus!) {
          //_initialiseNotification();
          CommonNavigate(parentContext: parentContext!).navigateHomeScreen();
        } else {
          CommonNavigate(parentContext: parentContext!).navigateLoginScreen();
        }
      } else {
        CommonNavigate(parentContext: parentContext!).navigateLoginScreen();
      }
    } else {
      await AppPreferenceRepo().setVisitedData();
      //  await Future.delayed(Duration(seconds: 3));
      CommonNavigate(parentContext: parentContext!).navigateOnboardingScreen();
    }*/
  }

  /*_initialiseNotification() async {
    try {
      _fcmService.initialize();
    } catch (_) {}
  }*/
}
