import 'dart:math';
import 'package:flutter/material.dart';
import '../../../domain/entities/wheel/wheel_segment.dart';
import '../../../core/constants/color_constants.dart';

class WheelPainter extends CustomPainter {
  // ========================================
  // PROPERTIES
  // ========================================
  final List<WheelSegment> segments;
  final double radius;
  final bool showWheelBorder;
  final Color wheelBorderColor;
  final double wheelBorderWidth;
  final TextStyle segmentTextStyle;
  final double segmentFontSize;
  final FontWeight segmentFontWeight;
  final Color segmentTextColor;
  final double segmentGap;

  const WheelPainter({
    required this.segments,
    required this.radius,
    required this.showWheelBorder,
    required this.wheelBorderColor,
    required this.wheelBorderWidth,
    required this.segmentTextStyle,
    required this.segmentFontSize,
    required this.segmentFontWeight,
    required this.segmentTextColor,
    required this.segmentGap,
  });

  // ========================================
  // MAIN PAINT METHOD
  // ========================================
  @override
  void paint(Canvas canvas, Size size) {
    // ========================================
    // INITIALIZATION
    // ========================================
    final paint = Paint()..style = PaintingStyle.fill;
    final center = size.center(Offset.zero);
    final wheelRadius = radius;

    // ========================================
    // WEIGHT CALCULATION
    // ========================================
    final totalWeight = _calculateTotalWeight();

    // ========================================
    // WHEEL SEGMENTS DRAWING
    // ========================================
    _drawWheelSegments(canvas, paint, center, wheelRadius, totalWeight);

    // ========================================
    // BORDER DRAWING
    // ========================================
    if (showWheelBorder == true) {
      _drawBorder(canvas, center, wheelRadius);
    }
  }

  // ========================================
  // WEIGHT CALCULATION METHODS
  // ========================================
  double _calculateTotalWeight() {
    return segments.fold<double>(
      0.0,
      (sum, segment) => sum + segment.probability,
    );
  }

  // ========================================
  // WHEEL SEGMENTS DRAWING METHODS
  // ========================================
  void _drawWheelSegments(
    Canvas canvas,
    Paint paint,
    Offset center,
    double wheelRadius,
    double totalWeight,
  ) {
    double currentAngle = -pi / 2; // Start from 12 o'clock position

    for (int i = 0; i < segments.length; i++) {
      final segment = segments[i];
      final segmentWeight = segment.probability;
      final segmentAngle = (segmentWeight / totalWeight) * 2 * pi;
      final gap = segmentGap * pi / 180; // Convert degrees to radians

      // ========================================
      // SEGMENT DRAWING
      // ========================================
      _drawSegment(
        canvas,
        paint,
        center,
        wheelRadius,
        currentAngle + gap / 2,
        segmentAngle - gap,
        segment,
      );

      // ========================================
      // TEXT DRAWING
      // ========================================
      _drawText(
        canvas,
        center,
        wheelRadius,
        currentAngle,
        segmentAngle,
        segment,
      );

      currentAngle += segmentAngle;
    }
  }

  // ========================================
  // SEGMENT DRAWING METHODS
  // ========================================
  void _drawSegment(
    Canvas canvas,
    Paint paint,
    Offset center,
    double radius,
    double startAngle,
    double angleSize,
    WheelSegment segment,
  ) {
    paint.color = segment.color;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      angleSize,
      true,
      paint,
    );
  }

  // ========================================
  // TEXT DRAWING METHODS
  // ========================================
  void _drawText(
    Canvas canvas,
    Offset center,
    double wheelRadius,
    double currentAngle,
    double segmentAngle,
    WheelSegment segment,
  ) {
    final textAngle = currentAngle + segmentAngle / 2;
    final textRadius = wheelRadius * 0.6;

    // Rotate to be parallel to the segment arc
    canvas.save();
    canvas.translate(
      center.dx + textRadius * cos(textAngle),
      center.dy + textRadius * sin(textAngle),
    );
    canvas.rotate(textAngle); // Rotate only by the segment's slope

    final textPainter = TextPainter(
      text: TextSpan(
        text: segment.text,
        style: segmentTextStyle.copyWith(
          fontSize: segmentFontSize,
          fontWeight: segmentFontWeight,
          color: segmentTextColor,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    )..layout();

    textPainter.paint(
      canvas,
      Offset(-textPainter.width / 2, -textPainter.height / 2),
    );

    canvas.restore();
  }

  // ========================================
  // BORDER DRAWING METHODS
  // ========================================
  void _drawBorder(Canvas canvas, Offset center, double radius) {
    // ========================================
    // OUTER BORDER DRAWING
    // ========================================
    _drawOuterBorder(canvas, center, radius);

    // ========================================
    // INNER BORDER DRAWING
    // ========================================
    _drawInnerBorder(canvas, center, radius);
  }

  void _drawOuterBorder(Canvas canvas, Offset center, double radius) {
    final borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = wheelBorderColor
      ..strokeWidth = wheelBorderWidth;

    canvas.drawCircle(center, radius, borderPaint);
  }

  void _drawInnerBorder(Canvas canvas, Offset center, double radius) {
    final innerBorderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = ColorConstants.borderColor
      ..strokeWidth = 2;

    canvas.drawCircle(center, radius - 2, innerBorderPaint);
  }

  // ========================================
  // REPAINT LOGIC
  // ========================================
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // ========================================
    // TYPE VALIDATION
    // ========================================
    if (oldDelegate is! WheelPainter) return true;

    // ========================================
    // SEGMENT COUNT VALIDATION
    // ========================================
    if (oldDelegate.segments.length != segments.length) return true;

    // ========================================
    // RADIUS VALIDATION
    // ========================================
    if (oldDelegate.radius != radius) return true;

    // ========================================
    // SEGMENT PROPERTIES VALIDATION
    // ========================================
    return _hasSegmentChanges(oldDelegate);
  }

  bool _hasSegmentChanges(WheelPainter oldDelegate) {
    for (int i = 0; i < segments.length; i++) {
      if (i < oldDelegate.segments.length) {
        if (_hasSegmentPropertyChanged(oldDelegate, i)) {
          return true;
        }
      } else {
        return true; // New segment added
      }
    }
    return false;
  }

  bool _hasSegmentPropertyChanged(WheelPainter oldDelegate, int index) {
    final currentSegment = segments[index];
    final oldSegment = oldDelegate.segments[index];

    return currentSegment.text != oldSegment.text ||
        currentSegment.color != oldSegment.color ||
        currentSegment.probability != oldSegment.probability;
  }
}
