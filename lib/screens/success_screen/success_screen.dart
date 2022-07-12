import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:signup/utility/ui/common/common_navigate.dart';
import 'package:signup/utility/ui/components/footer_button.dart';
import 'package:signup/utility/ui/providers/google_sign_in_provider.dart';
import 'package:signup/utility/ui/values/app_colors.dart';
import 'package:signup/utility/ui/values/font_utils.dart';
import 'package:signup/utility/ui/values/size_utils.dart';
import 'package:signup/utility/ui/values/utils.dart';

class SuccessScreen extends StatefulWidget {
  final String? data;
  const SuccessScreen({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  final player = AudioPlayer();

  playAudio() async {
    try {
      await player.setAsset(Utils.getAssetAudio("success"));
      await player.play();
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();

    playAudio();
    // setMusic();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: AppColors.green,
          statusBarIconBrightness: Brightness.light),
    );
  }

  /*setMusic() async {
    //await player.setAsset(Utils.getAssetAudio("success"));
    //await player.play();
    //await player.seek(Duration(seconds: 20));
    //await player.pause();
  }*/

  @override
  void dispose() {
    // TODO: implement dispose
    player.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userData = FirebaseAuth.instance.currentUser!;
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
                statusBarColor: AppColors.white,
                statusBarIconBrightness: Brightness.dark),
          );
          Navigator.pop(context);
          return false;
        },
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: Container(
            height: SizeUtils.getScreenHeight(),
            width: SizeUtils.getScreenWidth(),
            child: Column(children: [
              // Spacer(),
              titleCard(),
              //review(),
              streamDt(userData),
              Spacer(),
              //footerButton(),
            ]),
          ),
        ),
      ),
    );
  }

  /*Widget footerButton() {
    return Padding(
      padding: EdgeInsets.only(
        bottom: SizeUtils.getHeight(24),
        left: SizeUtils.getWidth(24),
        right: SizeUtils.getWidth(24),
      ),
      child: FooterButton(
          label: "BACK TO HOME",
          onTap: () {
            Navigator.popUntil(context, (route) => route.isFirst);
            CommonNavigate(parentContext: context).navigateHomeScreen();
          }),
    );
  }*/

  Widget titleCard() {
    return SizedBox(
      // height: SizeUtils.getHeight(220),
      width: SizeUtils.getScreenWidth(),
      child: /*Stack(children: [*/
          Container(
        color: AppColors.green,
        // height: SizeUtils.getHeight(220),
        width: SizeUtils.getScreenWidth(),
        child: Column(
          children: [
            verticalSpace(50),
            /* Image.asset(
              Utils.getAssetPng("img_success"),
              height: SizeUtils.getHeight(72),
            ),*/
            Lottie.asset(Utils.getAssetLottie("success"),
                repeat: false, height: SizeUtils.getHeight(96)),
            verticalSpace(21),
            Text(
              widget.data ?? "Account Opened Succefully",
              style: FontUtils.getFont10Style(
                  color: AppColors.white, fontWeight: FontWeight.w700),
            ),
            //const Spacer(),
            verticalSpace(20),
            Text(
              "SUCCESS",
              style: FontUtils.get64Title(
                  color: AppColors.white, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),

      /*Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: SizeUtils.getHeight(20),
            width: SizeUtils.getScreenWidth(),
            color: AppColors.white,
          ),
        )
      ]),*/
    );
  }

  Widget streamDt(User user) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text(
              "Somthing Went Wrong",
              style: FontUtils.getFont10Style(
                  color: AppColors.white, fontWeight: FontWeight.w700),
            );
          } else if (snapshot.hasData) {
            return profileCard(user.photoURL!, user.displayName!, user.email!);
          } else {
            return profileCard("", "", "");
          }
        });
  }

  Widget profileCard(
    String image,
    String name,
    String mail,
  ) {
    return Container(
      padding: EdgeInsets.only(
          top: SizeUtils.getHeight(24),
          left: SizeUtils.getWidth(24),
          right: SizeUtils.getWidth(24)),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(24),
          Text(
            "PROFILE",
            style: FontUtils.getFont24bStyle(
                color: AppColors.onboardGrey.withOpacity(0.5),
                fontWeight: FontWeight.w600),
          ),
          verticalSpace(24),
          Center(
            child: Container(
                height: SizeUtils.getHeight(100),
                width: SizeUtils.getHeight(100),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius:
                        BorderRadius.circular(SizeUtils.getRadius(18))),
                child: profileImage(image //viewModel.image
                    )),
          ),
          verticalSpace(14),
          Container(
            padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
            width: SizeUtils.getScreenWidth(),
            alignment: Alignment.center,
            child: Text(
              name,
              maxLines: 1,
              style: FontUtils.getFont16Style(
                  color: AppColors.onboardGrey, fontWeight: FontWeight.w500),
            ),
          ),
          verticalSpace(4),
          Container(
            padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
            width: SizeUtils.getScreenWidth(),
            alignment: Alignment.center,
            child: Text(
              //"(208) 555-0112",
              mail,
              maxLines: 1,
              style: FontUtils.getFont12Style(
                  color: AppColors.onboardGrey, fontWeight: FontWeight.w500),
            ),
          ),
          verticalSpace(12),
          Center(
            child: SizedBox(
              height: SizeUtils.getHeight(24),
              width: SizeUtils.getHeight(100),
              child: TextButton(
                style: TextButton.styleFrom(
                  alignment: Alignment.center,
                  primary: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    //side: BorderSide(color: AppColors.BORDER_GREY),
                    borderRadius: BorderRadius.circular(SizeUtils.getRadius(4)),
                  ),
                  padding: const EdgeInsets.all(0),
                  backgroundColor: AppColors.transparent,
                ),
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout(context);
                },
                child: Text(
                  "Logout",
                  style: FontUtils.getFont12Style(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          verticalSpace(12),
          verticalSpace(24),
        ],
      ),
    );
  }

  Widget profileImage(String img) {
    String imgUr = img;

    /*String imgUr =
        "https://raw.githubusercontent.com/Mahshook-cookee/Images/main/placeholder.png";*/
    return img != "" && img.isNotEmpty
        ? CachedNetworkImage(
            errorWidget: (context, url, error) => Image.asset(
                  Utils.getAssetPng("placeholder"),
                  fit: BoxFit.cover,
                ),
            placeholder: (context, url) => Image.asset(
                  Utils.getAssetPng("placeholder"),
                  fit: BoxFit.cover,
                ),
            fit: BoxFit.cover,
            imageUrl: imgUr)
        : Image.asset(
            Utils.getAssetPng("placeholder"),
            fit: BoxFit.cover,
          );
  }

  /*Widget review() {
    return Container(
      padding: EdgeInsets.only(
        top: SizeUtils.getHeight(24),
        left: SizeUtils.getWidth(24),
        right: SizeUtils.getWidth(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Personal Information",
            style: FontUtils.getFont14Style(
                color: AppColors.onboardGrey, fontWeight: FontWeight.w500),
          ),
          verticalSpace(22),
          Row(
            children: [
              Text(
                "Full Name",
                style: FontUtils.getFont12Style(
                    color: AppColors.black, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Container(
                width: SizeUtils.getWidth(180),
                alignment: Alignment.centerRight,
                child: Text(
                  "Brooklyn Simmons",
                  maxLines: 1,
                  style: FontUtils.getFont12Style(
                      color: AppColors.onboardGrey,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          verticalSpace(7),
          Row(
            children: [
              Text(
                "Phone Number",
                style: FontUtils.getFont12Style(
                    color: AppColors.black, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Container(
                width: SizeUtils.getWidth(180),
                alignment: Alignment.centerRight,
                child: Text(
                  "(219) 555-0114",
                  maxLines: 1,
                  style: FontUtils.getFont12Style(
                      color: AppColors.onboardGrey,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          verticalSpace(7),
          /*
          Row(
            children: [
              Text(
                "Whatsapp Number",
                style: FontUtils.getFont12Style(
                    color: AppColors.black, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Container(
                width: SizeUtils.getWidth(180),
                alignment: Alignment.centerRight,
                child: Text(
                  "(302) 555-0107",
                  maxLines: 1,
                  style: FontUtils.getFont12Style(
                      color: AppColors.onboardGrey,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),*/
          verticalSpace(24),
          Text(
            "Measurements Details",
            style: FontUtils.getFont14Style(
                color: AppColors.onboardGrey, fontWeight: FontWeight.w500),
          ),
          verticalSpace(20),
          Row(
            children: [
              Text(
                "Height",
                style: FontUtils.getFont12Style(
                    color: AppColors.black, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Container(
                width: SizeUtils.getWidth(180),
                alignment: Alignment.centerRight,
                child: Text(
                  "175 cm",
                  maxLines: 1,
                  style: FontUtils.getFont12Style(
                      color: AppColors.onboardGrey,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          verticalSpace(7),
          Row(
            children: [
              Text(
                "Weight",
                style: FontUtils.getFont12Style(
                    color: AppColors.black, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Container(
                width: SizeUtils.getWidth(180),
                alignment: Alignment.centerRight,
                child: Text(
                  "87 kg",
                  maxLines: 1,
                  style: FontUtils.getFont12Style(
                      color: AppColors.onboardGrey,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          verticalSpace(7),
          Row(
            children: [
              Text(
                "Thighs",
                style: FontUtils.getFont12Style(
                    color: AppColors.black, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Container(
                width: SizeUtils.getWidth(180),
                alignment: Alignment.centerRight,
                child: Text(
                  "42 in",
                  maxLines: 1,
                  style: FontUtils.getFont12Style(
                      color: AppColors.onboardGrey,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          verticalSpace(7),
          Row(
            children: [
              Text(
                "Waist",
                style: FontUtils.getFont12Style(
                    color: AppColors.black, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Container(
                width: SizeUtils.getWidth(180),
                alignment: Alignment.centerRight,
                child: Text(
                  "42 cm",
                  maxLines: 1,
                  style: FontUtils.getFont12Style(
                      color: AppColors.onboardGrey,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          verticalSpace(7),
          Row(
            children: [
              Text(
                "Hip",
                style: FontUtils.getFont12Style(
                    color: AppColors.black, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Container(
                width: SizeUtils.getWidth(180),
                alignment: Alignment.centerRight,
                child: Text(
                  "42 in",
                  maxLines: 1,
                  style: FontUtils.getFont12Style(
                      color: AppColors.onboardGrey,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          verticalSpace(7),
          Row(
            children: [
              Text(
                "Arms",
                style: FontUtils.getFont12Style(
                    color: AppColors.black, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Container(
                width: SizeUtils.getWidth(180),
                alignment: Alignment.centerRight,
                child: Text(
                  "42 cm",
                  maxLines: 1,
                  style: FontUtils.getFont12Style(
                      color: AppColors.onboardGrey,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }*/
}
