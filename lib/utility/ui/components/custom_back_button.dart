import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signup/utility/ui/values/app_colors.dart';
import 'package:signup/utility/ui/values/size_utils.dart';
import 'package:signup/utility/ui/values/utils.dart';

class CustomBackButton extends StatefulWidget {
  const CustomBackButton({Key? key, this.backgroundColor, this.onTap})
      : super(key: key);
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  _CustomBackButtonState createState() => _CustomBackButtonState();
}

class _CustomBackButtonState extends State<CustomBackButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeUtils.getHeight(30),
      width: SizeUtils.getHeight(30),
      child: TextButton(
          style: TextButton.styleFrom(
            alignment: Alignment.center,
            primary: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SizeUtils.getRadius(5)),
            ),
            padding: EdgeInsets.all(0),
            backgroundColor: AppColors.titleGrey,
          ),
          onPressed: widget.onTap ??
              () {
                Navigator.pop(context);
              },
          child: SvgPicture.asset(
            Utils.getAssetSvg("ic_backArrow"),
            height: SizeUtils.getHeight(10),
          )),
    );
  }
}
