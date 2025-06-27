import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart' show Colors, Color;
import '../../../domain/entities/wheel/wheel_segment.dart';
import 'events.dart';
import 'states.dart';

// BLOC
class WheelDisplayBloc extends Bloc<WheelDisplayEvent, WheelDisplayState> {
  WheelDisplayBloc() : super(const WheelDisplayState()) {
    on<UpdateWheelAngle>(_onUpdateWheelAngle);
    on<SetWheelSpinning>(_onSetWheelSpinning);
    on<UpdateWheelSize>(_onUpdateWheelSize);
    on<ResetWheelDisplay>(_onResetWheelDisplay);
  }

  void _onUpdateWheelAngle(
    UpdateWheelAngle event,
    Emitter<WheelDisplayState> emit,
  ) {
    emit(state.copyWith(angle: event.angle));
  }

  void _onSetWheelSpinning(
    SetWheelSpinning event,
    Emitter<WheelDisplayState> emit,
  ) {
    emit(state.copyWith(isSpinning: event.isSpinning));
  }

  void _onUpdateWheelSize(
    UpdateWheelSize event,
    Emitter<WheelDisplayState> emit,
  ) {
    emit(state.copyWith(size: event.size));
  }

  void _onResetWheelDisplay(
    ResetWheelDisplay event,
    Emitter<WheelDisplayState> emit,
  ) {
    emit(const WheelDisplayState());
  }

  // ========================================
  // CALCULATION METHODS
  // ========================================

  /// Calculates the segment under the arrow pointer
  WheelSegment getCurrentSegment(List<WheelSegment> segments, double angle) {
    // ========================================
    // VALIDATION
    // ========================================
    if (segments.isEmpty) {
      return const WheelSegment(id: '1', text: '1', color: Colors.red);
    }

    // ========================================
    // ANGLE NORMALIZATION
    // ========================================
    final normalizedAngle = _normalizeAngle(angle);

    // ========================================
    // WEIGHT CALCULATION
    // ========================================
    final totalWeight = _calculateTotalWeight(segments);
    if (totalWeight <= 0) {
      return segments.first;
    }

    // ========================================
    // SEGMENT DETECTION
    // ========================================
    return _findCurrentSegment(segments, normalizedAngle, totalWeight);
  }

  /// Normalizes the wheel's rotation angle (0-2π range)
  double _normalizeAngle(double angle) {
    return angle % (2 * 3.14159);
  }

  /// Calculates the total weight of segments
  double _calculateTotalWeight(List<WheelSegment> segments) {
    return segments.fold<double>(
      0.0,
      (sum, segment) => sum + segment.probability,
    );
  }

  /// Finds the current segment by checking weighted segments
  WheelSegment _findCurrentSegment(
    List<WheelSegment> segments,
    double normalizedAngle,
    double totalWeight,
  ) {
    // Since the arrow pointer is at the top (12 o'clock position)
    // we reverse the wheel's rotation angle
    final adjustedAngle = (2 * 3.14159 - normalizedAngle) % (2 * 3.14159);

    // Check weighted segments
    double currentAngle = 0.0;
    for (int i = 0; i < segments.length; i++) {
      final segment = segments[i];
      final segmentAngle = (segment.probability / totalWeight) * 2 * 3.14159;

      if (adjustedAngle >= currentAngle &&
          adjustedAngle < currentAngle + segmentAngle) {
        return segment;
      }

      currentAngle += segmentAngle;
    }

    // Fallback: last segment
    return segments.last;
  }

  /// Calculates the arrow color
  Color getArrowColor(WheelSegment currentSegment, double angle) {
    // Black if wheel hasn't started spinning, segment color if it has
    return angle == 0.0 ? Colors.black : currentSegment.color;
  }
}
