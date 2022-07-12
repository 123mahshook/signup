import 'package:flutter/material.dart';
import 'package:signup/utility/ui/components/custom_textfield.dart';
import 'package:signup/utility/ui/values/app_colors.dart';
import 'package:intl/intl.dart';

class CustomDateField extends StatefulWidget {
  CustomDateField(
      {required this.label,
      this.controller,
      this.validator,
      this.freeze,
      this.prevDisable,
      this.readOnly,
      this.startDate,
      this.initialDate,
      // this.onTap,
      this.onChanged});
  final String label;
  final TextEditingController? controller;
  final Function? validator;
  final bool? freeze;
  final bool? prevDisable;
  final Function(String)? onChanged;
  final bool? readOnly;
  final DateTime? startDate;
  final DateTime? initialDate;
  //final Function? onTap;
  @override
  State<CustomDateField> createState() => _CustomDateFieldState();
}

class _CustomDateFieldState extends State<CustomDateField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        label: widget.label,
        readOnly: true,
        controller: widget.controller,
        validator: widget.validator,
        onChanged: widget.onChanged,
        onTap: widget.readOnly ?? true
            ? () async {
                DateTime? date = DateTime(1900);
                FocusScope.of(context).requestFocus(new FocusNode());

                date = await showDatePicker(
                    context: context,
                    initialDate: widget.initialDate ?? DateTime.now(),
                    firstDate: widget.startDate == null
                        ? widget.prevDisable == null
                            ? DateTime(1960)
                            : DateTime.now()
                        : widget.startDate!,
                    lastDate:
                        widget.freeze == null ? DateTime(2101) : DateTime.now(),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                          child: child!,
                          data: ThemeData.light().copyWith(
                              colorScheme: ColorScheme.light(
                            primary: AppColors.primaryColor,
                            background: AppColors.white,
                            onSurface: AppColors.black,
                          )));
                    });

                if (date != null)
                  setState(() => {
                        widget.controller?.text =
                            DateFormat("yyyy-MM-dd").format(date!).toString(),
                      });
                if (widget.onChanged != null) {
                  widget.onChanged!("");
                }
              }
            : () {});

    //date picker
  }
}
