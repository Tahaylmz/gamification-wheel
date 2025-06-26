import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/wheel/wheel_bloc.dart';
import '../../blocs/wheel/events.dart';
import '../../blocs/wheel/states.dart';
import '../../blocs/wheel_widget/wheel_widget_bloc.dart';
import '../../blocs/wheel_widget/events.dart' as widget_events;
import 'wheel_animation_controller.dart';
import 'wheel_display.dart';
import 'wheel_controls.dart';
// import '../dialogs/wheel_widget_dialog.dart';
import '../../blocs/wheel_display/wheel_display_bloc.dart';
import '../../../domain/entities/wheel/wheel_segment.dart';

/// WheelWidget: Main widget of the wheel with BLoC state management
/// This widget can be exported and used in other projects
class WheelWidget extends StatelessWidget {
  final List<WheelSegment> segments;
  final double? wheelSize;
  final double? animationSpeed;
  final bool? showSpinButton;
  final bool? showPointer;
  final double? pointerOffset;
  final double? spinButtonOffset;
  final bool? removeSpinButtonOffset;
  final Color? pointerColor;
  final bool? animatePointerColor;
  final void Function(WheelSegment result)? onFinish;
  final bool? enableTapToSpin;
  final bool? showCenterDot;
  final bool? showWheelBorder;
  final Color? wheelBorderColor;
  final double? wheelBorderWidth;
  final TextStyle? segmentTextStyle;
  final double? segmentFontSize;
  final FontWeight? segmentFontWeight;
  final Color? segmentTextColor;
  final bool? showWheelShadow;
  final double? wheelShadowBlur;
  final double? wheelShadowOffsetX;
  final double? wheelShadowOffsetY;
  final Color? wheelShadowColor;
  final String? spinButtonText;
  final TextStyle? spinButtonTextStyle;
  final Color? spinButtonColor;
  final Widget? spinButtonIcon;
  final Curve? spinCurve;
  final double? initialAngle;
  final double? segmentGap;
  final Widget? centerWidget;
  final Widget? customSpinButton;
  final Widget? customPointer;
  final void Function(double progress)? onSpinning;
  final VoidCallback? onSpinStart;
  final VoidCallback? onSpinEnd;

  const WheelWidget({
    super.key,
    required this.segments,
    this.wheelSize = 300,
    this.animationSpeed,
    this.showSpinButton = true,
    this.showPointer = true,
    this.pointerOffset = 16,
    this.spinButtonOffset = 16,
    this.removeSpinButtonOffset = false,
    this.pointerColor = Colors.black,
    this.animatePointerColor = true,
    this.onFinish,
    this.enableTapToSpin = true,
    this.showCenterDot = true,
    this.showWheelBorder = false,
    this.wheelBorderColor = Colors.white,
    this.wheelBorderWidth = 4.0,
    this.segmentTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    this.segmentFontSize = 18,
    this.segmentFontWeight = FontWeight.bold,
    this.segmentTextColor = Colors.white,
    this.showWheelShadow = true,
    this.wheelShadowBlur = 20.0,
    this.wheelShadowOffsetX = 0,
    this.wheelShadowOffsetY = 10.0,
    this.wheelShadowColor = Colors.black26,
    this.spinButtonText = 'Spin!',
    this.spinButtonTextStyle = const TextStyle(
      fontSize: 18,
      color: Colors.white,
    ),
    this.spinButtonColor = Colors.blue,
    this.spinButtonIcon = const Icon(Icons.arrow_forward),
    this.spinCurve = Curves.easeOutQuart,
    this.initialAngle = 2 * pi,
    this.segmentGap = 0.0,
    this.centerWidget,
    this.onSpinning,
    this.customSpinButton,
    this.customPointer,
    this.onSpinStart,
    this.onSpinEnd,
  });

