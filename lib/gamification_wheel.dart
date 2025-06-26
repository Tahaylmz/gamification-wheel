// ========================================
// GAMIFICATION WHEEL PACKAGE
// ========================================
// Main export file for the gamification wheel package
// This file exports all public APIs

// Main Widget
export 'presentation/widgets/wheel/wheel_widget.dart';

// Sub Widgets
export 'presentation/widgets/wheel/wheel_display.dart';
export 'presentation/widgets/wheel/wheel_controls.dart';
export 'presentation/widgets/wheel/wheel_animation_controller.dart';

// BLoCs - Resolving conflicting names with hide
export 'presentation/blocs/wheel/wheel_bloc.dart';
export 'presentation/blocs/wheel/events.dart'
    hide UpdateWheelSize, UpdateAnimationSpeed;
export 'presentation/blocs/wheel/states.dart';
export 'presentation/blocs/wheel_display/wheel_display_bloc.dart';
export 'presentation/blocs/wheel_display/events.dart';
export 'presentation/blocs/wheel_display/states.dart';

// Entities
export 'domain/entities/wheel/wheel_segment.dart';

// Constants
export 'core/constants/wheel_constants.dart';
export 'core/constants/color_constants.dart';

// Utils
export 'utils/color_utils.dart';

// Repository Interface
export 'domain/repositories/wheel_repository.dart';

// Use Cases
export 'domain/usecases/spin_wheel_usecase.dart';

// Implementation
export 'data/repositories/wheel_repository_impl.dart';
