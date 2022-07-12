import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signup/app/contracts/base_service.dart';
import 'package:signup/utility/ui/common/common_navigate.dart';
import 'package:signup/utility/ui/common/show_toast.dart';
import 'package:signup/utility/ui/components/custom_circular_loader.dart';
import 'package:signup/utility/ui/components/footer_button.dart';
import 'package:signup/utility/ui/values/app_colors.dart';
import 'package:signup/utility/ui/values/font_utils.dart';
import 'package:signup/utility/ui/values/size_utils.dart';
import 'package:signup/utility/ui/values/utils.dart';

class NoInternetDialog extends BaseService {
  final BuildContext parentContext;

  NoInternetDialog({required this.parentContext});

  double screenHeight = SizeUtils.getScreenHeight();
  double screenWidth = SizeUtils.getScreenWidth();
  bool _isLoading = false;

  show() {
    return showDialog(
        context: parentContext,
        useSafeArea: true,
        useRootNavigator: false,
        barrierDismissible: true,
        builder: (context) => WillPopScope(
              onWillPop: () async => false,
              child: StatefulBuilder(
                builder: (BuildContext parentContext, StateSetter setState) {
                  return SimpleDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      title: Text(
                        "No Internet",
                        style: FontUtils.getFont16Style(
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor),
                      ),
                      titlePadding: EdgeInsets.only(
                          top: screenHeight * .035,
                          left: screenWidth * .07,
                          right: screenWidth * .07),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: screenWidth * .07,
                          vertical: screenHeight * .03),
                      children: [
                        Column(
                          children: [
                            SvgPicture.asset(Utils.getAssetSvg("no_internet"),
                                height: screenHeight * .07),
                            SizedBox(height: screenHeight * .025),
                            Text(
                              "Please check your internet connection and retry",
                              textAlign: TextAlign.center,
                              style: FontUtils.getFont14Style(
                                  color: AppColors.black),
                            ),
                            SizedBox(height: screenHeight * .03),
                            _isLoading
                                ? CustomCircularLoader()
                                : FooterButton(
                                    label: "Retry",
                                    color: AppColors.primaryColor,
                                    onTap: () {
                                      _checkConnection(setState);
                                    },
                                  )
                          ],
                        )
                      ]);
                },
              ),
            ));
  }

  _checkConnection(StateSetter setState) async {
    setState(() {
      _isLoading = true;
    });
    bool res = await apiAppGeneralRepo.apiCoreRepo.apiCheckInternetConnection();

    setState(() {
      _isLoading = false;
    });
    if (res) {
      Navigator.popUntil(parentContext, (route) => route.isFirst);
      CommonNavigate(parentContext: parentContext).navigateSplashScreen();
    } else {
      ShowToast(
              title: "",
              message: "Please check your internet connection",
              parentContext: parentContext)
          .show();
    }
  }
}