  @override
  Widget build(BuildContext context) {
    final double clampedAnimationSpeed =
        animationSpeed != null ? animationSpeed!.clamp(0.5, 3.0) : 1.0;
    final double clampedWheelSize =
        wheelSize != null ? wheelSize!.clamp(100.0, 600) : 300.0;
    final double clampedSegmentGap =
        segmentGap != null ? segmentGap!.clamp(0.0, 10.0) : 0.0;
    return BlocProvider(
      create: (context) => WheelWidgetBloc(),
      child: _WheelWidgetContent(
        segments: segments,
        wheelSize: clampedWheelSize,
        animationSpeed: clampedAnimationSpeed,
        showSpinButton: showSpinButton!,
        showPointer: showPointer!,
        pointerOffset: pointerOffset!,
        spinButtonOffset: spinButtonOffset!,
        removeSpinButtonOffset: removeSpinButtonOffset!,
        pointerColor: pointerColor!,
        animatePointerColor: animatePointerColor!,
        onFinish: onFinish!,
        enableTapToSpin: enableTapToSpin!,
        showCenterDot: showCenterDot!,
        showWheelBorder: showWheelBorder!,
        wheelBorderColor: wheelBorderColor!,
        wheelBorderWidth: wheelBorderWidth!,
        segmentTextStyle: segmentTextStyle!,
        segmentFontSize: segmentFontSize!,
        segmentFontWeight: segmentFontWeight!,
        segmentTextColor: segmentTextColor!,
        showWheelShadow: showWheelShadow!,
        wheelShadowBlur: wheelShadowBlur!,
        wheelShadowColor: wheelShadowColor!,
        wheelShadowOffsetX: wheelShadowOffsetX!,
        wheelShadowOffsetY: wheelShadowOffsetY!,
        spinButtonText: spinButtonText!,
        spinButtonTextStyle: spinButtonTextStyle!,
        spinButtonColor: spinButtonColor!,
        spinButtonIcon: spinButtonIcon!,
        spinCurve: spinCurve!,
        initialAngle: initialAngle!,
        segmentGap: clampedSegmentGap,
        centerWidget: centerWidget,
        onSpinning: onSpinning!,
        onSpinStart: onSpinStart,
        onSpinEnd: onSpinEnd,
      ),
    );
  }
}

class _WheelWidgetContent extends StatefulWidget {
  final List<WheelSegment> segments;
  final double wheelSize;
  final double animationSpeed;
  final bool showSpinButton;
  final bool showPointer;
  final double pointerOffset;
  final double spinButtonOffset;
  final bool removeSpinButtonOffset;
  final Color pointerColor;
  final bool animatePointerColor;
  final void Function(WheelSegment result)? onFinish;
  final bool enableTapToSpin;
  final bool showCenterDot;
  final bool showWheelBorder;
  final Color wheelBorderColor;
  final double wheelBorderWidth;
  final TextStyle segmentTextStyle;
  final double segmentFontSize;
  final FontWeight segmentFontWeight;
  final Color segmentTextColor;
  final bool showWheelShadow;
  final double wheelShadowBlur;
  final double wheelShadowOffsetX;
  final double wheelShadowOffsetY;
  final Color wheelShadowColor;
  final String spinButtonText;
  final TextStyle spinButtonTextStyle;
  final Color spinButtonColor;
  final Widget spinButtonIcon;
  final Curve spinCurve;
  final double initialAngle;
  final double segmentGap;
  final Widget? centerWidget;
  final void Function(double progress)? onSpinning;
  final VoidCallback? onSpinStart;
  final VoidCallback? onSpinEnd;

  const _WheelWidgetContent({
    required this.segments,
    required this.wheelSize,
    required this.animationSpeed,
    required this.showSpinButton,
    required this.showPointer,
    required this.pointerOffset,
    required this.spinButtonOffset,
    required this.removeSpinButtonOffset,
    required this.pointerColor,
    required this.animatePointerColor,
    required this.onFinish,
    required this.enableTapToSpin,
    required this.showCenterDot,
    required this.showWheelBorder,
    required this.wheelBorderColor,
    required this.wheelBorderWidth,
    required this.segmentTextStyle,
    required this.segmentFontSize,
    required this.segmentFontWeight,
    required this.segmentTextColor,
    required this.showWheelShadow,
    required this.wheelShadowBlur,
    required this.wheelShadowColor,
    required this.wheelShadowOffsetX,
    required this.wheelShadowOffsetY,
    required this.spinButtonText,
    required this.spinButtonTextStyle,
    required this.spinButtonColor,
    required this.spinButtonIcon,
    required this.spinCurve,
    required this.initialAngle,
    required this.segmentGap,
    this.centerWidget,
    this.onSpinning,
    this.onSpinStart,
    this.onSpinEnd,
  });

