import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          _handleSpinCompletion();
        }
      });
    }
  }

  void _handleSpinCompletion() {
    final finalAngle =
        (_wheelController.currentAngle + (widget.initialAngle)) % (2 * pi);
    final selectedSegment = _getSelectedSegment(finalAngle);

    if (selectedSegment != null && widget.onFinish != null) {
      widget.onFinish!(selectedSegment);
    }
  }

  WheelSegment? _getSelectedSegment(double angle) {
    if (widget.segments.isEmpty) return null;

    final normalizedAngle = angle % (2 * pi);
    final adjustedAngle = (2 * pi - normalizedAngle) % (2 * pi);

    final totalWeight = widget.segments.fold<double>(
      0.0,
      (sum, segment) => sum + segment.probability,
    );

    if (totalWeight <= 0) {
      return widget.segments.first;
    }

    double currentAngle = 0.0;
    for (final segment in widget.segments) {
      final segmentAngle = (segment.probability / totalWeight) * 2 * pi;
      if (adjustedAngle >= currentAngle &&
          adjustedAngle < currentAngle + segmentAngle) {
        return segment;
      }
      currentAngle += segmentAngle;
    }
    return widget.segments.last;
  }

  void _initializeWheelState() {
    // Remove direct WheelBloc dependency
    // The wheel will work with the provided segments directly
  }

  // ========================================
  // MAIN BUILD METHOD
  // ========================================
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildWheelContent(),
        // Separate widget for dialog management
        // const WheelWidgetDialog(),
      ],
    );
  }

  // ========================================
  // CONTENT BUILDING METHODS
  // ========================================
  Widget _buildWheelContent() {
    return _buildLoadedState();
  }

  // ========================================
  // LOADED STATE WIDGETS
  // ========================================
  Widget _buildLoadedState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ========================================
        // WHEEL DISPLAY SECTION
        // ========================================
        _buildWheelDisplaySection(),

        // ========================================
        // CONTROLS SECTION
        // ========================================
        if (widget.showSpinButton)
          SizedBox(
            height: widget.removeSpinButtonOffset ? 0 : widget.spinButtonOffset,
          ),
        if (widget.showSpinButton) _buildControlsSection(),
      ],
    );
  }

  // ========================================
  // WHEEL DISPLAY SECTION WIDGETS
  // ========================================
  Widget _buildWheelDisplaySection() {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: context.read<WheelWidgetBloc>()),
            BlocProvider(create: (context) => WheelDisplayBloc()),
          ],
          child: WheelDisplay(
            key: ValueKey(widget.segments.map((e) => e.id).join(',')),
            segments: widget.segments,
            angle: _wheelController.currentAngle,
            size: widget.wheelSize,
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
            onWheelTap: widget.enableTapToSpin ? _handleWheelTap : null,
          ),
        );
      },
    );
  }

  void _handleWheelTap() {
    if (!_animationController.isAnimating) {
      _startSpinAnimation();
    }
  }

  // ========================================
  // CONTROLS SECTION WIDGETS
  // ========================================
  Widget _buildControlsSection() {
    return WheelControls(
      spinButtonText: widget.spinButtonText,
      spinButtonTextStyle: widget.spinButtonTextStyle,
      spinButtonColor: widget.spinButtonColor,
      spinButtonIcon: widget.spinButtonIcon,
      onSpinPressed: _handleSpinButtonPress,
      isSpinning: _animationController.isAnimating,
    );
  }

  void _handleSpinButtonPress() {
    if (!_animationController.isAnimating) {
      _startSpinAnimation();
    }
  }

  WheelSegment _pickWeightedRandomSegment(List<WheelSegment> segments) {
    final totalWeight =
        segments.fold<double>(0.0, (sum, s) => sum + s.probability);
    final rand = Random().nextDouble() * totalWeight;
    double cumulative = 0.0;
    for (final segment in segments) {
      cumulative += segment.probability;
      if (rand < cumulative) {
        return segment;
      }
    }
    return segments.last;
  }

  void _startSpinAnimation() {
    _wheelController.resetToInitialPosition();

    // Ağırlıklı rastgele segment seçimi
    final randomSegment = _pickWeightedRandomSegment(widget.segments);

    _wheelController.spinToSegment(
      selectedSegment: randomSegment,
      segments: widget.segments,
    );

    _animationController.forward();
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
