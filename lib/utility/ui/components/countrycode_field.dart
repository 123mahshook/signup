/*import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:signup/utility/ui/components/custom_textfield.dart';
import 'package:signup/utility/ui/values/app_colors.dart';
import 'package:signup/utility/ui/values/font_utils.dart';

class CountryCodeField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;

  final Function? validator;
  const CountryCodeField(
      {Key? key, this.controller, this.validator, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      prefix: countryCodePicker(),
      label: label,
      controller: controller,
      validator: validator,
    );
  }

  Widget countryCodePicker() {
    return CountryCodePicker(
      onChanged: (value) {
        controller!.text = value.toString();
      },
      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
      initialSelection: 'IN',
      showFlag: false,
      //favorite: ['+39', 'FR'],
      // optional. Shows only country name and flag
      showCountryOnly: false,
      showDropDownButton: true,
      // optional. Shows only country name and flag when popup is closed.
      showOnlyCountryWhenClosed: true,
      // optional. aligns the flag and the Text left
      alignLeft: false,
      textStyle: FontUtils.getFont18Style(
          color: AppColors.onboardGrey, fontWeight: FontWeight.w600),
    );
  }
}*/
