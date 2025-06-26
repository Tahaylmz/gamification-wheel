import '../../../domain/entities/wheel/wheel_segment.dart';
import '../../../core/constants/wheel_constants.dart';

// ========================================
// WHEEL LOCAL DATA SOURCE INTERFACE
// ========================================
abstract class WheelLocalDataSource {
  // ========================================
  // SEGMENT OPERATIONS
  // ========================================
  Future<List<WheelSegment>> getWheelSegments();
  Future<void> updateWheelSegments(List<WheelSegment> segments);
  Future<void> resetToDefaults();

  // ========================================
  // SETTINGS OPERATIONS
  // ========================================
  Future<double> getWheelSize();
  Future<void> saveWheelSize(double size);
  Future<double> getAnimationSpeed();
  Future<void> saveAnimationSpeed(double speed);
}

// ========================================
// WHEEL LOCAL DATA SOURCE IMPLEMENTATION
// ========================================
class WheelLocalDataSourceImpl implements WheelLocalDataSource {
  // ========================================
  // IN-MEMORY STORAGE
  // ========================================
  List<WheelSegment> _segments = [];
  double _wheelSize = WheelGeneralConstants.defaultWheelSize;
  double _animationSpeed = WheelGeneralConstants.defaultAnimationSpeed;

  // ========================================
  // CONSTRUCTOR
  // ========================================
  // ========================================
  // SEGMENT OPERATIONS
  // ========================================
  @override
  Future<List<WheelSegment>> getWheelSegments() async {
    return _segments;
  }

  @override
  Future<void> updateWheelSegments(List<WheelSegment> segments) async {
    _segments = segments;
  }

  @override
  Future<void> resetToDefaults() async {
    _wheelSize = WheelGeneralConstants.defaultWheelSize;
    _animationSpeed = WheelGeneralConstants.defaultAnimationSpeed;
  }

  // ========================================
  // SETTINGS OPERATIONS
  // ========================================
  @override
  Future<double> getWheelSize() async {
    return _wheelSize;
  }

  @override
  Future<void> saveWheelSize(double size) async {
    _wheelSize = size;
  }

  @override
  Future<double> getAnimationSpeed() async {
    return _animationSpeed;
  }

  @override
  Future<void> saveAnimationSpeed(double speed) async {
    _animationSpeed = speed;
  }
}
