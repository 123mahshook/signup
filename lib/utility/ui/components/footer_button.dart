import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:signup/screens/common/clippers/footer_button_clipper.dart';
import 'package:signup/utility/ui/values/app_colors.dart';
import 'package:signup/utility/ui/values/font_utils.dart';
import 'package:signup/utility/ui/values/size_utils.dart';
import 'package:signup/utility/ui/values/utils.dart';

class FooterButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  final Color? color;
  final bool? icon;

  const FooterButton(
      {Key? key,
      required this.label,
      required this.onTap,
      this.color,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: FooterButtonClipper(),
      child: SizedBox(
        height: SizeUtils.getHeight(56),
        width: SizeUtils.getScreenWidth(),
        child: icon == null
            ? ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: AppColors.black,
                  onPrimary: color ?? AppColors.black,
                  elevation: 0,
                  primary: AppColors.primaryColor,
                ),
                onPressed: onTap,
                child: Text(
                  label,
                  style: FontUtils.getFont14Style(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ))
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: AppColors.black,
                  onPrimary: color ?? AppColors.black,
                  elevation: 0,
                  primary: AppColors.primaryColor,
                ),
                onPressed: onTap,
                child: Row(
                  children: [
                    Spacer(),
                    FaIcon(
                      FontAwesomeIcons.google,
                      color: AppColors.red,
                    ),
                    horizontalSpace(12),
                    Text(
                      label,
                      style: FontUtils.getFont14Style(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Spacer(),
                  ],
                )),
      ),
    );
  }
}
