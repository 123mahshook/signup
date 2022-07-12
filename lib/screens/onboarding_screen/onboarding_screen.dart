import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signup/screens/common/clippers/footer_button_clipper.dart';
import 'package:signup/screens/common/clippers/triangle_clipper.dart';
import 'package:signup/utility/ui/common/common_navigate.dart';
import 'package:signup/utility/ui/components/footer_button.dart';
import 'package:signup/utility/ui/values/app_colors.dart';
import 'package:signup/utility/ui/values/font_utils.dart';
import 'package:signup/utility/ui/values/size_utils.dart';
import 'package:signup/utility/ui/values/utils.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
          height: SizeUtils.getScreenHeight(),
          width: SizeUtils.getScreenWidth(),
          padding: EdgeInsets.only(bottom: SizeUtils.getHeight(24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipPath(
                clipper: TriAngleClipper(),
                child: Container(
                  height: SizeUtils.getHeight(335),
                  width: SizeUtils.getScreenWidth(),
                  child: Image.asset(
                    // Utils.getAssetPng("img_onboard"),
                    Utils.getAssetJpg("img_onboard"),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: SizeUtils.getWidth(24),
                  right: SizeUtils.getWidth(24),
                ),
                child: Text(
                  "Money does not quit",
                  //"All money is a matter of belief.",
                  style:
                      FontUtils.get64SplashFont(color: AppColors.primaryColor),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: SizeUtils.getWidth(24),
                  right: SizeUtils.getWidth(24),
                ),
                child: Text(
                  "Every day is a chance\nto become better",
                  style: FontUtils.getFont24Style(
                      color: AppColors.black, fontWeight: FontWeight.w500),
                ),
              ),
              verticalSpace(20),
              Padding(
                padding: EdgeInsets.only(
                  left: SizeUtils.getWidth(24),
                  right: SizeUtils.getWidth(24),
                ),
                child: Text(
                  "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat.",
                  style: FontUtils.getFont12Style(
                      color: AppColors.onboardGrey,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  left: SizeUtils.getWidth(24),
                  right: SizeUtils.getWidth(24),
                ),
                child: FooterButton(
                    label: "GET STARTED",
                    onTap: () {
                      CommonNavigate(parentContext: context)
                          .navigateLoginScreen();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
