import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../entities/wheel/wheel_segment.dart';
import '../repositories/wheel_repository.dart';

// ========================================
// ABSTRACT USE CASE CLASS
// ========================================
abstract class UseCase<Type, Params> {
  Future<Either<String, Type>> call(Params params);
}

// ========================================
// WHEEL SPIN USE CASES
// ========================================
class SpinWheelUseCase implements UseCase<WheelSegment, NoParams> {
  // ========================================
  // DEPENDENCIES
  // ========================================
  final WheelRepository repository;

  // ========================================
  // CONSTRUCTOR
  // ========================================
  SpinWheelUseCase(this.repository);

  // ========================================
  // EXECUTION METHOD
  // ========================================
  @override
  Future<Either<String, WheelSegment>> call(NoParams params) async {
    return await repository.spinWheel();
  }
}

// ========================================
// SEGMENT MANAGEMENT USE CASES
// ========================================
class UpdateWheelSegmentsUseCase
    implements UseCase<void, UpdateWheelSegmentsParams> {
  // ========================================
  // DEPENDENCIES
  // ========================================
  final WheelRepository repository;

  // ========================================
  // CONSTRUCTOR
  // ========================================
  UpdateWheelSegmentsUseCase(this.repository);

  // ========================================
  // EXECUTION METHOD
  // ========================================
  @override
  Future<Either<String, void>> call(UpdateWheelSegmentsParams params) async {
    return await repository.updateWheelSegments(params.segments);
  }
}

// ========================================
// WHEEL SIZE USE CASES
// ========================================
class GetWheelSizeUseCase implements UseCase<double, NoParams> {
  // ========================================
  // DEPENDENCIES
  // ========================================
  final WheelRepository repository;

  // ========================================
  // CONSTRUCTOR
  // ========================================
  GetWheelSizeUseCase(this.repository);

  // ========================================
  // EXECUTION METHOD
  // ========================================
  @override
  Future<Either<String, double>> call(NoParams params) async {
    return await repository.getWheelSize();
  }
}

class SaveWheelSizeUseCase implements UseCase<void, SaveWheelSizeParams> {
  // ========================================
  // DEPENDENCIES
  // ========================================
  final WheelRepository repository;

  // ========================================
  // CONSTRUCTOR
  // ========================================
  SaveWheelSizeUseCase(this.repository);

  // ========================================
  // EXECUTION METHOD
  // ========================================
  @override
  Future<Either<String, void>> call(SaveWheelSizeParams params) async {
    return await repository.saveWheelSize(params.size);
  }
}

// ========================================
// ANIMATION SPEED USE CASES
// ========================================
class GetAnimationSpeedUseCase implements UseCase<double, NoParams> {
  // ========================================
  // DEPENDENCIES
  // ========================================
  final WheelRepository repository;

  // ========================================
  // CONSTRUCTOR
  // ========================================
  GetAnimationSpeedUseCase(this.repository);

  // ========================================
  // EXECUTION METHOD
  // ========================================
  @override
  Future<Either<String, double>> call(NoParams params) async {
    return await repository.getAnimationSpeed();
  }
}

class SaveAnimationSpeedUseCase
    implements UseCase<void, SaveAnimationSpeedParams> {
  // ========================================
  // DEPENDENCIES
  // ========================================
  final WheelRepository repository;

  // ========================================
  // CONSTRUCTOR
  // ========================================
  SaveAnimationSpeedUseCase(this.repository);

  // ========================================
  // EXECUTION METHOD
  // ========================================
  @override
  Future<Either<String, void>> call(SaveAnimationSpeedParams params) async {
    return await repository.saveAnimationSpeed(params.speed);
  }
}

// ========================================
// PARAMETER CLASSES
// ========================================
class UpdateWheelSegmentsParams extends Equatable {
  // ========================================
  // PROPERTIES
  // ========================================
  final List<WheelSegment> segments;

  // ========================================
  // CONSTRUCTOR
  // ========================================
  const UpdateWheelSegmentsParams(this.segments);

  // ========================================
  // EQUATABLE IMPLEMENTATION
  // ========================================
  @override
  List<Object?> get props => [segments];
}

class SaveWheelSizeParams extends Equatable {
  // ========================================
  // PROPERTIES
  // ========================================
  final double size;

  // ========================================
  // CONSTRUCTOR
  // ========================================
  const SaveWheelSizeParams(this.size);

  // ========================================
  // EQUATABLE IMPLEMENTATION
  // ========================================
  @override
  List<Object?> get props => [size];
}

class SaveAnimationSpeedParams extends Equatable {
  // ========================================
  // PROPERTIES
  // ========================================
  final double speed;

  // ========================================
  // CONSTRUCTOR
  // ========================================
  const SaveAnimationSpeedParams(this.speed);

  // ========================================
  // EQUATABLE IMPLEMENTATION
  // ========================================
  @override
  List<Object?> get props => [speed];
}

class NoParams extends Equatable {
  // ========================================
  // EQUATABLE IMPLEMENTATION
  // ========================================
  @override
  List<Object?> get props => [];
}
