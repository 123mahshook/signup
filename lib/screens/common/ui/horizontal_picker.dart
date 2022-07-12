/*import 'dart:math';

import 'package:flutter/material.dart';

import 'item_widget.dart';

enum InitialPosition { start, center, end }

class HorizontalPicker extends StatefulWidget {
  final double minValue, maxValue;
  final int divisions;
  final double height;
  final Function(double) onChanged;
  final InitialPosition initialPosition;
  final Color backgroundColor;
  final bool showCursor;
  final Color cursorColor;
  final Color activeItemTextColor;
  final Color passiveItemsTextColor;
  final String suffix;

  HorizontalPicker({
    required this.minValue,
    required this.maxValue,
    required this.divisions,
    required this.height,
    required this.onChanged,
    this.initialPosition = InitialPosition.center,
    this.backgroundColor = Colors.white,
    this.showCursor = true,
    this.cursorColor = Colors.red,
    this.activeItemTextColor = Colors.blue,
    this.passiveItemsTextColor = Colors.grey,
    this.suffix = "",
  }) : assert(minValue < maxValue);

  @override
  _HorizontalPickerState createState() => _HorizontalPickerState();
}

class _HorizontalPickerState extends State<HorizontalPicker> {
  late FixedExtentScrollController _scrollController;
  late int curItem;
  List<Map> valueMap = [];

  @override
  void initState() {
    super.initState();

    for (var i = 0; i <= widget.divisions; i++) {
      valueMap.add({
        "value": widget.minValue +
            ((widget.maxValue - widget.minValue) / widget.divisions) * i,
        "fontSize": 14.0,
        "color": widget.passiveItemsTextColor,
      });
    }
    setScrollController();
  }

  void setScrollController() {
    int initialItem;
    switch (widget.initialPosition) {
      case InitialPosition.start:
        initialItem = 0;
        break;
      case InitialPosition.center:
        initialItem = (valueMap.length ~/ 2);
        break;
      case InitialPosition.end:
        initialItem = valueMap.length - 1;
        break;
    }

    _scrollController = FixedExtentScrollController(initialItem: initialItem);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: widget.height,
      alignment: Alignment.center,
      color: widget.backgroundColor,
      child: Stack(
        children: <Widget>[
          RotatedBox(
            quarterTurns: 3,
            child: ListWheelScrollView(
                controller: _scrollController,
                itemExtent: 60,
                onSelectedItemChanged: (item) {
                  curItem = item;
                  int decimalCount = 1;
                  num fac = pow(10, decimalCount);
                  valueMap[item]["value"] =
                      (valueMap[item]["value"] * fac).round() / fac;
                  widget.onChanged(valueMap[item]["value"]);
                  for (var i = 0; i < valueMap.length; i++) {
                    if (i == item) {
                      valueMap[item]["color"] = widget.activeItemTextColor;
                      valueMap[item]["fontSize"] = 15.0;
                      valueMap[item]["hasBorders"] = true;
                    } else {
                      valueMap[i]["color"] = widget.passiveItemsTextColor;
                      valueMap[i]["fontSize"] = 14.0;
                      valueMap[i]["hasBorders"] = false;
                    }
                  }
                  setState(() {});
                },
                children: valueMap.map((Map curValue) {
                  return ItemWidget(
                    curValue,
                    widget.backgroundColor,
                    widget.suffix,
                  );
                }).toList()),
          ),
          Visibility(
            visible: widget.showCursor,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: widget.cursorColor.withOpacity(0.3),
                ),
                width: 3,
              ),
            ),
          )
        ],
      ),
    );
  }
}*/

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:signup/utility/ui/values/app_colors.dart';
import 'package:signup/utility/ui/values/font_utils.dart';
import 'package:signup/utility/ui/values/size_utils.dart';

enum InitialPosition { start, center, end }

class HorizantalPicker extends StatefulWidget {
  final double minValue, maxValue;
  final int divisions;
  final Function(double) onChanged;
  final InitialPosition initialPosition;
  final Color backgroundColor;
  final bool showCursor;
  final Color cursorColor;
  final Color activeItemTextColor;
  final Color passiveItemsTextColor;
  final String? suffix;
  final String unit;
  HorizantalPicker(
      {required this.minValue,
      required this.maxValue,
      required this.divisions,
      required this.onChanged,
      required this.unit,
      this.initialPosition = InitialPosition.center,
      this.backgroundColor = Colors.white,
      this.showCursor = true,
      this.cursorColor = AppColors.primaryColor,
      this.activeItemTextColor = Colors.blue,
      this.passiveItemsTextColor = Colors.grey,
      this.suffix = ''})
      : assert(minValue < maxValue),
        assert(onChanged != null);
  @override
  _HorizantalPickerState createState() => _HorizantalPickerState();
}

