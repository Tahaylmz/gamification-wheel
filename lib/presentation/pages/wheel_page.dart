import 'package:flutter/material.dart';
import '../../domain/entities/wheel/wheel_segment.dart';
import '../widgets/wheel/wheel_widget.dart';

class WheelPage extends StatelessWidget {
  const WheelPage({super.key});

  // ========================================
  // MAIN BUILD METHOD
  // ========================================
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: GWheel(
          segments: [
            WheelSegment(id: '1', text: '1', color: Colors.red),
            WheelSegment(id: '2', text: '2', color: Colors.green),
            WheelSegment(id: '3', text: '3', color: Colors.blue),
          ],
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
