import 'package:equatable/equatable.dart';

// STATES
class WheelWidgetState extends Equatable {
  final bool showConfig;
  final bool isDialogOpen;
  final bool isAnimationRunning;
  final bool isResetLoading;
  final String? previousLastResultId;

  const WheelWidgetState({
    this.showConfig = false,
    this.isDialogOpen = false,
    this.isAnimationRunning = false,
    this.isResetLoading = false,
    this.previousLastResultId,
  });

  WheelWidgetState copyWith({
    bool? showConfig,
    bool? isDialogOpen,
    bool? isAnimationRunning,
    bool? isResetLoading,
    String? previousLastResultId,
  }) {
    return WheelWidgetState(
      showConfig: showConfig ?? this.showConfig,
      isDialogOpen: isDialogOpen ?? this.isDialogOpen,
      isAnimationRunning: isAnimationRunning ?? this.isAnimationRunning,
      isResetLoading: isResetLoading ?? this.isResetLoading,
      previousLastResultId: previousLastResultId ?? this.previousLastResultId,
    );
  }

  @override
  List<Object?> get props => [
        showConfig,
        isDialogOpen,
        isAnimationRunning,
        isResetLoading,
        previousLastResultId,
      ];
}
