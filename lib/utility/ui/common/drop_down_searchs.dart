import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:signup/app/models/models/assistant_model.dart';
import 'package:signup/app/models/models/batches_model.dart';
import 'package:signup/app/models/models/nutritionist_model.dart';
import 'package:signup/app/models/models/package_model.dart';
import 'package:signup/app/models/models/source_model.dart';
import 'package:signup/utility/ui/values/app_colors.dart';
import 'package:signup/utility/ui/values/font_utils.dart';
import 'package:signup/utility/ui/values/size_utils.dart';

class AssistantSearchDropDown extends StatefulWidget {
  const AssistantSearchDropDown(
      {Key? key,
      required this.selectedItem,
      required this.items,
      this.label,
      this.hint = "SELECT FROM MENU",
      this.validator,
      this.dropdownValue})
      : super(key: key);
  final Function(AssistantModel? value)? selectedItem;
  final List<AssistantModel> items;
  final String? label;
  final String? hint;
  final AssistantModel? dropdownValue;
  final Function? validator;
  @override
  _AssistantSearchDropDownState createState() =>
      _AssistantSearchDropDownState();
}

class _AssistantSearchDropDownState extends State<AssistantSearchDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeUtils.getHeight(8), bottom: SizeUtils.getHeight(5)),
      child: DropdownSearch<AssistantModel>(
        //   mode: Mode.DIALOG,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          value == null ? value = AssistantModel.initData() : value = value;
          if (widget.validator != null && !widget.validator!(value)) {
            return "Please enter a valid " + widget.label!.toLowerCase();
          }
          return null;
        },
        itemAsString: (value) {
          return value.name!;
        },
        popupProps: PopupPropsMultiSelection.menu(
          //backgroundColor: Colors.red,
          textStyle: FontUtils.getFont14Style(
              color: AppColors.onboardGrey, fontWeight: FontWeight.w600),
          itemBuilder: _customPopUpPackage,
          menuProps: MenuProps(
              elevation: 16,
              backgroundColor: AppColors.white,
              textStyle: FontUtils.getFont14Style(
                  color: AppColors.onboardGrey, fontWeight: FontWeight.w600)),
          showSearchBox: true,
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
                filled: true,
                isDense: true,
                counter: SizedBox(),
                fillColor: AppColors.textFieldFill,
                contentPadding: EdgeInsets.symmetric(
                    vertical: SizeUtils.getHeight(8),
                    horizontal: SizeUtils.getWidth(8)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      color: AppColors.primaryColor.withOpacity(0.3)),
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "🔍 Search Assistant",
                hintStyle: FontUtils.getFont14Style(
                    fontWeight: FontWeight.w500,
                    color: AppColors.onboardGrey.withOpacity(0.5))),
            autofocus: true,
          ),
        ),
        //dropdownSearchTextAlign: TextAlign.end,
        /*showSearchBox: true,
        //true,
        itemAsString: (value) {
          return value!.name!;
        },
        popupElevation: 16,
        popupItemBuilder: _customPopUpPackage,
        dropDownButton: SvgPicture.asset(
          Utils.getAssetSvg("ic_downArrow"),
          color: AppColors.onboardGrey,
          height: SizeUtils.getHeight(5),
        ),*/
        dropdownBuilder: _customDropDownPackage,
        // dropdownSearchBaseStyle: CustomTextStyle.formTextStyle(AppColors.loginFormText),
        selectedItem: /* widget.selectedItem == "" ? null : */ widget
            .dropdownValue,
        items: widget.items,
        onChanged: (value) {
          widget.selectedItem!.call(value);
        },
        dropdownSearchDecoration: InputDecoration(
            filled: true,
            isDense: true,
            counter: SizedBox(),
            fillColor: AppColors.textFieldFill,
            contentPadding: EdgeInsets.symmetric(
                vertical: SizeUtils.getHeight(4),
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
            errorStyle: FontUtils.getFont10Style(color: Colors.red),
            enabledBorder: InputBorder.none,
            hintStyle: FontUtils.getFont14Style(
                fontWeight: FontWeight.w500,
                color: AppColors.onboardGrey.withOpacity(0.5))),
      ),
    );
  }

  Widget _customDropDownPackage(BuildContext context, AssistantModel? pack) {
    return Padding(
      padding: EdgeInsets.only(top: SizeUtils.getHeight(4)),
      child: Text(
        pack != null ? pack.name! : "-- select any --",
        style: FontUtils.getFont14Style(
            color: AppColors.onboardGrey, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _customPopUpPackage(
      BuildContext context, AssistantModel packa, bool b) {
    return Container(
        // color: AppColors.textFieldFill,
        padding: EdgeInsets.symmetric(
          vertical: SizeUtils.getHeight(10),
          horizontal: SizeUtils.getWidth(12),
        ),
        child: Text(
          packa.name!,
          maxLines: 1,
          style: FontUtils.getFont14Style(
              color: AppColors.onboardGrey, fontWeight: FontWeight.w600),
        ));
  }
}

/////////////////////////////////////////// renewal

class NutritionistSearchDropDown extends StatefulWidget {
  const NutritionistSearchDropDown(
      {Key? key,
      required this.selectedItem,
      required this.items,
      this.label,
      this.hint = "SELECT FROM MENU",
      this.validator,
      this.dropdownValue})
      : super(key: key);
  final Function(NutritionistModel? value)? selectedItem;
  final List<NutritionistModel> items;
  final String? label;
  final String? hint;
  final NutritionistModel? dropdownValue;
  final Function? validator;
  @override
  _NutritionistSearchDropDownState createState() =>
      _NutritionistSearchDropDownState();
}

class _NutritionistSearchDropDownState
    extends State<NutritionistSearchDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeUtils.getHeight(8), bottom: SizeUtils.getHeight(5)),
      child: DropdownSearch<NutritionistModel>(
        //mode: Mode.DIALOG,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          value == null ? value = NutritionistModel.initData() : value = value;
          if (widget.validator != null && !widget.validator!(value)) {
            return "Please enter a valid " + widget.label!.toLowerCase();
          }
          return null;
        },
        popupProps: PopupPropsMultiSelection.menu(
          //backgroundColor: Colors.red,
          textStyle: FontUtils.getFont14Style(
              color: AppColors.onboardGrey, fontWeight: FontWeight.w600),
          itemBuilder: _customPopUpNutr,
          menuProps: MenuProps(
              elevation: 16,
              backgroundColor: AppColors.white,
              textStyle: FontUtils.getFont14Style(
                  color: AppColors.onboardGrey, fontWeight: FontWeight.w600)),
          showSearchBox: true,
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
                filled: true,
                isDense: true,
                counter: SizedBox(),
                fillColor: AppColors.textFieldFill,
                contentPadding: EdgeInsets.symmetric(
                    vertical: SizeUtils.getHeight(8),
                    horizontal: SizeUtils.getWidth(8)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      color: AppColors.primaryColor.withOpacity(0.3)),
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "🔍 Search Nutritionist",
                hintStyle: FontUtils.getFont14Style(
                    fontWeight: FontWeight.w500,
                    color: AppColors.onboardGrey.withOpacity(0.5))),
            autofocus: true,
          ),
        ),
        //dropdownSearchTextAlign: TextAlign.end,
        //showSearchBox: true,
        //true,
        itemAsString: (value) {
          return value.name!;
        },
        /*popupElevation: 16,
        popupItemBuilder: _customPopUpNutr,*/
        dropdownBuilder: _customDropDownNutritionist,
        /*dropDownButton: SvgPicture.asset(
          Utils.getAssetSvg("ic_downArrow"),
          color: AppColors.onboardGrey,
          height: SizeUtils.getHeight(5),
        ),*/
        // dropdownSearchBaseStyle: CustomTextStyle.formTextStyle(AppColors.loginFormText),
        selectedItem: /* widget.selectedItem == "" ? null : */ widget
            .dropdownValue,
        items: widget.items,
        onChanged: (value) {
          widget.selectedItem!.call(value);
        },
        dropdownSearchDecoration: InputDecoration(
            filled: true,
            isDense: true,
            counter: SizedBox(),
            fillColor: AppColors.textFieldFill,
            contentPadding: EdgeInsets.symmetric(
                vertical: SizeUtils.getHeight(4),
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
            errorStyle: FontUtils.getFont10Style(color: Colors.red),
            enabledBorder: InputBorder.none,
            hintStyle: FontUtils.getFont14Style(
                fontWeight: FontWeight.w500,
                color: AppColors.onboardGrey.withOpacity(0.5))),
      ),
    );
  }

  Widget _customDropDownNutritionist(
      BuildContext context, NutritionistModel? nutr) {
    return Container(
        padding: EdgeInsets.only(top: SizeUtils.getHeight(4)),
        child: Text(
          nutr != null ? nutr.name! : "-- select any --",
          style: FontUtils.getFont14Style(
              color: AppColors.onboardGrey, fontWeight: FontWeight.w600),
        ));
  }

  Widget _customPopUpNutr(
      BuildContext context, NutritionistModel nutr, bool b) {
    return Container(
        // color: AppColors.textFieldFill,
        padding: EdgeInsets.symmetric(
          vertical: SizeUtils.getHeight(10),
          horizontal: SizeUtils.getWidth(12),
        ),
        child: Text(
          nutr.name!,
          maxLines: 1,
          style: FontUtils.getFont14Style(
              color: AppColors.onboardGrey, fontWeight: FontWeight.w600),
        ));
  }
}

