import 'package:flutter_test/flutter_test.dart';
import 'package:gamification_wheel/gamification_wheel.dart';

void main() {
  group('Gamification Wheel Tests', () {
    test('WheelSegment creation', () {
      const segment = WheelSegment(
        id: 'test-1',
        text: 'Test Segment',
        color: '#FF0000',
        probability: 1.0,
      );

      expect(segment.id, equals('test-1'));
      expect(segment.text, equals('Test Segment'));
      expect(segment.color, equals('#FF0000'));
      expect(segment.probability, equals(1.0));
    });

    test('WheelSegment copyWith', () {
      const original = WheelSegment(
        id: 'test-1',
        text: 'Original',
        color: '#FF0000',
        probability: 1.0,
      );

      final updated = original.copyWith(
        text: 'Updated',
        probability: 2.0,
      );

      expect(updated.id, equals('test-1'));
      expect(updated.text, equals('Updated'));
      expect(updated.color, equals('#FF0000'));
      expect(updated.probability, equals(2.0));
    });

    test('WheelSegment equality', () {
      const segment1 = WheelSegment(
        id: 'test-1',
        text: 'Test',
        color: '#FF0000',
        probability: 1.0,
      );

      const segment2 = WheelSegment(
        id: 'test-1',
        text: 'Test',
        color: '#FF0000',
        probability: 1.0,
      );

      expect(segment1, equals(segment2));
    });
  });
}
