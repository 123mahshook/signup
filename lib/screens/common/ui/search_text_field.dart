import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:signup/utility/ui/values/app_colors.dart';
import 'package:signup/utility/ui/values/font_utils.dart';
import 'package:signup/utility/ui/values/size_utils.dart';
import 'package:signup/utility/ui/values/utils.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField(
      {Key? key,
      this.controller,
      this.onSubmitData,
      this.onChanged,
      this.onFieldSubmitted,
      this.hint = "Search Name / Mobile Number",
      this.autofocus = true})
      : super(key: key);
  final double _buttonSize = 15;
  final TextEditingController? controller;
  final String? hint;
  final bool autofocus;
  final Function(String)? onSubmitData;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: SizeUtils.getHeight(55),
      child: TextFormField(
        autofocus: autofocus,
        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: _searchIcon(),
          prefixIconConstraints: BoxConstraints(
            maxHeight: SizeUtils.getHeight(_buttonSize),
            maxWidth: SizeUtils.getHeight(_buttonSize + 20),
            minHeight: SizeUtils.getHeight(_buttonSize),
            minWidth: SizeUtils.getHeight(_buttonSize + 20),
          ),

          // isDense: true,
          contentPadding: EdgeInsets.symmetric(
              horizontal: SizeUtils.getWidth(10),
              vertical: SizeUtils.getHeight(18)),
          fillColor: AppColors.white,
          filled: true,
          hintText: hint,
          hintStyle: FontUtils.getFont12Style(
              color: AppColors.onboardGrey, fontWeight: FontWeight.w500),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _searchIcon() => SvgPicture.asset(
        Utils.getAssetSvg("ic_search"),
        // height: SizeUtils.getHeight(14.5),
        // width: SizeUtils.getHeight(12),
      );
}