///
///
/// packages model
///
///

class PackagesSearchDropDown extends StatefulWidget {
  const PackagesSearchDropDown(
      {Key? key,
      required this.selectedItem,
      required this.items,
      this.label,
      this.hint = "SELECT FROM MENU",
      this.validator,
      this.dropdownValue})
      : super(key: key);
  final Function(PackageModel? value)? selectedItem;
  final List<PackageModel> items;
  final String? label;
  final String? hint;
  final PackageModel? dropdownValue;
  final Function? validator;
  @override
  _PackagesSearchDropDownState createState() => _PackagesSearchDropDownState();
}

class _PackagesSearchDropDownState extends State<PackagesSearchDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeUtils.getHeight(8), bottom: SizeUtils.getHeight(5)),
      child: DropdownSearch<PackageModel>(
        //mode: Mode.DIALOG,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          value == null ? value = PackageModel.initData() : value = value;
          if (widget.validator != null && !widget.validator!(value)) {
            return "Please enter a valid " + widget.label!.toLowerCase();
          }
          return null;
        },
        popupProps: PopupPropsMultiSelection.menu(
          //backgroundColor: Colors.red,
          textStyle: FontUtils.getFont14Style(
              color: AppColors.onboardGrey, fontWeight: FontWeight.w600),
          itemBuilder: _customPopUpPackage,
          menuProps: MenuProps(
              elevation: 16,
              backgroundColor: AppColors.white,
              textStyle: FontUtils.getFont14Style(
                  color: AppColors.onboardGrey, fontWeight: FontWeight.w600)),
          showSearchBox: true,
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
                filled: true,
                isDense: true,
                counter: SizedBox(),
                fillColor: AppColors.textFieldFill,
                contentPadding: EdgeInsets.symmetric(
                    vertical: SizeUtils.getHeight(8),
                    horizontal: SizeUtils.getWidth(8)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      color: AppColors.primaryColor.withOpacity(0.3)),
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "🔍 Search Packages",
                hintStyle: FontUtils.getFont14Style(
                    fontWeight: FontWeight.w500,
                    color: AppColors.onboardGrey.withOpacity(0.5))),
            autofocus: true,
          ),
        ),
        //dropdownSearchTextAlign: TextAlign.end,
        //showSearchBox: true,
        //true,
        itemAsString: (value) {
          return value.name!;
        },
        /*popupElevation: 16,
        popupItemBuilder: _customPopUpPackage,
        dropDownButton: SvgPicture.asset(
          Utils.getAssetSvg("ic_downArrow"),
          color: AppColors.onboardGrey,
          height: SizeUtils.getHeight(5),
        ),*/
        dropdownBuilder: _customDropDownPackage,
        // dropdownSearchBaseStyle: CustomTextStyle.formTextStyle(AppColors.loginFormText),
        selectedItem: /* widget.selectedItem == "" ? null : */ widget
            .dropdownValue,
        items: widget.items,
        onChanged: (value) {
          widget.selectedItem!.call(value);
        },
        dropdownSearchDecoration: InputDecoration(
            filled: true,
            isDense: true,
            counter: SizedBox(),
            fillColor: AppColors.textFieldFill,
            contentPadding: EdgeInsets.symmetric(
                vertical: SizeUtils.getHeight(4),
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
            errorStyle: FontUtils.getFont10Style(color: Colors.red),
            enabledBorder: InputBorder.none,
            hintStyle: FontUtils.getFont14Style(
                fontWeight: FontWeight.w500,
                color: AppColors.onboardGrey.withOpacity(0.5))),
      ),
    );
  }

  Widget _customDropDownPackage(BuildContext context, PackageModel? pack) {
    return Container(
        padding: EdgeInsets.only(top: SizeUtils.getHeight(4)),
        child: Text(
          pack != null ? pack.name! : "-- select any --",
          style: FontUtils.getFont14Style(
              color: AppColors.onboardGrey, fontWeight: FontWeight.w600),
        ));
  }

  Widget _customPopUpPackage(BuildContext context, PackageModel packa, bool b) {
    return Container(
        // color: AppColors.textFieldFill,
        padding: EdgeInsets.symmetric(
          vertical: SizeUtils.getHeight(10),
          horizontal: SizeUtils.getWidth(12),
        ),
        child: Text(
          packa.name!,
          maxLines: 1,
          style: FontUtils.getFont14Style(
              color: AppColors.onboardGrey, fontWeight: FontWeight.w600),
        ));
  }
}

