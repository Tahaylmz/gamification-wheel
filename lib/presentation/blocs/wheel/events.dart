import 'package:equatable/equatable.dart';
import '../../../domain/entities/wheel/wheel_segment.dart';

// EVENTS
abstract class WheelEvent extends Equatable {
  const WheelEvent();
  @override
  List<Object?> get props => [];
}

class LoadWheelSegments extends WheelEvent {}

class LoadWheelSettings extends WheelEvent {}

class SpinWheel extends WheelEvent {}

class CompleteWheelSpin extends WheelEvent {}

class ResetWheel extends WheelEvent {}

class UpdateWheelSegments extends WheelEvent {
  final List<WheelSegment> segments;
  const UpdateWheelSegments(this.segments);

  @override
  List<Object?> get props => [segments];
}

class UpdateWheelSize extends WheelEvent {
  final double size;
  const UpdateWheelSize(this.size);

  @override
  List<Object?> get props => [size];
}

class UpdateAnimationSpeed extends WheelEvent {
  final double speed;
  const UpdateAnimationSpeed(this.speed);

  @override
  List<Object?> get props => [speed];
}
 