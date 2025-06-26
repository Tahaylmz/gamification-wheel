import 'package:gamification_wheel/gamification_wheel.dart';
import 'package:dartz/dartz.dart';
import 'dart:math';

class MockSpinWheelUseCase implements SpinWheelUseCase {
  final WheelRepository repository;
  final Random _random = Random();

  MockSpinWheelUseCase(this.repository);

  @override
  Future<Either<String, WheelSegment>> call([NoParams? params]) async {
    final result = await repository.getWheelSegments();
    return result.fold(
      (l) => Left(l),
      (segments) {
        if (segments.isEmpty) return const Left('No segments');
        return Right(segments[_random.nextInt(segments.length)]);
      },
    );
  }
}
