import 'package:flutter/material.dart';
import '../../domain/entities/wheel/wheel_segment.dart';
import '../widgets/wheel/wheel_widget.dart';

Color _rainbowColor(int index, int total) {
  final hue = (index * 360 / total) % 360;
  return HSLColor.fromAHSL(1.0, hue, 0.85, 0.55).toColor();
}

String _colorToHex(Color color) => '#'
        '${(color.r * 255).round().toRadixString(16).padLeft(2, '0')}'
        '${(color.g * 255).round().toRadixString(16).padLeft(2, '0')}'
        '${(color.b * 255).round().toRadixString(16).padLeft(2, '0')}'
    .toUpperCase();

class WheelPage extends StatelessWidget {
  const WheelPage({super.key});

  // ========================================
  // MAIN BUILD METHOD
  // ========================================
  @override
  Widget build(BuildContext context) {
    const segmentCount = 8;
    final segments = List.generate(
        segmentCount,
        (i) => WheelSegment(
              id: 'SEG$i',
              text: 'COLOR ${i + 1}',
              color: _colorToHex(_rainbowColor(i, segmentCount)),
            ));
    return Scaffold(
      body: Center(
        child: GWheel(
          segments: segments,
          // pointerOffset: 15,
          // spinButtonOffset: 16,
          // removeSpinButtonOffset: false,
          // wheelSize: 250,
          // animationSpeed: 2,
          // showSpinButton: true,
          // showPointer: true,
          // animatePointerColor: false,
          // pointerColor: Colors.black,
          // enableTapToSpin: true,
          // showCenterDot: true,
          // showWheelBorder: true,
          // wheelBorderColor: Colors.blueAccent,
          // wheelBorderWidth: 4.0,
          // segmentTextStyle: const TextStyle(
          //     fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          // segmentFontSize: 16,
          // segmentFontWeight: FontWeight.bold,
          // showWheelShadow: true,
          // wheelShadowBlur: 24.0,
          // wheelShadowOffsetX: 0,
          // wheelShadowOffsetY: 10.0,
          // wheelShadowColor: Colors.black26,
          // spinButtonText: 'Spin!',
          // spinButtonTextStyle:
          //     const TextStyle(fontSize: 18, color: Colors.white),
          // spinButtonColor: Colors.pink,
          // spinButtonIcon: const Icon(Icons.start_rounded, color: Colors.white),
          // spinCurve: Curves.easeInQuart,

          // initialAngle: 0.0,
          // segmentGap: 0.0,
          // showCenterDot: true,
          // centerWidget: const Icon(Icons.star, size: 32, color: Colors.amber),
          // onSpinning: (progress) {
          //   // Wheel is spinning
          // },
          // onFinish: (result) {
          //   // Wheel result received
          //   print(result);
          // },
          // onSpinEnd: () {
          //   // Wheel spin ended
          // },
          // onSpinStart: () {
          //   // Wheel spin started
          // },
          // customPointer: const Icon(Icons.star, size: 32, color: Colors.amber),
          // showPointer: false,
        ),
      ),
    );
  }
}