///
///
/// source
///
///

class SourceSearchDropDown extends StatefulWidget {
  const SourceSearchDropDown(
      {Key? key,
      required this.selectedItem,
      required this.items,
      this.label,
      this.hint = "SELECT FROM MENU",
      this.validator,
      this.dropdownValue})
      : super(key: key);
  final Function(SourceModel? value)? selectedItem;
  final List<SourceModel> items;
  final String? label;
  final String? hint;
  final SourceModel? dropdownValue;
  final Function? validator;
  @override
  _SourceSearchDropDownState createState() => _SourceSearchDropDownState();
}

class _SourceSearchDropDownState extends State<SourceSearchDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeUtils.getHeight(8), bottom: SizeUtils.getHeight(5)),
      child: DropdownSearch<SourceModel>(
        // mode: Mode.DIALOG,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          value == null ? value = SourceModel.initData() : value = value;
          if (widget.validator != null && !widget.validator!(value)) {
            return "Please enter a valid " + widget.label!.toLowerCase();
          }
          return null;
        },
        popupProps: PopupPropsMultiSelection.menu(
          //backgroundColor: Colors.red,
          textStyle: FontUtils.getFont14Style(
              color: AppColors.onboardGrey, fontWeight: FontWeight.w600),
          itemBuilder: _customPopUpSource,
          menuProps: MenuProps(
              elevation: 16,
              backgroundColor: AppColors.white,
              textStyle: FontUtils.getFont14Style(
                  color: AppColors.onboardGrey, fontWeight: FontWeight.w600)),
          showSearchBox: true,
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
                filled: true,
                isDense: true,
                counter: SizedBox(),
                fillColor: AppColors.textFieldFill,
                contentPadding: EdgeInsets.symmetric(
                    vertical: SizeUtils.getHeight(8),
                    horizontal: SizeUtils.getWidth(8)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      color: AppColors.primaryColor.withOpacity(0.3)),
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "🔍 Search Source",
                hintStyle: FontUtils.getFont14Style(
                    fontWeight: FontWeight.w500,
                    color: AppColors.onboardGrey.withOpacity(0.5))),
            autofocus: true,
          ),
        ),

        //dropdownSearchTextAlign: TextAlign.end,
        //showSearchBox: true,
        //true,
        itemAsString: (value) {
          return value.name!;
        },
        // popupElevation: 16,
        dropdownBuilder: _customDropDownSource,
        /*popupItemBuilder: _customPopUpSource,
        dropDownButton: SvgPicture.asset(
          Utils.getAssetSvg("ic_downArrow"),
          color: AppColors.onboardGrey,
          height: SizeUtils.getHeight(5),
        ),*/
        // dropdownSearchBaseStyle: CustomTextStyle.formTextStyle(AppColors.loginFormText),
        selectedItem: /* widget.selectedItem == "" ? null : */ widget
            .dropdownValue,
        items: widget.items,
        onChanged: (value) {
          widget.selectedItem!.call(value);
        },

        dropdownSearchDecoration: InputDecoration(
            filled: true,
            isDense: true,
            counter: SizedBox(),
            fillColor: AppColors.textFieldFill,
            contentPadding: EdgeInsets.symmetric(
                vertical: SizeUtils.getHeight(4),
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
            errorStyle: FontUtils.getFont10Style(color: Colors.red),
            enabledBorder: InputBorder.none,
            hintStyle: FontUtils.getFont14Style(
                fontWeight: FontWeight.w500,
                color: AppColors.onboardGrey.withOpacity(0.5))),
      ),
    );
  }

  Widget _customDropDownSource(BuildContext context, SourceModel? source) {
    return Container(
        padding: EdgeInsets.only(top: SizeUtils.getHeight(4)),
        child: Text(
          source != null ? source.name! : "-- select any --",
          style: FontUtils.getFont14Style(
              color: AppColors.onboardGrey, fontWeight: FontWeight.w600),
        ));
  }

  Widget _customPopUpSource(BuildContext context, SourceModel source, bool b) {
    return Container(
        // color: AppColors.textFieldFill,
        padding: EdgeInsets.symmetric(
          vertical: SizeUtils.getHeight(10),
          horizontal: SizeUtils.getWidth(12),
        ),
        child: Text(
          source.name!,
          maxLines: 1,
          style: FontUtils.getFont14Style(
              color: AppColors.onboardGrey, fontWeight: FontWeight.w600),
        ));
  }
}

