import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show Color;

// ========================================
// WHEEL SEGMENT ENTITY
// ========================================
// This entity represents each segment on the wheel.
// Each segment has its own unique ID, text, color, and probability.
// ========================================

class WheelSegment extends Equatable {
  // ========================================
  // PROPERTIES
  // ========================================
  final String id; // Unique segment identifier
  final String text; // Text to be displayed on the segment
  final Color color; // Segment color
  final double probability; // Probability of the segment being selected

  // ========================================
  // CONSTRUCTOR
  // ========================================
  const WheelSegment({
    required this.id, // Unique segment identifier
    required this.text, // Text to be displayed on the segment
    required this.color, // Segment color
    this.probability = 1.0, // Default weight
  });

  // ========================================
  // EQUATABLE IMPLEMENTATION
  // ========================================
  @override
  List<Object?> get props => [id, text, color, probability];

  // ========================================
  // COPY WITH METHOD
  // ========================================
  WheelSegment copyWith({
    String? id,
    String? text,
    Color? color,
    double? probability,
  }) {
    return WheelSegment(
      id: id ?? this.id,
      text: text ?? this.text,
      color: color ?? this.color,
      probability: probability ?? this.probability,
    );
  }

  // ========================================
  // TO STRING METHOD
  // ========================================
  @override
  String toString() {
    return 'WheelSegment(id: $id, text: $text, color: $color, probability: $probability)';
  }
}
