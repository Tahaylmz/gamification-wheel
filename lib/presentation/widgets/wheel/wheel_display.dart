import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/wheel/wheel_segment.dart';
import '../../blocs/wheel_display/wheel_display_bloc.dart';
import '../../blocs/wheel_display/states.dart';
import 'wheel_painter.dart';
import '../../../core/constants/color_constants.dart';
import '../../../utils/color_utils.dart';

class WheelDisplay extends StatelessWidget {
  // ========================================
  // PROPERTIES
  // ========================================
  final List<WheelSegment> segments;
  final double angle;
  final double size;
  final bool showPointer;
  final double pointerOffset;
  final Color pointerColor;
  final bool animatePointerColor;
  final bool enableTapToSpin;
  final bool showCenterDot;
  final bool showWheelBorder;
  final Color wheelBorderColor;
  final double wheelBorderWidth;
  final TextStyle segmentTextStyle;
  final double segmentFontSize;
  final FontWeight segmentFontWeight;
  final Color segmentTextColor;
  final bool showWheelShadow;
  final double wheelShadowBlur;
  final Color wheelShadowColor;
  final double wheelShadowOffsetX;
  final double wheelShadowOffsetY;
  final double initialAngle;
  final double segmentGap;
  final Widget? centerWidget;
  final VoidCallback? onWheelTap;
  final Widget? customPointer;

  const WheelDisplay({
    super.key,
    required this.segments,
    required this.angle,
    required this.size,
    required this.showPointer,
    required this.pointerOffset,
    required this.pointerColor,
    required this.animatePointerColor,
    required this.enableTapToSpin,
    required this.showCenterDot,
    required this.showWheelBorder,
    required this.wheelBorderColor,
    required this.wheelBorderWidth,
    required this.segmentTextStyle,
    required this.segmentFontSize,
    required this.segmentFontWeight,
    required this.segmentTextColor,
    required this.showWheelShadow,
    required this.wheelShadowBlur,
    required this.wheelShadowColor,
    required this.wheelShadowOffsetX,
    required this.wheelShadowOffsetY,
    required this.initialAngle,
    required this.segmentGap,
    this.centerWidget,
    this.onWheelTap,
    this.customPointer,
  });

  // ========================================
  // MAIN BUILD METHOD
  // ========================================
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WheelDisplayBloc, WheelDisplayState>(
      builder: (context, blocState) {
        // ========================================
        // CALCULATE CURRENT SEGMENT AND ARROW COLOR
        // ========================================
        final wheelDisplayBloc = context.read<WheelDisplayBloc>();
        final currentSegment = wheelDisplayBloc.getCurrentSegment(
          segments,
          angle,
        );
        final arrowColorHex = wheelDisplayBloc.getArrowColorHex(
          currentSegment,
          angle,
        );
        Color arrowColor;
        if (animatePointerColor && blocState.isSpinning) {
          // Animated color: rainbow
          final t = (angle * 180 / 3.14159) % 360;
          arrowColor = HSLColor.fromAHSL(1.0, t, 0.85, 0.55).toColor();
        } else if (!animatePointerColor) {
          arrowColor = pointerColor;
        } else {
          arrowColor = ColorUtils.parseColor(arrowColorHex);
        }

        return GestureDetector(
          onTap: enableTapToSpin ? () => _handleWheelTap(context) : null,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              // ========================================
              // SHADOW SECTION
              // ========================================
              if (showWheelShadow) _buildShadowSection(),

              // ========================================
              // WHEEL SECTION
              // ========================================
              _buildWheelSection(),

              // ========================================
              // CENTER DOT SECTION
              // ========================================
              if (centerWidget == null && showCenterDot)
                _buildCenterDotSection(),
              if (centerWidget != null && showCenterDot) centerWidget!,
              // ========================================
              // ARROW POINTER SECTION
              // ========================================
              if (showPointer)
                _buildArrowPointerSection(arrowColor,
                    customPointer: customPointer),

              // ========================================
              // SPINNING INDICATOR (if spinning)
              // ========================================
              if (blocState.isSpinning) _buildSpinningIndicator(),
            ],
          ),
        );
      },
    );
  }

  // ========================================
  // WHEEL TAP HANDLER
  // ========================================
  void _handleWheelTap(BuildContext context) {
    // Call the provided callback if available
    if (onWheelTap != null) {
      onWheelTap!();
    }
  }

  // ========================================
  // SHADOW SECTION WIDGETS
  // ========================================
  Widget _buildShadowSection() {
    return Container(
      width: size + 20,
      height: size + 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: wheelShadowColor,
            blurRadius: wheelShadowBlur,
            offset: Offset(wheelShadowOffsetX, wheelShadowOffsetY),
          ),
        ],
      ),
    );
  }

  // ========================================
  // WHEEL SECTION WIDGETS
  // ========================================
  Widget _buildWheelSection() {
    return Transform.rotate(
      angle: angle + initialAngle,
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: CustomPaint(
          painter: WheelPainter(
            segments: segments,
            radius: size / 2,
            showWheelBorder: showWheelBorder,
            wheelBorderColor: wheelBorderColor,
            wheelBorderWidth: wheelBorderWidth,
            segmentTextStyle: segmentTextStyle,
            segmentFontSize: segmentFontSize,
            segmentFontWeight: segmentFontWeight,
            segmentTextColor: segmentTextColor,
            segmentGap: segmentGap,
          ),
        ),
      ),
    );
  }

  // ========================================
  // CENTER DOT SECTION WIDGETS
  // ========================================
  Widget _buildCenterDotSection() {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: ColorConstants.cardColor,
        shape: BoxShape.circle,
        border: Border.all(color: ColorConstants.textColor, width: 2),
      ),
    );
  }

  // ========================================
  // ARROW POINTER SECTION WIDGETS
  // ========================================
  Widget _buildArrowPointerSection(Color arrowColor, {Widget? customPointer}) {
    // Calculate the point where the pointer will emerge from the center of the wheel
    final double r = (size / 2) + pointerOffset;
    final double pointerX = r * sin(initialAngle);
    final double pointerY = -r * cos(initialAngle);

    return Positioned(
      left: (size / 2) + pointerX + 15,
      top: (size / 2) + pointerY + 15,
      child: Transform.rotate(
        angle: initialAngle,
        child: _buildPointer(arrowColor, customPointer: customPointer),
      ),
    );
  }

  Widget _buildPointer(Color arrowColor, {Widget? customPointer}) {
    if (customPointer != null) {
      return customPointer;
    }
    return Container(
      width: 0,
      height: 0,
      decoration: BoxDecoration(
        border: Border(
          left: const BorderSide(color: Colors.transparent, width: 12),
          right: const BorderSide(color: Colors.transparent, width: 12),
          bottom: BorderSide(color: arrowColor, width: 20),
        ),
      ),
    );
  }

  // ========================================
  // SPINNING INDICATOR WIDGET
  // ========================================
  Widget _buildSpinningIndicator() {
    return Positioned(
      top: 20,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.orange.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            SizedBox(width: 8),
            Text(
              "Spinning...",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
