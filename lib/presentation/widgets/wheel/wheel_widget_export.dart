// ========================================
// WHEEL WIDGET EXPORT
// ========================================
// This file makes WheelWidget exportable
// Can be used in other projects

// Main Widget
export 'wheel_widget.dart';

// Sub Widgets
export 'wheel_display.dart';
export 'wheel_controls.dart';
export 'wheel_animation_controller.dart';

// BLoCs - Only export WheelWidgetBloc since WheelWidget is self-contained
export '../../blocs/wheel_widget/wheel_widget_bloc.dart';
export '../../blocs/wheel_widget/events.dart';
export '../../blocs/wheel_widget/states.dart';

// Entities
export '../../../domain/entities/wheel/wheel_segment.dart';

// Constants
export '../../../core/constants/wheel_constants.dart';
export '../../../core/constants/color_constants.dart';
