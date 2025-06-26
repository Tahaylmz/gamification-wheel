import 'package:equatable/equatable.dart';

// EVENTS
abstract class WheelDisplayEvent extends Equatable {
  const WheelDisplayEvent();
  @override
  List<Object?> get props => [];
}

class UpdateWheelAngle extends WheelDisplayEvent {
  final double angle;
  const UpdateWheelAngle(this.angle);

  @override
  List<Object?> get props => [angle];
}

class SetWheelSpinning extends WheelDisplayEvent {
  final bool isSpinning;
  const SetWheelSpinning(this.isSpinning);

  @override
  List<Object?> get props => [isSpinning];
}

class UpdateWheelSize extends WheelDisplayEvent {
  final double size;
  const UpdateWheelSize(this.size);

  @override
  List<Object?> get props => [size];
}

class ResetWheelDisplay extends WheelDisplayEvent {}
