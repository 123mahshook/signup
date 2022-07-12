import 'package:flutter/material.dart';

class TriAngleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 360;
    final double _yScaling = size.height / 313;
    path.lineTo(360 * _xScaling, 0 * _yScaling);
    path.cubicTo(
      360 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      251 * _yScaling,
      0 * _xScaling,
      251 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      251 * _yScaling,
      180 * _xScaling,
      313 * _yScaling,
      180 * _xScaling,
      313 * _yScaling,
    );
    path.cubicTo(
      180 * _xScaling,
      313 * _yScaling,
      360 * _xScaling,
      251 * _yScaling,
      360 * _xScaling,
      251 * _yScaling,
    );
    path.cubicTo(
      360 * _xScaling,
      251 * _yScaling,
      360 * _xScaling,
      0 * _yScaling,
      360 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      360 * _xScaling,
      0 * _yScaling,
      360 * _xScaling,
      0 * _yScaling,
      360 * _xScaling,
      0 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(oldClipper) => false;
}
