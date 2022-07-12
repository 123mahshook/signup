import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signup/utility/ui/values/utils.dart';

class DividerLine extends StatelessWidget {
  const DividerLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Utils.getAssetSvg("ic_dividerLine"),
      fit: BoxFit.cover,
    );
    /*Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        26,
        (_) => Container(
          width: SizeUtils.getWidth(5),
          height: SizeUtils.getHeight(1.1),
          color: AppColors.onboardGrey.withOpacity(0.1),
          margin: EdgeInsets.only(
              left: SizeUtils.getHeight(3), right: SizeUtils.getHeight(3)),
        ),
      ),
    );*/
  }
}
