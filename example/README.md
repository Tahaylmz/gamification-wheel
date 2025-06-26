# Gamification Wheel Example

This example demonstrates how to use the `gamification_wheel` package in a Flutter application.

## Features Demonstrated

- **Basic Wheel Usage**: Simple wheel with custom segments
- **Dynamic Segment Management**: Add new segments at runtime
- **Result Display**: Show spinning results with animations
- **Interactive Controls**: Buttons to add segments and reset wheel
- **Custom Styling**: Shadow effects, center widget, and custom colors

## How to Run

1. **Navigate to the example directory:**
   ```bash
   cd example
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the example:**
   ```bash
   flutter run
   ```

## What You'll See

- A colorful wheel with 6 food segments (Pizza, Burger, Sushi, etc.)
- Each segment has different probability weights
- Tap the wheel to spin it
- Results are displayed at the top
- Use buttons to add new segments or reset the wheel

## Key Code Examples

### Basic Wheel Setup
```dart
GWheel(
  segments: segments,
  wheelSize: 300,
  animationSpeed: 2.0,
  showPointer: true,
  enableTapToSpin: true,
  onFinish: (result) {
    // Handle result
  },
)
```

### Creating Segments
```dart
WheelSegment(
  id: '1',
  text: 'Pizza',
  color: '#FF6B6B',
  probability: 2.0, // Higher chance to be selected
)
```

### Handling Events
```dart
onSpinning: (progress) {
  // Wheel is spinning
},
onFinish: (result) {
  // Wheel stopped, result available
},
onSpinStart: () {
  // Spinning started
},
onSpinEnd: () {
  // Spinning ended
},
```

## Customization Options

- **Wheel Size**: Adjust `wheelSize` parameter
- **Animation Speed**: Change `animationSpeed` (0.5x to 3x)
- **Colors**: Use hex color codes for segments
- **Probability**: Set different weights for each segment
- **Styling**: Enable shadows, center dot, custom center widget

## Learn More

Check out the main package documentation for more advanced features and customization options. 