///
///
/// batch
///
///
class BatchSearchDropDown extends StatefulWidget {
  const BatchSearchDropDown(
      {Key? key,
      required this.selectedItem,
      required this.items,
      this.label,
      this.hint = "SELECT FROM MENU",
      this.validator,
      this.dropdownValue})
      : super(key: key);
  final Function(BatchesModel? value)? selectedItem;
  final List<BatchesModel> items;
  final String? label;
  final String? hint;
  final BatchesModel? dropdownValue;
  final Function? validator;
  @override
  _BatchSearchDropDownState createState() => _BatchSearchDropDownState();
}

class _BatchSearchDropDownState extends State<BatchSearchDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeUtils.getHeight(8), bottom: SizeUtils.getHeight(5)),
      child: DropdownSearch<BatchesModel>(
        // mode: Mode.DIALOG,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          value == null ? value = BatchesModel.initData() : value = value;
          if (widget.validator != null && !widget.validator!(value)) {
            return "Please enter a valid " + widget.label!.toLowerCase();
          }
          return null;
        },
        popupProps: PopupPropsMultiSelection.menu(
          //backgroundColor: Colors.red,
          textStyle: FontUtils.getFont14Style(
              color: AppColors.onboardGrey, fontWeight: FontWeight.w600),
          itemBuilder: _customPopUpBatch,
          menuProps: MenuProps(
              elevation: 16,
              backgroundColor: AppColors.white,
              textStyle: FontUtils.getFont14Style(
                  color: AppColors.onboardGrey, fontWeight: FontWeight.w600)),
          showSearchBox: true,
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
                filled: true,
                isDense: true,
                counter: SizedBox(),
                fillColor: AppColors.textFieldFill,
                contentPadding: EdgeInsets.symmetric(
                    vertical: SizeUtils.getHeight(8),
                    horizontal: SizeUtils.getWidth(8)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      color: AppColors.primaryColor.withOpacity(0.3)),
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "🔍 Search Batch",
                hintStyle: FontUtils.getFont14Style(
                    fontWeight: FontWeight.w500,
                    color: AppColors.onboardGrey.withOpacity(0.5))),
            autofocus: true,
          ),
        ),
        //dropdownSearchTextAlign: TextAlign.end,
        // showSearchBox: true,
        //true,
        itemAsString: (value) {
          return value.name!;
        },
        //popupElevation: 16,
        dropdownBuilder: _customDropDownBatch,
        /* popupItemBuilder: _customPopUpBatch,
        dropDownButton: SvgPicture.asset(
          Utils.getAssetSvg("ic_downArrow"),
          color: AppColors.onboardGrey,
          height: SizeUtils.getHeight(5),
        ),*/
        // dropdownSearchBaseStyle: CustomTextStyle.formTextStyle(AppColors.loginFormText),
        selectedItem: /* widget.selectedItem == "" ? null : */ widget
            .dropdownValue,
        items: widget.items,
        onChanged: (value) {
          widget.selectedItem!.call(value);
        },
        dropdownSearchDecoration: InputDecoration(
            filled: true,
            isDense: true,
            counter: SizedBox(),
            fillColor: AppColors.textFieldFill,
            contentPadding: EdgeInsets.symmetric(
                vertical: SizeUtils.getHeight(4),
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
            errorStyle: FontUtils.getFont10Style(color: Colors.red),
            enabledBorder: InputBorder.none,
            hintStyle: FontUtils.getFont14Style(
                fontWeight: FontWeight.w500,
                color: AppColors.onboardGrey.withOpacity(0.5))),
      ),
    );
  }

  Widget _customDropDownBatch(BuildContext context, BatchesModel? batch) {
    return Container(
        padding: EdgeInsets.only(top: SizeUtils.getHeight(4)),
        child: Text(
          batch != null ? batch.name! : "-- select any --",
          style: FontUtils.getFont14Style(
              color: AppColors.onboardGrey, fontWeight: FontWeight.w600),
        ));
  }

  Widget _customPopUpBatch(BuildContext context, BatchesModel batch, bool b) {
    return Container(
        // color: AppColors.textFieldFill,
        padding: EdgeInsets.symmetric(
          vertical: SizeUtils.getHeight(10),
          horizontal: SizeUtils.getWidth(12),
        ),
        child: Text(
          batch.name!,
          maxLines: 1,
          style: FontUtils.getFont14Style(
              color: AppColors.onboardGrey, fontWeight: FontWeight.w600),
        ));
  }
}
