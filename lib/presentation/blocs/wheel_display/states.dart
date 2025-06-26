import 'package:equatable/equatable.dart';

// STATES
class WheelDisplayState extends Equatable {
  final double angle;
  final bool isSpinning;
  final double size;
  final double animationSpeed;

  const WheelDisplayState({
    this.angle = 0.0,
    this.isSpinning = false,
    this.size = 300.0,
    this.animationSpeed = 1.0,
  });

  WheelDisplayState copyWith({
    double? angle,
    bool? isSpinning,
    double? size,
    double? animationSpeed,
  }) {
    return WheelDisplayState(
      angle: angle ?? this.angle,
      isSpinning: isSpinning ?? this.isSpinning,
      size: size ?? this.size,
      animationSpeed: animationSpeed ?? this.animationSpeed,
    );
  }

  @override
  List<Object?> get props => [angle, isSpinning, size, animationSpeed];
}