  @override
  State<_WheelWidgetContent> createState() => _WheelWidgetContentState();
}

class _WheelWidgetContentState extends State<_WheelWidgetContent>
    with SingleTickerProviderStateMixin {
  // ========================================
  // ANIMATION CONTROLLERS
  // ========================================
  late AnimationController _animationController;
  late WheelAnimationController _wheelController;

  // ========================================
  // INITIALIZATION
  // ========================================
  @override
  void initState() {
    super.initState();
    _initializeAnimation();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeWheelState();
    });
  }

  void _initializeAnimation() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    );

    _wheelController = WheelAnimationController(_animationController,
        spinCurve: widget.spinCurve);

    _animationController.addListener(() {
      _onAnimationUpdate();
      if (widget.onSpinning != null) {
        widget.onSpinning!(_animationController.value);
      }
    });
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.forward && widget.onSpinStart != null) {
        widget.onSpinStart!();
      }
      if (status == AnimationStatus.completed && widget.onSpinEnd != null) {
        widget.onSpinEnd!();
      }
      _onAnimationStatusChanged(status);
    });
  }

  void _onAnimationUpdate() {
    _wheelController.updateAngle(_wheelController.animation.value);
  }

  // ========================================
  // ANIMATION STATUS HANDLING
  // ========================================
  void _onAnimationStatusChanged(AnimationStatus status) {
    final widgetBloc = context.read<WheelWidgetBloc>();
    final isRunning =
        status == AnimationStatus.forward || status == AnimationStatus.reverse;

    widgetBloc.add(widget_events.SetAnimationRunning(isRunning));

    if (status == AnimationStatus.completed) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          context.read<WheelBloc>().add(CompleteWheelSpin());
        }
      });
    }
  }

  void _initializeWheelState() {
    final bloc = context.read<WheelBloc>();
    bloc.add(UpdateWheelSegments(widget.segments));
    bloc.add(UpdateWheelSize(widget.wheelSize));
    bloc.add(UpdateAnimationSpeed(widget.animationSpeed));
  }

  // ========================================
  // MAIN BUILD METHOD
  // ========================================
  @override
  Widget build(BuildContext context) {
    return BlocListener<WheelBloc, WheelState>(
      listener: (context, state) {
        _handleBlocStateChanges(context, state);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          BlocBuilder<WheelBloc, WheelState>(
            builder: _buildWheelContent,
          ),
          // Separate widget for dialog management
          // const WheelWidgetDialog(),
        ],
      ),
    );
  }

  // ========================================
  // BLOC STATE HANDLING
  // ========================================
  void _handleBlocStateChanges(BuildContext context, WheelState state) {
    if (state is WheelLoaded) {
      // Print result to console if available
      if (state.lastResult != null) {
        // ignore: avoid_print
        print('Wheel result: \n${state.lastResult}');
        if (widget.onFinish != null) {
          widget.onFinish!(state.lastResult!);
        }
      }
      // ========================================
      // ANIMATION SPEED UPDATE HANDLING
      // ========================================
      _updateAnimationSpeedFromState(state.animationSpeed);

      // ========================================
      // ANIMATION START HANDLING
      // ========================================
      _handleAnimationStart(state);
    }
  }

  void _updateAnimationSpeedFromState(double speed) {
    // Calculate duration based on speed multiplier
    const baseDuration = 6.0; // 6 seconds for normal speed
    final calculatedDuration = baseDuration / speed;
    _animationController.duration = Duration(
      milliseconds: (calculatedDuration * 1000).toInt(),
    );
  }

  void _handleAnimationStart(WheelLoaded state) {
    final bloc = context.read<WheelBloc>();
    final widgetBloc = context.read<WheelWidgetBloc>();

    if (state.isAnimating &&
        !widgetBloc.state.isAnimationRunning &&
        bloc.pendingResult != null) {
      _wheelController.resetToInitialPosition();
      _wheelController.spinToSegment(
        selectedSegment: bloc.pendingResult!,
        segments: state.segments,
      );
    }
  }

  // ========================================
  // CONTENT BUILDING METHODS
  // ========================================
  Widget _buildWheelContent(BuildContext context, WheelState state) {
    if (state is WheelLoading) {
      return _buildLoadingState();
    } else if (state is WheelLoaded) {
      return _buildLoadedState(state);
    } else if (state is WheelError) {
      return _buildErrorState(state);
    }

    return const Center(child: Text("Yükleniyor..."));
  }

  // ========================================
  // LOADING STATE WIDGETS
  // ========================================
  Widget _buildLoadingState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
        ],
      ),
    );
  }

  // ========================================
  // LOADED STATE WIDGETS
  // ========================================
  Widget _buildLoadedState(WheelLoaded state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ========================================
        // WHEEL DISPLAY SECTION
        // ========================================
        _buildWheelDisplaySection(state),

        // ========================================
        // CONTROLS SECTION
        // ========================================
        if (widget.showSpinButton)
          SizedBox(
            height: widget.removeSpinButtonOffset ? 0 : widget.spinButtonOffset,
          ),
        if (widget.showSpinButton) _buildControlsSection(state),
      ],
    );
  }

  // ========================================
  // WHEEL DISPLAY SECTION WIDGETS
  // ========================================
  Widget _buildWheelDisplaySection(WheelLoaded state) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => WheelDisplayBloc(),
          child: WheelDisplay(
            key: ValueKey(state.segments.map((e) => e.id).join(',')),
            segments: state.segments,
            angle: _wheelController.currentAngle,
            size: state.wheelSize,
            showPointer: widget.showPointer,
            pointerOffset: widget.pointerOffset,
            pointerColor: widget.pointerColor,
            animatePointerColor: widget.animatePointerColor,
            enableTapToSpin: widget.enableTapToSpin,
            showCenterDot: widget.showCenterDot,
            showWheelBorder: widget.showWheelBorder,
            wheelBorderColor: widget.wheelBorderColor,
            wheelBorderWidth: widget.wheelBorderWidth,
            segmentTextStyle: widget.segmentTextStyle,
            segmentFontSize: widget.segmentFontSize,
            segmentFontWeight: widget.segmentFontWeight,
            segmentTextColor: widget.segmentTextColor,
            showWheelShadow: widget.showWheelShadow,
            wheelShadowBlur: widget.wheelShadowBlur,
            wheelShadowColor: widget.wheelShadowColor,
            wheelShadowOffsetX: widget.wheelShadowOffsetX,
            wheelShadowOffsetY: widget.wheelShadowOffsetY,
            initialAngle: widget.initialAngle,
            segmentGap: widget.segmentGap,
            centerWidget: widget.centerWidget,
          ),
        );
      },
    );
  }

  // ========================================
  // CONTROLS SECTION WIDGETS
  // ========================================
  Widget _buildControlsSection(WheelLoaded state) {
    return WheelControls(
      spinButtonText: widget.spinButtonText,
      spinButtonTextStyle: widget.spinButtonTextStyle,
      spinButtonColor: widget.spinButtonColor,
      spinButtonIcon: widget.spinButtonIcon,
    );
  }

  // ========================================
  // ERROR STATE WIDGETS
  // ========================================
  Widget _buildErrorState(WheelError state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
          const SizedBox(height: 16),
          Text(
            "Hata: ${state.message}",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () => context.read<WheelBloc>().add(LoadWheelSegments()),
            icon: const Icon(Icons.refresh),
            label: const Text("Tekrar Dene"),
          ),
        ],
      ),
    );
  }

  // ========================================
  // DISPOSE
  // ========================================
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

typedef GWheel = WheelWidget;
