import 'package:flutter/material.dart';

/// Color utility class - Helper functions for color operations
class ColorUtils {
  /// Converts hex string to Color object
  ///
  /// [colorString] Color string in hex format (e.g., "#FF6B6B" or "FF6B6B")
  /// [fallbackColor] Default color to return in case of error
  ///
  /// Returns: Color object
  static Color parseColor(String colorString,
      {Color fallbackColor = Colors.red}) {
    try {
      // Remove # and add 0xFF prefix
      String hexColor = colorString.replaceAll('#', '');
      if (hexColor.length == 6) {
        hexColor = '0xFF$hexColor';
      }
      return Color(int.parse(hexColor));
    } catch (e) {
      return fallbackColor;
    }
  }

  /// Checks if the color string is valid
  ///
  /// [colorString] Color string to check
  ///
  /// Returns: true if it's a valid hex color string
  static bool isValidColor(String colorString) {
    try {
      String hexColor = colorString.replaceAll('#', '');
      if (hexColor.length != 6) return false;
      int.parse(hexColor, radix: 16);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Normalizes color string (adds # if missing)
  ///
  /// [colorString] Color string to normalize
  ///
  /// Returns: Normalized color string
  static String normalizeColor(String colorString) {
    if (colorString.startsWith('#')) {
      return colorString;
    }
    return '#$colorString';
  }
}
