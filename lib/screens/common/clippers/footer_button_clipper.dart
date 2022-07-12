import 'package:flutter/material.dart';

class FooterButtonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 312;
    final double _yScaling = size.height / 56;
    path.lineTo(312 * _xScaling, 39 * _yScaling);
    path.cubicTo(
      312 * _xScaling,
      39 * _yScaling,
      312 * _xScaling,
      0 * _yScaling,
      312 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      312 * _xScaling,
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
      56 * _yScaling,
      0 * _xScaling,
      56 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      56 * _yScaling,
      295 * _xScaling,
      56 * _yScaling,
      295 * _xScaling,
      56 * _yScaling,
    );
    path.cubicTo(
      295 * _xScaling,
      56 * _yScaling,
      312 * _xScaling,
      39 * _yScaling,
      312 * _xScaling,
      39 * _yScaling,
    );
    path.cubicTo(
      312 * _xScaling,
      39 * _yScaling,
      312 * _xScaling,
      39 * _yScaling,
      312 * _xScaling,
      39 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(oldClipper) => false;
}
