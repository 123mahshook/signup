import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signup/utility/ui/values/app_colors.dart';
import 'package:signup/utility/ui/values/font_utils.dart';
import 'package:signup/utility/ui/values/size_utils.dart';
import 'package:signup/utility/ui/values/utils.dart';

class CustomDropDownField extends StatefulWidget {
  const CustomDropDownField(
      {Key? key,
      required this.label,
      required this.items,
      this.selectedItem,
      this.validator,
      this.dropdownValue})
      : super(key: key);
  final String label;
  final List<String> items;
  final String? dropdownValue;
  final Function(String)? selectedItem;
  final Function? validator;
  @override
  _CustomDropDownFieldState createState() => _CustomDropDownFieldState();
}

class _CustomDropDownFieldState extends State<CustomDropDownField> {
  String? dropdownValue;
  void initState() {
    // TODO: implement initState
    dropdownValue =
        widget.dropdownValue!.isEmpty ? null : widget.dropdownValue!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeUtils.getHeight(10)),
      child: Padding(
          padding: EdgeInsets.only(
              top: SizeUtils.getHeight(8), bottom: SizeUtils.getHeight(5)),
          child: DropdownButtonFormField(
            value: dropdownValue,

            /* icon: SvgPicture.asset(
              Utils.getAssetSvg(
                "ic_loc",
              ),
              color: AppColors.ONBOARD_GRAPE,

              //height: screenHeight * 0.05
            ),*/
            validator: (value) {
              //print(widget.validator);
              if (widget.validator != null && !widget.validator!(value)) {
                return "Please enter a valid " + widget.label.toLowerCase();
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            icon: SvgPicture.asset(
              Utils.getAssetSvg("ic_downArrow"),
              color: AppColors.onboardGrey,
            ),
            iconSize: 10,
            elevation: 4,
            style: FontUtils.getFont14Style(
                color: AppColors.onboardGrey, fontWeight: FontWeight.w600),
            decoration: InputDecoration(
                filled: true,
                isDense: true,
                counter: SizedBox(),
                fillColor: AppColors.textFieldFill,
                // suffixIcon: suffix,
                //prefixIcon: prefix,
                contentPadding: EdgeInsets.symmetric(
                    vertical: SizeUtils.getHeight(15),
                    horizontal: SizeUtils.getWidth(10)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      color: AppColors.primaryColor.withOpacity(0.3)),
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
                // hintText: hint,
                // labelText: label,
                //labelStyle: TextStyle(color: AppColors.ONBORDING_TXT_COLOR),
                //floatingLabelBehavior: FloatingLabelBehavior.always,
                hintStyle: FontUtils.getFont14Style(
                    fontWeight: FontWeight.w500,
                    color: AppColors.onboardGrey.withOpacity(0.5))),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue;
              });
              dropdownValue = newValue!;
              widget.selectedItem!(dropdownValue!);
            },
            items: widget.items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )),
    );
  }
}
