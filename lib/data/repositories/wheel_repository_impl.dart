import 'dart:math';
import 'package:dartz/dartz.dart';
import '../../../domain/entities/wheel/wheel_segment.dart';
import '../../../domain/repositories/wheel_repository.dart';
import '../../../data/datasources/wheel_local_datasource.dart';

// ========================================
// WHEEL REPOSITORY IMPLEMENTATION
// ========================================
class WheelRepositoryImpl implements WheelRepository {
  // ========================================
  // DEPENDENCIES
  // ========================================
  final WheelLocalDataSource localDataSource;
  final Random _random = Random();

  // ========================================
  // CONSTRUCTOR
  // ========================================
  WheelRepositoryImpl({required this.localDataSource});

  // ========================================
  // SEGMENT OPERATIONS IMPLEMENTATION
  // ========================================
  @override
  Future<Either<String, List<WheelSegment>>> getWheelSegments() async {
    try {
      final segments = await localDataSource.getWheelSegments();
      return Right(segments);
    } catch (e) {
      return Left('Error occurred while loading segments: $e');
    }
  }

  @override
  Future<Either<String, void>> updateWheelSegments(
    List<WheelSegment> segments,
  ) async {
    try {
      await localDataSource.updateWheelSegments(segments);
      return const Right(null);
    } catch (e) {
      return Left('Error occurred while updating segments: $e');
    }
  }

  // ========================================
  // WHEEL SPIN OPERATIONS IMPLEMENTATION
  // ========================================
  @override
  Future<Either<String, WheelSegment>> spinWheel() async {
    try {
      // ========================================
      // SEGMENTS VALIDATION
      // ========================================
      final segments = await localDataSource.getWheelSegments();
      if (segments.isEmpty) {
        return const Left('Segment not found');
      }

      // ========================================
      // WEIGHT-BASED SEGMENT SELECTION
      // ========================================
      final selectedSegment = _selectSegmentByWeight(segments);

      return Right(selectedSegment);
    } catch (e) {
      return Left('Error occurred while spinning the wheel: $e');
    }
  }

  // ========================================
  // SETTINGS OPERATIONS IMPLEMENTATION
  // ========================================
  @override
  Future<Either<String, double>> getWheelSize() async {
    try {
      final size = await localDataSource.getWheelSize();
      return Right(size);
    } catch (e) {
      return Left('Error occurred while loading wheel size: $e');
    }
  }

  @override
  Future<Either<String, void>> saveWheelSize(double size) async {
    try {
      await localDataSource.saveWheelSize(size);
      return const Right(null);
    } catch (e) {
      return Left('Error occurred while saving wheel size: $e');
    }
  }

  @override
  Future<Either<String, double>> getAnimationSpeed() async {
    try {
      final speed = await localDataSource.getAnimationSpeed();
      return Right(speed);
    } catch (e) {
      return Left('Error occurred while loading animation speed: $e');
    }
  }

  @override
  Future<Either<String, void>> saveAnimationSpeed(double speed) async {
    try {
      await localDataSource.saveAnimationSpeed(speed);
      return const Right(null);
    } catch (e) {
      return Left('Error occurred while saving animation speed: $e');
    }
  }

  @override
  Future<Either<String, void>> resetToDefaults() async {
    try {
      await localDataSource.resetToDefaults();
      return const Right(null);
    } catch (e) {
      return Left('Error occurred while resetting to defaults: $e');
    }
  }

  // ========================================
  // PRIVATE HELPER METHODS
  // ========================================
  // Segment selection based on weight system
  WheelSegment _selectSegmentByWeight(List<WheelSegment> segments) {
    // ========================================
    // TOTAL WEIGHT CALCULATION
    // ========================================
    final totalWeight = _calculateTotalProbability(segments);

    if (totalWeight <= 0) {
      // ========================================
      // RANDOM SELECTION (NO WEIGHTS)
      // ========================================
      return segments[_random.nextInt(segments.length)];
    }

    // ========================================
    // WEIGHT-BASED SELECTION
    // ========================================
    final randomValue = _random.nextDouble() * totalWeight;
    return _findSegmentByWeight(segments, randomValue);
  }

  double _calculateTotalProbability(List<WheelSegment> segments) {
    return segments.fold<double>(
      0.0,
      (sum, segment) => sum + segment.probability,
    );
  }

  WheelSegment _findSegmentByWeight(
    List<WheelSegment> segments,
    double randomValue,
  ) {
    double currentWeight = 0.0;

    for (int i = 0; i < segments.length; i++) {
      final segment = segments[i];
      currentWeight += segment.probability;

      if (randomValue <= currentWeight) {
        return segment;
      }
    }

    // ========================================
    // FALLBACK: LAST SEGMENT
    // ========================================
    return segments.last;
  }
}
