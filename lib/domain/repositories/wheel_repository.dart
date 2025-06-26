import 'package:dartz/dartz.dart';
import '../../../domain/entities/wheel/wheel_segment.dart';

abstract class WheelRepository {
  Future<Either<String, List<WheelSegment>>> getWheelSegments();
  Future<Either<String, void>> updateWheelSegments(List<WheelSegment> segments);
  Future<Either<String, WheelSegment>> spinWheel();
  Future<Either<String, double>> getWheelSize();
  Future<Either<String, void>> saveWheelSize(double size);
  Future<Either<String, double>> getAnimationSpeed();
  Future<Either<String, void>> saveAnimationSpeed(double speed);
  Future<Either<String, void>> resetToDefaults();
}
