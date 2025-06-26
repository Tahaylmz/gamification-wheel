import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/di/injection_container.dart';
import '../blocs/wheel/events.dart';
import '../blocs/wheel/wheel_bloc.dart';
import 'wheel_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // ========================================
  // MAIN BUILD METHOD
  // ========================================
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gamification Wheel',
      theme: _buildAppTheme(),
      home: _buildHomePage(),
    );
  }

  // ========================================
  // THEME CONFIGURATION
  // ========================================
  ThemeData _buildAppTheme() {
    return ThemeData(primarySwatch: Colors.blue, useMaterial3: true);
  }

  // ========================================
  // HOME PAGE CONFIGURATION
  // ========================================
  Widget _buildHomePage() {
    return BlocProvider(
      create: (context) => _createWheelBloc(),
      child: const WheelPage(),
    );
  }

  // ========================================
  // BLOC CREATION
  // ========================================
  WheelBloc _createWheelBloc() {
    final bloc = sl<WheelBloc>();
    bloc.add(LoadWheelSegments());
    bloc.add(LoadWheelSettings());
    return bloc;
  }
}
