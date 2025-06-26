import 'dart:math';
import 'package:flutter/material.dart';
import '../../../domain/entities/wheel/wheel_segment.dart';
import '../../../core/constants/wheel_constants.dart';

// WheelAnimationController: Controller that manages wheel animation
class WheelAnimationController {
  // ========================================
  // PROPERTIES
  // ========================================
  final AnimationController controller;
  final Curve spinCurve;
  late Animation<double> _animation;
  double _currentAngle = WheelAnimationConstants.defaultAngle;

  // Cache variables
  double? _cachedTotalWeight;
  List<WheelSegment>? _cachedSegments;

  // ========================================
  // CONSTRUCTOR
  // ========================================
  WheelAnimationController(this.controller,
      {this.spinCurve = Curves.easeOutQuart}) {
    _initializeAnimation();
  }

  // ========================================
  // GETTERS
  // ========================================
  Animation<double> get animation => _animation;
  double get currentAngle => _currentAngle;
  double get normalizedAngle => _currentAngle % WheelAnimationConstants.twoPi;

  // ========================================
  // INITIALIZATION METHODS
  // ========================================
  void _initializeAnimation() {
    _animation = Tween<double>(
      begin: WheelAnimationConstants.animationBegin,
      end: WheelAnimationConstants.animationEnd,
    ).animate(CurvedAnimation(parent: controller, curve: spinCurve));
  }

  // ========================================
  // SPIN METHODS
  // ========================================
  void spinToSegment({
    required WheelSegment selectedSegment,
    required List<WheelSegment> segments,
  }) {
    // ========================================
    // VALIDATION
    // ========================================
    if (segments.isEmpty) {
      return;
    }

    // ========================================
    // CALCULATE TOTAL WEIGHT
    // ========================================
    final totalWeight = _calculateTotalWeight(segments);
    if (totalWeight <= 0.0) {
      return;
    }

    // ========================================
    // CALCULATE TARGET ANGLE
    // ========================================
    final targetAngle = _calculateTargetAngle(
      selectedSegment,
      segments,
      totalWeight,
    );

    // ========================================
    // ADD RANDOM OFFSET
    // ========================================
    final finalTargetAngle = _addRandomOffset(
      targetAngle,
      selectedSegment,
      totalWeight,
    );

    // ========================================
    // CALCULATE FINAL ANGLE WITH TURNS
    // ========================================
    final finalAngle = _calculateFinalAngle(finalTargetAngle);

    // ========================================
    // CREATE AND START ANIMATION
    // ========================================
    _createAndStartAnimation(finalAngle);
  }

  // ========================================
  // CALCULATION METHODS
  // ========================================
  double _calculateTotalWeight(List<WheelSegment> segments) {
    // Cache control
    if (_cachedSegments == segments && _cachedTotalWeight != null) {
      return _cachedTotalWeight!;
    }

    final totalWeight = segments.fold<double>(
      0.0,
      (sum, segment) => sum + segment.probability,
    );

    // Update cache
    _cachedSegments = segments;
    _cachedTotalWeight = totalWeight;

    return totalWeight;
  }

  double _calculateTargetAngle(
    WheelSegment selectedSegment,
    List<WheelSegment> segments,
    double totalWeight,
  ) {
    double targetAngle = 0.0;
    double currentWeight = 0.0;

    for (int i = 0; i < segments.length; i++) {
      final segment = segments[i];

      if (segment.id == selectedSegment.id) {
        // Go to the middle of this segment
        final segmentAngle =
            (segment.probability / totalWeight) * WheelAnimationConstants.twoPi;
        targetAngle = currentWeight +
            (segmentAngle / WheelAnimationConstants.angleDivisionFactor);
        break;
      }

      currentWeight +=
          (segment.probability / totalWeight) * WheelAnimationConstants.twoPi;
    }

    // Since the wheel rotates clockwise, segments are in reverse order
    // Reverse the angle
    return WheelAnimationConstants.twoPi - targetAngle;
  }

  double _addRandomOffset(
    double targetAngle,
    WheelSegment selectedSegment,
    double totalWeight,
  ) {
    final selectedSegmentWeight = selectedSegment.probability;
    final segmentAngle =
        (selectedSegmentWeight / totalWeight) * WheelAnimationConstants.twoPi;
    final randomOffset = Random().nextDouble() *
        segmentAngle *
        WheelAnimationConstants.randomOffsetFactor;
    return targetAngle +
        randomOffset -
        (segmentAngle / WheelAnimationConstants.angleDivisionFactor);
  }

  double _calculateFinalAngle(double targetAngle) {
    final fullTurns = WheelAnimationConstants.minFullTurns +
        Random().nextInt(
          WheelAnimationConstants.maxFullTurns -
              WheelAnimationConstants.minFullTurns +
              1,
        );

    final finalAngle = _currentAngle +
        (fullTurns * WheelAnimationConstants.twoPi) +
        targetAngle;

    return finalAngle;
  }

  // ========================================
  // ANIMATION METHODS
  // ========================================
  void _createAndStartAnimation(double finalAngle) {
    _animation = Tween<double>(begin: _currentAngle, end: finalAngle).animate(
      CurvedAnimation(parent: controller, curve: spinCurve),
    );
    controller.reset();
    controller.forward();
  }

  void updateAngle(double value) {
    _currentAngle = value;
  }

  void resetToInitialPosition() {
    // Reset the wheel to its initial position
    controller.reset();
    _currentAngle = WheelAnimationConstants.defaultAngle;

    // Clear cache
    _cachedTotalWeight = null;
    _cachedSegments = null;
  }

  // ========================================
  // DISPOSE METHOD
  // ========================================
  void dispose() {
    _cachedTotalWeight = null;
    _cachedSegments = null;
  }
}

// ========================================
// CUSTOM ANIMATION CURVE
// ========================================
// Our custom animation curve - starts fast, then slows down
class CustomWheelCurve extends Curve {
  const CustomWheelCurve();

  @override
  double transform(double t) {
    // Simple and natural animation: start fast, then slow down
    // t^2 to create a curve that starts fast, then slows down
    return WheelAnimationConstants.animationEnd -
        pow(WheelAnimationConstants.animationEnd - t, 3).toDouble();
  }
}
