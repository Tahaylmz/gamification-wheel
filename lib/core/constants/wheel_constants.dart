import 'package:flutter/material.dart';

// ========================================
// WHEEL ANIMATION CONSTANTS
// ========================================
class WheelAnimationConstants {
  // Mathematical constants
  static const double twoPi = 2 * 3.14159265359;
  static const double randomOffsetFactor = 0.6;

  // Rotation constants
  static const int minFullTurns = 6;
  static const int maxFullTurns = 10;

  // Animation constants
  static const double animationBegin = 0.0;
  static const double animationEnd = 1.0;

  // Angle calculation constants
  static const double angleDivisionFactor = 2.0;
  static const double defaultAngle = 0.0;
}

// ========================================
// WHEEL CONFIG CONSTANTS
// ========================================
class WheelConfigConstants {
  // Size constants
  static const double minSize = 200.0;
  static const double maxSize = 400.0;
  static const int sizeDivisions = 20;

  // Speed constants (1x = normal speed, 2x = 2 times faster, etc.)
  static const double minSpeed = 0.5; // 0.5x = very slow
  static const double maxSpeed = 3.0; // 3x = very fast
  static const int speedDivisions = 5; // 0.5, 1, 1.5, 2, 2.5, 3

  // Probability constants
  static const double minProbability = 0.1;
  static const double maxProbability = 100.0;
  static const double defaultProbability = 1.0;

  // Input constants
  static const int maxNameLength = 10;

  // Padding constants
  static const cardPadding = EdgeInsets.all(16);
  static const segmentPadding = EdgeInsets.all(12);
  static const indicatorPadding = EdgeInsets.all(8);

  // Border radius constants
  static const double borderRadius = 12.0;
  static const double segmentBorderRadius = 8.0;
  static const double indicatorBorderRadius = 6.0;

  // Size constants
  static const double colorPickerSize = 30.0;
  static const double sizeIndicatorWidth = 60.0;
  static const double sizeIndicatorHeight = 8.0;

  // Color palette
  static const List<String> availableColors = [
    '#FF6B6B', // Red
    '#4ECDC4', // Turquoise
    '#45B7D1', // Light blue
    '#96CEB4', // Light green
    '#FFEAA7', // Yellow
    '#DDA0DD', // Purple
    '#FF8A80', // Light red
    '#80CBC4', // Light turquoise
    '#81D4FA', // Light blue
    '#A5D6A7', // Light green
    '#FFF59D', // Light yellow
    '#CE93D8', // Light purple
    '#FF5722', // Orange
    '#009688', // Teal
    '#2196F3', // Blue
    '#4CAF50', // Green
    '#FFC107', // Amber
    '#9C27B0', // Purple
    '#795548', // Brown
    '#607D8B', // Blue-grey
    '#E91E63', // Pink
    '#00BCD4', // Cyan
    '#3F51B5', // Indigo
    '#8BC34A', // Light green
  ];
}

// ========================================
// WHEEL GENERAL CONSTANTS
// ========================================
class WheelGeneralConstants {
  // Minimum segment count
  static const int minSegmentCount = 2;

  // Default values
  static const double defaultWheelSize = 300.0;
  static const double defaultAnimationSpeed = 3.0; // 3x = fast

  // Animation durations
  static const Duration defaultAnimationDuration = Duration(seconds: 6);
  static const Duration resultDialogDelay = Duration(milliseconds: 100);

  // UI constants
  static const double defaultOpacity = 0.1;
  static const double defaultBlurRadius = 10.0;
  static const Offset defaultShadowOffset = Offset(0, 5);
}
