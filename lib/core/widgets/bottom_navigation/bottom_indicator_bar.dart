import "dart:ui" show lerpDouble;

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:movie_app/core/extension/size_extension.dart";

class BottomIndicatorBar extends StatelessWidget {
  const BottomIndicatorBar({
    required this.child,
    super.key,
    this.currentIndex = 0,
    this.length = 5,
  });

  final int currentIndex;
  final Widget child;
  final int length;

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          child,
          const Positioned(left: 0, right: 0, top: 0, child: Line()),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AnimatedAlign(
              alignment: Alignment(
                _getIndicatorPosition(currentIndex, context),
                0,
              ),
              duration: const Duration(milliseconds: 300),
              child: Line(
                color: Colors.blue,
                width: context.kSize.width / length,
              ),
            ),
          ),
        ],
      );

  double _getIndicatorPosition(int index, BuildContext context) {
    final bool isLtr = Directionality.of(context) == TextDirection.ltr;
    if (isLtr) {
      return lerpDouble(-1.0, 1.0, index / (length - 1)) ?? 0;
    } else {
      return lerpDouble(1.0, -1.0, index / (length - 1)) ?? 0;
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IntProperty("currentIndex", currentIndex))
      ..add(IntProperty("length", length));
  }
}

class Line extends StatelessWidget {
  const Line({
    super.key,
    this.color,
    this.strokeHeight = 1,
    this.width = double.infinity,
  });

  final Color? color;
  final double strokeHeight;
  final double width;

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: _LinePainter(
          color: color ?? Colors.blue,
          strokeWidth: strokeHeight,
        ),
        size: Size(width, strokeHeight),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty("color", color))
      ..add(DoubleProperty("strokeHeight", strokeHeight))
      ..add(DoubleProperty("width", width));
  }
}

class _LinePainter extends CustomPainter {
  const _LinePainter({
    required this.color,
    required this.strokeWidth,
  });

  final Color color;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_LinePainter oldDelegate) => false;
}