class _HorizantalPickerState extends State<HorizantalPicker> {
  List<double> valueList = [];
  late FixedExtentScrollController _scrollController;
  int index = 0;
  int selectedFontSize = convertInt(SizeUtils.getFont(5));
  List<Map> valueMap = [];

  @override
  void initState() {
    super.initState();

    for (var i = 0; i <= widget.divisions; i++) {
      int _height = 24;
      if (i % 10 == 0) {
        _height = 34;
      }
      valueMap.add({
        "value": widget.minValue +
            ((widget.maxValue - widget.minValue) / widget.divisions) * i,
        "fontSize": 14.0,
        "color": widget.passiveItemsTextColor,
        "height": _height,
      });
    }
    setScrollController();
  }

  setScrollController() {
    int initialItem;
    switch (widget.initialPosition) {
      case InitialPosition.start:
        initialItem = 0;
        break;
      case InitialPosition.center:
        initialItem = (valueMap.length ~/ 2);
        break;
      case InitialPosition.end:
        initialItem = valueMap.length - 1;
        break;
    }

    _scrollController = FixedExtentScrollController(initialItem: initialItem);
  }

  @override
  Widget build(BuildContext context) {
    // _scrollController.jumpToItem(curItem);
    return Container(
      padding: EdgeInsets.all(SizeUtils.getHeight(4)),
      margin: EdgeInsets.all(SizeUtils.getWidth(20)),
      height: SizeUtils.getHeight(80),
      alignment: Alignment.center,
      child: Scaffold(
        backgroundColor: widget.backgroundColor,
        body: Stack(
          children: <Widget>[
            RotatedBox(
              quarterTurns: 3,
              child: ListWheelScrollView(
                  controller: _scrollController,
                  itemExtent: 10,
                  onSelectedItemChanged: (item) {
                    index = item;
                    setState(() {
                      int decimalCount = 1;
                      num fac = pow(10, decimalCount);
                      valueMap[item]["value"] =
                          (valueMap[item]["value"] * fac).round() / fac;
                      widget.onChanged(valueMap[item]["value"]);
                      for (var i = 0; i < valueMap.length; i++) {
                        int _height = 24;
                        if (i % 10 == 0 || i % 5 == 0) {
                          _height = 34;
                        } else if (i % 2 == 0 || i % 8 == 0) {
                          _height = 25;
                        } else if (i % 3 == 0) {
                          _height = 17;
                        } else if (i % 4 == 0 || i % 8 == 7) {
                          _height = 29;
                        } else if (i % 5 == 0 || i % 9 == 0) {
                          _height = 32;
                        }

                        if (i == item) {
                          valueMap[item]["color"] = widget.activeItemTextColor;
                          valueMap[item]["fontSize"] = 15.0;
                          valueMap[item]["hasBorders"] = true;
                          valueMap[item]["height"] = _height;
                        } else {
                          valueMap[i]["color"] = widget.passiveItemsTextColor;
                          valueMap[i]["fontSize"] = 14.0;
                          valueMap[i]["hasBorders"] = false;
                          valueMap[i]["height"] = _height;
                        }
                      }
                    });
                    setState(() {});
                  },
                  children: valueMap.map((Map curValue) {
                    //print("q");
                    //print(widget.backgroundColor.toString());
                    return ItemWidget(curValue,
                        backgroundColor: AppColors.transparent,
                        item: index,
                        //backgroundColor: AppColors.primaryColor,
                        suffix: widget.suffix!);
                  }).toList()),
            ),
            Visibility(
              visible: widget.showCursor,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5),
                child: Column(children: [
                  Container(
                    height: SizeUtils.getHeight(70),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: widget.cursorColor.withOpacity(0.3)),
                    width: 3,
                  ),
                  Text(
                    widget.unit,
                    style: FontUtils.getFont10Style(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  static int convertInt(data) {
    try {
      return int.parse(data.toString());
    } catch (e) {}
    return 0;
  }
}

class ItemWidget extends StatefulWidget {
  final Map curItem;
  final Color backgroundColor;
  final String? suffix;
  final int? item;
  ItemWidget(this.curItem,
      {required this.backgroundColor, this.suffix, this.item});

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  void initState() {
    super.initState();
    int decimalCount = 1;
    num fac = pow(10, decimalCount);
  }

  @override
  Widget build(BuildContext context) {
    //print(widget.item);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(9)),
      child: Container(
        padding: EdgeInsets.symmetric(
            // horizontal: 10, //vertical: 2
            ),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(10)),
        ),
        child: RotatedBox(
          quarterTurns: 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: SizeUtils.getHeight(10.0)),
                child: Container(
                  height: SizeUtils.getHeight(
                      convertDouble(widget.curItem["height"])),
                  width: SizeUtils.getWidth(1),
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static double convertDouble(data) {
    try {
      return double.parse(data.toString());
    } catch (e) {}
    return 0;
  }
}
