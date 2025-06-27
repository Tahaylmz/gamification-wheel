import 'package:bloc/bloc.dart';
import 'events.dart';
import 'states.dart';

// BLOC
class WheelWidgetBloc extends Bloc<WheelWidgetEvent, WheelWidgetState> {
  WheelWidgetBloc() : super(const WheelWidgetState()) {
    on<ToggleConfigPanel>(_onToggleConfigPanel);
    on<SetDialogOpen>(_onSetDialogOpen);
    on<SetAnimationRunning>(_onSetAnimationRunning);
    on<SetResetLoading>(_onSetResetLoading);
    on<UpdatePreviousLastResult>(_onUpdatePreviousLastResult);
  }

  void _onToggleConfigPanel(
    ToggleConfigPanel event,
    Emitter<WheelWidgetState> emit,
  ) {
    emit(
      state.copyWith(
        showConfig: event.showConfig,
      ),
    );
  }

  void _onSetDialogOpen(SetDialogOpen event, Emitter<WheelWidgetState> emit) {
    emit(state.copyWith(isDialogOpen: event.isDialogOpen));
  }

  void _onSetAnimationRunning(
    SetAnimationRunning event,
    Emitter<WheelWidgetState> emit,
  ) {
    emit(state.copyWith(isAnimationRunning: event.isAnimationRunning));
  }

  void _onSetResetLoading(
    SetResetLoading event,
    Emitter<WheelWidgetState> emit,
  ) {
    emit(state.copyWith(isResetLoading: event.isResetLoading));
  }

  void _onUpdatePreviousLastResult(
    UpdatePreviousLastResult event,
    Emitter<WheelWidgetState> emit,
  ) {
    emit(state.copyWith(previousLastResultId: event.lastResultId));
  }
}
