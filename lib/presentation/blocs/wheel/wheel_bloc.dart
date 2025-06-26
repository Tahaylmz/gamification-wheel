import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/wheel/wheel_segment.dart';
import '../../../domain/usecases/spin_wheel_usecase.dart';
import '../../../domain/repositories/wheel_repository.dart';
import 'events.dart';
import 'states.dart';

// BLoC
class WheelBloc extends Bloc<WheelEvent, WheelState> {
  final SpinWheelUseCase spinWheelUseCase;
  final WheelRepository wheelRepository;
  WheelSegment? _pendingResult;

  WheelBloc({
    required this.spinWheelUseCase,
    required this.wheelRepository,
  }) : super(WheelInitial()) {
    on<LoadWheelSegments>(_onLoadWheelSegments);
    on<LoadWheelSettings>(_onLoadWheelSettings);
    on<SpinWheel>(_onSpinWheel);
    on<CompleteWheelSpin>(_onCompleteWheelSpin);
    on<ResetWheel>(_onResetWheel);
    on<UpdateWheelSegments>(_onUpdateWheelSegments);
    on<UpdateWheelSize>(_onUpdateWheelSize);
    on<UpdateAnimationSpeed>(_onUpdateAnimationSpeed);
  }

  Future<void> _onLoadWheelSegments(
    LoadWheelSegments event,
    Emitter<WheelState> emit,
  ) async {
    emit(WheelLoading());

    final result = await wheelRepository.getWheelSegments();

    result.fold(
      (error) => emit(WheelError(error)),
      (segments) => emit(WheelLoaded(segments: segments)),
    );
  }

  Future<void> _onLoadWheelSettings(
    LoadWheelSettings event,
    Emitter<WheelState> emit,
  ) async {
    if (state is WheelLoaded) {
      final currentState = state as WheelLoaded;

      final sizeResult = await wheelRepository.getWheelSize();
      final speedResult = await wheelRepository.getAnimationSpeed();

      sizeResult.fold((error) => emit(WheelError(error)), (size) {
        speedResult.fold(
          (error) => emit(WheelError(error)),
          (speed) => emit(
            currentState.copyWith(wheelSize: size, animationSpeed: speed),
          ),
        );
      });
    }
  }

  Future<void> _onSpinWheel(SpinWheel event, Emitter<WheelState> emit) async {
    if (state is WheelLoaded) {
      final currentState = state as WheelLoaded;

      if (currentState.isSpinning || currentState.isAnimating) {
        return;
      }

      _pendingResult = null;

      emit(currentState.copyWith(isSpinning: true, clearLastResult: true));

      final result = await spinWheelUseCase(NoParams());

      result.fold((error) => emit(WheelError(error)), (selectedSegment) {
        _pendingResult = selectedSegment as WheelSegment?;

        emit(
          currentState.copyWith(
            isSpinning: false,
            isAnimating: true,
            clearLastResult: true,
          ),
        );
      });
    }
  }

  Future<void> _onCompleteWheelSpin(
    CompleteWheelSpin event,
    Emitter<WheelState> emit,
  ) async {
    if (state is WheelLoaded && _pendingResult != null) {
      final currentState = state as WheelLoaded;

      emit(
        currentState.copyWith(
          lastResult: _pendingResult,
          isAnimating: false,
          isSpinning: false,
        ),
      );

      _pendingResult = null;
    }
  }

  Future<void> _onResetWheel(ResetWheel event, Emitter<WheelState> emit) async {
    emit(WheelLoading());

    final resetResult = await wheelRepository.resetToDefaults();
    resetResult.fold(
      (error) => emit(WheelError(error)),
      (_) {
        // Load default segments
        _onLoadWheelSegments(LoadWheelSegments(), emit);
      },
    );
  }

  Future<void> _onUpdateWheelSegments(
    UpdateWheelSegments event,
    Emitter<WheelState> emit,
  ) async {
    if (state is WheelLoaded) {
      final currentState = state as WheelLoaded;

      emit(
        currentState.copyWith(
          segments: event.segments,
          lastResult: null,
          clearLastResult: true,
        ),
      );

      final result = await wheelRepository.updateWheelSegments(event.segments);
      result.fold(
        (error) {
          emit(WheelError(error));
        },
        (_) {
          // Success
        },
      );
    }
  }

  Future<void> _onUpdateWheelSize(
    UpdateWheelSize event,
    Emitter<WheelState> emit,
  ) async {
    if (state is WheelLoaded) {
      final currentState = state as WheelLoaded;

      // First update the UI
      emit(currentState.copyWith(wheelSize: event.size));

      // Then save to database
      final result = await wheelRepository.saveWheelSize(event.size);
      result.fold(
        (error) {
          emit(WheelError(error));
        },
        (_) {
          // Success
        },
      );
    }
  }

  Future<void> _onUpdateAnimationSpeed(
    UpdateAnimationSpeed event,
    Emitter<WheelState> emit,
  ) async {
    if (state is WheelLoaded) {
      final currentState = state as WheelLoaded;

      // First update the UI
      emit(currentState.copyWith(animationSpeed: event.speed));

      // Then save to database
      final result = await wheelRepository.saveAnimationSpeed(event.speed);
      result.fold(
        (error) {
          emit(WheelError(error));
        },
        (_) {
          // Success
        },
      );
    }
  }

  WheelSegment? get pendingResult => _pendingResult;
}
