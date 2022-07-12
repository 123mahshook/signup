import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signup/utility/ui/values/app_colors.dart';
import 'package:signup/utility/ui/values/font_utils.dart';
import 'package:signup/utility/ui/values/size_utils.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.label,
      this.controller,
      this.errorMessage,
      this.keyboardType,
      this.obscureText,
      this.textCapitalization,
      this.onTap,
      this.readOnly,
      this.maxLines,
      this.textInputAction,
      this.hint,
      this.autoFocus,
      this.enabled,
      this.maxLength,
      this.suffix,
      this.prefix,
      this.validator,
      this.inputFormatters,
      this.onChanged});
  final String label;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function? validator;
  final bool? obscureText;
  final String? errorMessage;
  final TextCapitalization? textCapitalization;
  final bool? readOnly;
  final Function? onTap;
  final int? maxLines;
  final bool? autoFocus;
  final String? hint;
  final TextInputAction? textInputAction;
  final bool? enabled;
  final int? maxLength;
  final Widget? suffix;
  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    double _buttonSize = 5;
    return Padding(
      padding: EdgeInsets.only(
          top: SizeUtils.getHeight(8), bottom: SizeUtils.getHeight(5)),
      child: TextFormField(
        readOnly: readOnly ?? false,
        enabled: enabled ?? true,
        textInputAction: textInputAction ?? TextInputAction.next,
        textCapitalization: textCapitalization ?? TextCapitalization.words,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: onChanged,
        inputFormatters: inputFormatters ?? [],
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
        validator: (value) {
          if (validator != null && !validator!(value)) {
            return errorMessage ??
                "Please enter a valid " + label.toLowerCase();
          }
          return null;
        },
        style: FontUtils.getFont14Style(
            color: AppColors.onboardGrey, fontWeight: FontWeight.w600),
        obscureText: obscureText ?? false,
        controller: controller,
        maxLines: maxLines ?? 1,
        maxLength: maxLength,
        obscuringCharacter: '*',
        keyboardType: keyboardType,
        cursorColor: AppColors.primaryColor,
        enableInteractiveSelection: true,
        decoration: InputDecoration(
            filled: true,
            isDense: true,
            counter: SizedBox(),
            fillColor: AppColors.textFieldFill,
            suffixIcon: suffix,
            prefixIcon: prefix,
            /*prefixIconConstraints: BoxConstraints(
              maxHeight: SizeUtils.getHeight(14),
              maxWidth: SizeUtils.getHeight(14 + 10),
              minHeight: SizeUtils.getHeight(14),
              minWidth: SizeUtils.getHeight(14 + 10),
            ),*/
            suffixIconConstraints: BoxConstraints(
              maxHeight: SizeUtils.getHeight(8),
              maxWidth: SizeUtils.getHeight(8 + 10),
              minHeight: SizeUtils.getHeight(8),
              minWidth: SizeUtils.getHeight(8 + 10),
            ),
            contentPadding: EdgeInsets.symmetric(
                vertical: SizeUtils.getHeight(15),
                horizontal: SizeUtils.getWidth(10)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide:
                  BorderSide(color: AppColors.primaryColor.withOpacity(0.3)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.red),
            ),
            border: InputBorder.none,
            /*OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: AppColors.BORDER_GREY),
            ),*/
            errorStyle: FontUtils.getFont10Style(color: Colors.red),
            enabledBorder: InputBorder.none,
            /*OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:
                    BorderSide(color: AppColors.black.withOpacity(0.3))),*/
            hintText: hint,
            // labelText: label,
            //labelStyle: TextStyle(color: AppColors.ONBORDING_TXT_COLOR),
            //floatingLabelBehavior: FloatingLabelBehavior.always,
            hintStyle: FontUtils.getFont14Style(
                fontWeight: FontWeight.w500,
                color: AppColors.onboardGrey.withOpacity(0.5))),
      ),
    );
  }
}
