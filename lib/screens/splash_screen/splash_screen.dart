import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signup/screens/splash_screen/splash_screen_vm.dart';
import 'package:signup/utility/ui/common/common_navigate.dart';
import 'package:signup/utility/ui/components/custom_circular_loader.dart';
import 'package:signup/utility/ui/values/app_colors.dart';
import 'package:signup/utility/ui/values/font_utils.dart';
import 'package:signup/utility/ui/values/size_utils.dart';
import 'package:signup/utility/ui/values/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenVM viewModel = SplashScreenVM();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: AppColors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light),
    );
    navigateonboarding();
    // WidgetsBinding.instance.addPostFrameCallback((_) => viewModel.checkAuth());
  }

  Future<void> navigateonboarding() async {
    await Future.delayed(const Duration(seconds: 3));
    CommonNavigate(parentContext: context).navigateOnboardingScreen();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // viewModel.setContext(context);

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        color: AppColors.primaryColor,
        child: SafeArea(
          child: Container(
            height: SizeUtils.getScreenHeight(),
            width: SizeUtils.getScreenWidth(),
            child: Column(
              children: [
                SizedBox(
                  height: SizeUtils.getHeight(364),
                  width: SizeUtils.getScreenWidth(),
                  child: Stack(children: [
                    Container(
                      height: SizeUtils.getHeight(364),
                      width: SizeUtils.getScreenWidth(),
                      child: Image.asset(
                        Utils.getAssetJpg("img_splash"),
                        // Utils.getAssetPng("img_splash"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: SizeUtils.getHeight(138),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              AppColors.primaryColor.withOpacity(0.1),
                              AppColors.primaryColor.withOpacity(0.3),
                              AppColors.primaryColor.withOpacity(0.5),
                              AppColors.primaryColor.withOpacity(0.8),
                              AppColors.primaryColor,
                            ])),
                      ),
                    )
                  ]),
                ),
                verticalSpace(50),
                Image.asset(
                  Utils.getAssetPng("logi"),
                  height: SizeUtils.getHeight(90),
                ),
                const Spacer(),
                CustomCircularLoader(
                  color: AppColors.loaderColor,
                ),
                verticalSpace(34),
                Text(
                  "Make yourself stronger\nthan your excuses.",
                  textAlign: TextAlign.center,
                  style: FontUtils.getFont14Style(
                      color: AppColors.splashLightBlue,
                      fontWeight: FontWeight.w700),
                ),
                verticalSpace(35)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
