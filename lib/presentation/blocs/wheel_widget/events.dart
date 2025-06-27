import 'package:equatable/equatable.dart';

// EVENTS
abstract class WheelWidgetEvent extends Equatable {
  const WheelWidgetEvent();
  @override
  List<Object?> get props => [];
}

class ToggleConfigPanel extends WheelWidgetEvent {
  final bool showConfig;
  const ToggleConfigPanel(this.showConfig);

  @override
  List<Object?> get props => [showConfig];
}

class SetDialogOpen extends WheelWidgetEvent {
  final bool isDialogOpen;
  const SetDialogOpen(this.isDialogOpen);

  @override
  List<Object?> get props => [isDialogOpen];
}

class SetAnimationRunning extends WheelWidgetEvent {
  final bool isAnimationRunning;
  const SetAnimationRunning(this.isAnimationRunning);

  @override
  List<Object?> get props => [isAnimationRunning];
}

class SetResetLoading extends WheelWidgetEvent {
  final bool isResetLoading;
  const SetResetLoading(this.isResetLoading);

  @override
  List<Object?> get props => [isResetLoading];
}

class UpdatePreviousLastResult extends WheelWidgetEvent {
  final String? lastResultId;
  const UpdatePreviousLastResult(this.lastResultId);

  @override
  List<Object?> get props => [lastResultId];
}
