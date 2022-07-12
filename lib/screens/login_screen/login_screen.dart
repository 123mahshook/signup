import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:signup/screens/common/clippers/triangle_clipper.dart';
import 'package:signup/utility/ui/common/common_navigate.dart';
import 'package:signup/utility/ui/components/custom_circular_loader.dart';
import 'package:signup/utility/ui/components/custom_textfield.dart';
import 'package:signup/utility/ui/components/footer_button.dart';
import 'package:signup/utility/ui/providers/google_sign_in_provider.dart';
import 'package:signup/utility/ui/values/app_colors.dart';
import 'package:signup/utility/ui/values/font_utils.dart';
import 'package:signup/utility/ui/values/form_validators.dart';
import 'package:signup/utility/ui/values/no_glow_scroll_behaviour.dart';
import 'package:signup/utility/ui/values/size_utils.dart';
import 'package:signup/utility/ui/values/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneNumberController = TextEditingController();
  final _passwodController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    _phoneNumberController.dispose();
    _passwodController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        //statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ScrollConfiguration(
            behavior: NoGlowScrollBehaviour(),
            child: Container(
              color: AppColors.white,
              height: SizeUtils.getScreenHeight(),
              width: SizeUtils.getScreenWidth(),
              child: SingleChildScrollView(
                reverse: true,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipPath(
                        clipper: TriAngleClipper(),
                        child: Container(
                          height: SizeUtils.getHeight(335),
                          width: SizeUtils.getScreenWidth(),
                          child: Image.asset(
                            // Utils.getAssetPng("img_login"),
                            Utils.getAssetJpg("img_login"),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                      verticalSpace(18),

                      Padding(
                        padding: EdgeInsets.only(
                            left: SizeUtils.getWidth(24),
                            right: SizeUtils.getWidth(24),
                            bottom: SizeUtils.getHeight(24)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Login to your account",
                              style: FontUtils.get64SplashFont(
                                  color: AppColors.primaryColor),
                            ),
                            verticalSpace(8),
                            Text(
                              "If future generations are to remember us more with gratitude than sorrow, we must achieve more than just the miracles of technology. We must also leave them a glimpse of the world as it was created, not just as it looked when we got through with it.",
                              style: FontUtils.getFont12Style(
                                  color: AppColors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.w500),
                            ),
                            verticalSpace(100),
                            /*Text(
                              "Phone Number",
                              style: FontUtils.getFont12Style(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            CustomTextField(
                              label: "Phone Number",
                              controller: _phoneNumberController,
                              // maxLength: 10,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                return TextFieldValidation.emptyValidate(value);
                              },
                            ),
                            verticalSpace(14),
                            Text(
                              "Password",
                              style: FontUtils.getFont12Style(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            CustomTextField(
                              label: "Password",
                              controller: _passwodController,
                              obscureText: true,
                              validator: (value) {
                                return TextFieldValidation.emptyValidate(value);
                              },
                            ),*/
                            verticalSpace(8),
                            _footerButton()
                          ],
                        ),
                      ),
                      //const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _footerButton() {
    return FooterButton(
      label: "LOGIN",
      icon: true,
      onTap: () {
        final provider =
            Provider.of<GoogleSignInProvider>(context, listen: false);
        provider.googleLogin(context);
        /* if (_formKey.currentState!.validate()) {
                    viewModel.makeAuth(
                        _phoneNumberController.text, _passwodController.text);
                  }*/
      },
    );
  }
}
