import 'dart:async';
import 'package:gamification_wheel/gamification_wheel.dart';
import 'package:dartz/dartz.dart';

class MockWheelRepository implements WheelRepository {
  List<WheelSegment> _segments = [
    const WheelSegment(
        id: '1', text: 'Pizza', color: '#FF6B6B', probability: 2.0),
    const WheelSegment(
        id: '2', text: 'Burger', color: '#4ECDC4', probability: 1.5),
    const WheelSegment(
        id: '3', text: 'Sushi', color: '#45B7D1', probability: 1.0),
    const WheelSegment(
        id: '4', text: 'Pasta', color: '#96CEB4', probability: 1.8),
    const WheelSegment(
        id: '5', text: 'Salad', color: '#FFEAA7', probability: 0.8),
    const WheelSegment(
        id: '6', text: 'Steak', color: '#DDA0DD', probability: 1.2),
  ];
  double _wheelSize = 300.0;
  double _animationSpeed = 2.0;

  @override
  Future<Either<String, List<WheelSegment>>> getWheelSegments() async {
    return Right(_segments);
  }

  @override
  Future<Either<String, void>> updateWheelSegments(
      List<WheelSegment> segments) async {
    _segments = segments;
    return const Right(null);
  }

  @override
  Future<Either<String, double>> getWheelSize() async {
    return Right(_wheelSize);
  }

  @override
  Future<Either<String, void>> saveWheelSize(double size) async {
    _wheelSize = size;
    return const Right(null);
  }

  @override
  Future<Either<String, double>> getAnimationSpeed() async {
    return Right(_animationSpeed);
  }

  @override
  Future<Either<String, void>> saveAnimationSpeed(double speed) async {
    _animationSpeed = speed;
    return const Right(null);
  }

  @override
  Future<Either<String, void>> resetToDefaults() async {
    _segments = [
      const WheelSegment(
          id: '1', text: 'Pizza', color: '#FF6B6B', probability: 2.0),
      const WheelSegment(
          id: '2', text: 'Burger', color: '#4ECDC4', probability: 1.5),
      const WheelSegment(
          id: '3', text: 'Sushi', color: '#45B7D1', probability: 1.0),
      const WheelSegment(
          id: '4', text: 'Pasta', color: '#96CEB4', probability: 1.8),
      const WheelSegment(
          id: '5', text: 'Salad', color: '#FFEAA7', probability: 0.8),
      const WheelSegment(
          id: '6', text: 'Steak', color: '#DDA0DD', probability: 1.2),
    ];
    _wheelSize = 300.0;
    _animationSpeed = 2.0;
    return const Right(null);
  }

  @override
  Future<Either<String, WheelSegment>> spinWheel() async {
    // Rastgele bir segment döndür
    _segments.shuffle();
    return Right(_segments.first);
  }
}
