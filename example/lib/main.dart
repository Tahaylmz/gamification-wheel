import 'package:flutter/material.dart';
import 'package:gamification_wheel/gamification_wheel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gamification Wheel Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WheelExamplePage(),
    );
  }
}

class WheelExamplePage extends StatefulWidget {
  const WheelExamplePage({super.key});

  @override
  State<WheelExamplePage> createState() => _WheelExamplePageState();
}

class _WheelExamplePageState extends State<WheelExamplePage> {
  List<WheelSegment> segments = [];
  String? lastResult;
  bool isSpinning = false;

  @override
  void initState() {
    super.initState();
    _initializeSegments();
  }

  void _initializeSegments() {
    segments = [
      const WheelSegment(
        id: '1',
        text: 'Pizza',
        color: Colors.red,
        probability: 2.0,
      ),
      const WheelSegment(
        id: '2',
        text: 'Burger',
        color: Colors.green,
        probability: 1.5,
      ),
      const WheelSegment(
        id: '3',
        text: 'Sushi',
        color: Colors.blue,
        probability: 1.0,
      ),
      const WheelSegment(
        id: '4',
        text: 'Pasta',
        color: Colors.yellow,
        probability: 1.8,
      ),
      const WheelSegment(
        id: '5',
        text: 'Salad',
        color: Colors.orange,
        probability: 0.8,
      ),
      const WheelSegment(
        id: '6',
        text: 'Steak',
        color: Colors.purple,
        probability: 1.2,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Gamification Wheel Example'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Result Display
            if (lastResult != null)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.shade300),
                ),
                child: Column(
                  children: [
                    const Text(
                      '🎉 Congratulations!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'You got: $lastResult',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

            // Wheel Widget
            Expanded(
              child: Center(
                child: GWheel(
                  segments: segments,
                  wheelSize: 250,
                  animationSpeed: 2.0,
                  showPointer: true,
                  showCenterDot: true,
                  enableTapToSpin: true,
                  showWheelShadow: true,
                  wheelShadowBlur: 20.0,
                  wheelShadowOffsetY: 8.0,
                  centerWidget: const Icon(
                    Icons.restaurant,
                    size: 40,
                    color: Colors.white,
                  ),
                  onSpinning: (progress) {
                    setState(() {
                      isSpinning = true;
                    });
                  },
                  onFinish: (result) {
                    setState(() {
                      lastResult = result.text;
                      isSpinning = false;
                    });
                  },
                  onSpinStart: () {
                    setState(() {
                      isSpinning = true;
                      lastResult = null;
                    });
                  },
                  onSpinEnd: () {
                    setState(() {
                      isSpinning = false;
                    });
                  },
                ),
              ),
            ),

            // Controls
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: isSpinning ? null : () => _addSegment(),
                  icon: const Icon(Icons.add),
                  label: const Text('Add Segment'),
                ),
                ElevatedButton.icon(
                  onPressed: isSpinning ? null : () => _resetWheel(),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _addSegment() {
    if (segments.length < 8) {
      setState(() {
        segments.add(
          WheelSegment(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            text: 'New ${segments.length + 1}',
            color: _getRandomColor(),
            probability: 1.0,
          ),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Maximum 8 segments allowed!'),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }

  void _resetWheel() {
    setState(() {
      _initializeSegments();
      lastResult = null;
    });
  }

  Color _getRandomColor() {
    final colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
      Colors.brown,
    ];
    return colors[DateTime.now().millisecond % colors.length];
  }
}
