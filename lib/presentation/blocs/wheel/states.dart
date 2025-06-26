import 'package:equatable/equatable.dart';
import '../../../domain/entities/wheel/wheel_segment.dart';

// States
abstract class WheelState extends Equatable {
  const WheelState();

  @override
  List<Object?> get props => [];
}

class WheelInitial extends WheelState {}

class WheelLoading extends WheelState {}

class WheelLoaded extends WheelState {
  final List<WheelSegment> segments;
  final WheelSegment? lastResult;
  final bool isSpinning;
  final bool isAnimating;
  final double wheelSize;
  final double animationSpeed;

  const WheelLoaded({
    required this.segments,
    this.lastResult,
    this.isSpinning = false,
    this.isAnimating = false,
    this.wheelSize = 300.0,
    this.animationSpeed = 1.0, // 1x = normal hız
  });

  @override
  List<Object?> get props => [
    segments,
    lastResult,
    isSpinning,
    isAnimating,
    wheelSize,
    animationSpeed,
  ];

  WheelLoaded copyWith({
    List<WheelSegment>? segments,
    WheelSegment? lastResult,
    bool? isSpinning,
    bool? isAnimating,
    double? wheelSize,
    double? animationSpeed,
    bool clearLastResult = false,
  }) {
    return WheelLoaded(
      segments: segments ?? this.segments,
      lastResult: clearLastResult ? null : (lastResult ?? this.lastResult),
      isSpinning: isSpinning ?? this.isSpinning,
      isAnimating: isAnimating ?? this.isAnimating,
      wheelSize: wheelSize ?? this.wheelSize,
      animationSpeed: animationSpeed ?? this.animationSpeed,
    );
  }
}

class WheelError extends WheelState {
  final String message;

  const WheelError(this.message);

  @override
  List<Object?> get props => [message];
}
