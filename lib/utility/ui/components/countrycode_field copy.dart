import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signup/utility/ui/components/custom_textfield.dart';
import 'package:signup/utility/ui/values/app_colors.dart';
import 'package:signup/utility/ui/values/font_utils.dart';
import 'package:signup/utility/ui/values/size_utils.dart';
import 'package:signup/utility/ui/values/utils.dart';

class CountryCodeField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? dialcode;
  final Function? validator;
  final Function(Country)? onChanged;
  const CountryCodeField(
      {Key? key,
      this.controller,
      this.validator,
      required this.label,
      this.onChanged,
      this.dialcode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return //Stack(children: [
        CustomTextField(
      //prefix: countryCodePicker(),

      label: label,

      controller: controller,
      readOnly: true,
      validator: validator,
      suffix: Padding(
        padding: EdgeInsets.only(right: SizeUtils.getWidth(10)),
        child: SvgPicture.asset(
          Utils.getAssetSvg("ic_downArrow"),
          color: AppColors.onboardGrey,
        ),
      ),
      onTap: () {
        showCountryPicker(
          context: context,
          countryListTheme: CountryListThemeData(
            flagSize: SizeUtils.getWidth(18),

            backgroundColor: AppColors.veryLightGrey,
            textStyle: FontUtils.getFont14Style(
              color: AppColors.onboardGrey,
              fontWeight: FontWeight.w500,
            ),

            //Optional. Sets the border radius for the bottomsheet.
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(SizeUtils.getWidth(0)),
              topRight: Radius.circular(SizeUtils.getWidth(0)),
            ),
            //Optional. Styles the search field.
            inputDecoration: InputDecoration(
              labelText: 'Search',
              hintText: 'Start typing to search',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:
                    BorderSide(color: AppColors.primaryColor.withOpacity(0.3)),
              ),
            ),
          ),
          showPhoneCode:
              true, // optional. Shows phone code before the country name.
          onSelect: onChanged ??
              (Country country) {
                //print('Select country: ${country.displayName}');
                controller!.text = "+" + country.phoneCode;
                FocusScope.of(context).requestFocus(new FocusNode());
              },
        );
      },
    ) /*,
      countryCodePicker()
    ])*/
        ;
  }

  Widget countryCodePicker() {
    //controller!.text = "+91";
    return CountryCodePicker(
      onChanged: (value) {
        controller!.text = value.toString();
      },
      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
      initialSelection: dialcode == "" ? dialcode : '+91',
      showFlag: false,
      //favorite: ['+39', 'FR'],
      // optional. Shows only country name and flag
      showCountryOnly: false,
      showDropDownButton: true,
      // optional. Shows only country name and flag when popup is closed.
      showOnlyCountryWhenClosed: true,
      // optional. aligns the flag and the Text left
      alignLeft: false,
      textStyle: FontUtils.getFont14Style(
          color: AppColors.onboardGrey, fontWeight: FontWeight.w600),
    );
  }
}
