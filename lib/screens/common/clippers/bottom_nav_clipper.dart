import 'package:flutter/material.dart';

class BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 360;
    final double _yScaling = size.height / 61;
    path.lineTo(0 * _xScaling, 15.137 * _yScaling);
    path.cubicTo(
      0 * _xScaling,
      15.137 * _yScaling,
      140.712 * _xScaling,
      2.52221 * _yScaling,
      140.712 * _xScaling,
      2.52221 * _yScaling,
    );
    path.cubicTo(
      166.851 * _xScaling,
      0.178772 * _yScaling,
      193.149 * _xScaling,
      0.178768 * _yScaling,
      219.288 * _xScaling,
      2.5222 * _yScaling,
    );
    path.cubicTo(
      219.288 * _xScaling,
      2.5222 * _yScaling,
      360 * _xScaling,
      15.137 * _yScaling,
      360 * _xScaling,
      15.137 * _yScaling,
    );
    path.cubicTo(
      360 * _xScaling,
      15.137 * _yScaling,
      360 * _xScaling,
      61 * _yScaling,
      360 * _xScaling,
      61 * _yScaling,
    );
    path.cubicTo(
      360 * _xScaling,
      61 * _yScaling,
      0 * _xScaling,
      61 * _yScaling,
      0 * _xScaling,
      61 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      61 * _yScaling,
      0 * _xScaling,
      15.137 * _yScaling,
      0 * _xScaling,
      15.137 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      15.137 * _yScaling,
      0 * _xScaling,
      15.137 * _yScaling,
      0 * _xScaling,
      15.137 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(oldClipper) => false;
}
