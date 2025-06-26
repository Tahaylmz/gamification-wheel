# ��️ Domain Entities

This folder contains all entities (objects) in the application's domain layer.

## 📁 Folder Structure

```
entities/
├── common/                 # Common entities
│   └── base_entity.dart    # Base entity class and validation mixin
├── results/                # Result entities
│   └── spin_result.dart    # Wheel spin result
├── wheel/                  # Wheel entities
│   └── wheel_segment.dart  # Wheel segment
└── entities.dart           # Index file that exports all entities
```

## 🎯 Entity Categories

### 🔧 Common Entities
- **BaseEntity**: Base class for all entities
- **EntityValidation**: Common validation rules

### 🎯 Wheel Entities
- **WheelSegment**: Each segment on the wheel
  - `id`: Unique segment identifier
  - `text`: Text to be displayed on the segment
  - `color`: Segment color (hex format)
  - `probability`: Probability of the segment being selected

### 📊 Result Entities
- **SpinResult**: Result of the wheel spin operation
  - `segment`: Selected segment
  - `timestamp`: Spin time

## 🛠️ Usage

### Import
```dart
// Individual imports
import 'package:gamification/domain/entities/wheel/wheel_segment.dart';
import 'package:gamification/domain/entities/results/spin_result.dart';

// Or from index file
import 'package:gamification/domain/entities/entities.dart';
```

### Creating Entities
```dart
// Creating WheelSegment
final segment = WheelSegment(
  id: '1',
  text: 'Win',
  color: '#FF6B6B',
  probability: 25.0,
);

// Creating SpinResult
final result = SpinResult(
  segment: segment,
  timestamp: DateTime.now(),
);
```

### Validation
```dart
// Validation with EntityValidation mixin
class MyEntity with EntityValidation {
  bool validateSegment(WheelSegment segment) {
    return isValidId(segment.id) &&
           isValidText(segment.text) &&
           isValidColor(segment.color) &&
           isValidProbability(segment.probability);
  }
}
```

## 🔄 Freezed & Hive

All entities are integrated with Freezed and Hive:

- **Freezed**: Immutable data classes
- **Hive**: Local database serialization
- **JSON**: API serialization

## 📝 Adding New Entities

1. Add the entity file to the appropriate category folder
2. Add Freezed and Hive annotations
3. Add export to `entities.dart` index file
4. Derive from BaseEntity if necessary

## 🧪 Testing

Unit tests should be written for each entity:

```dart
test('WheelSegment should be created with valid data', () {
  final segment = WheelSegment(
    id: '1',
    text: 'Test',
    color: '#FF0000',
    probability: 50.0,
  );
  
  expect(segment.id, '1');
  expect(segment.text, 'Test');
  expect(segment.color, '#FF0000');
  expect(segment.probability, 50.0);
});
``` 