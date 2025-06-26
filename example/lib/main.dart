import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamification_wheel/gamification_wheel.dart';
import 'mock_wheel_repository.dart';
import 'mock_spin_wheel_usecase.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock repository ve usecase oluştur
    final repository = MockWheelRepository();
    final usecase = MockSpinWheelUseCase(repository);
    return MaterialApp(
      title: 'Gamification Wheel Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Builder(
        builder: (context) => BlocProvider(
          create: (_) => WheelBloc(
            spinWheelUseCase: usecase,
            wheelRepository: repository,
          ),
          child: const WheelExamplePage(),
        ),
      ),
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
        color: '#FF6B6B',
        probability: 2.0,
      ),
      const WheelSegment(
        id: '2',
        text: 'Burger',
        color: '#4ECDC4',
        probability: 1.5,
      ),
      const WheelSegment(
        id: '3',
        text: 'Sushi',
        color: '#45B7D1',
        probability: 1.0,
      ),
      const WheelSegment(
        id: '4',
        text: 'Pasta',
        color: '#96CEB4',
        probability: 1.8,
      ),
      const WheelSegment(
        id: '5',
        text: 'Salad',
        color: '#FFEAA7',
        probability: 0.8,
      ),
      const WheelSegment(
        id: '6',
        text: 'Steak',
        color: '#DDA0DD',
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
                  wheelSize: 300,
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

  String _getRandomColor() {
    final colors = [
      '#FF6B6B',
      '#4ECDC4',
      '#45B7D1',
      '#96CEB4',
      '#FFEAA7',
      '#DDA0DD',
      '#FF8A80',
      '#80CBC4',
    ];
    return colors[DateTime.now().millisecond % colors.length];
  }
}
