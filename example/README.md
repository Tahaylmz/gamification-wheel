# Gamification Wheel Example

This example demonstrates how to integrate and use the `gamification_wheel` package in a Flutter application with a professional and production-ready approach.

---

## 🚀 Features

- **Interactive Spinning Wheel**: Visually appealing, animated wheel with customizable segments.
- **Weighted Probability**: Each segment can have a different probability (weight) for selection.
- **Dynamic Segment Management**: Add or reset segments at runtime.
- **Result Handling**: Display the result of each spin with a smooth animation.
- **Customizable UI**: Change wheel size, colors, center widget, pointer, and more.
- **Responsive & Modern Design**: Looks great on all devices.

---

## 📦 Getting Started

### 1. Navigate to the Example Directory
```bash
cd example
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Run the Example
```bash
flutter run
```

---

## 🛠️ Usage Overview

### Basic Wheel Integration
```dart
GWheel(
  segments: segments, // List<WheelSegment>
  wheelSize: 300, // Diameter in pixels
  animationSpeed: 2.0, // 0.5x (slow) to 3.0x (fast)
  showPointer: true,
  enableTapToSpin: true,
  showCenterDot: true,
  showWheelShadow: true,
  centerWidget: Icon(Icons.restaurant, size: 40, color: Colors.white),
  onFinish: (result) {
    // Handle the result (WheelSegment)
  },
)
```

### Creating Segments with Probability
```dart
final segments = [
  WheelSegment(
    id: '1',
    text: 'Pizza',
    color: '#FF6B6B',
    probability: 2.0, // Higher chance
  ),
  WheelSegment(
    id: '2',
    text: 'Burger',
    color: '#4ECDC4',
    probability: 1.0,
  ),
  // ... more segments
];
```

### Handling Wheel Events
```dart
onSpinning: (progress) {
  // Called during spinning (progress: 0.0 - 1.0)
},
onFinish: (result) {
  // Called when the wheel stops (result: WheelSegment)
},
onSpinStart: () {
  // Called when spinning starts
},
onSpinEnd: () {
  // Called when spinning ends
},
```

---

## 🎨 Customization Options

- **Wheel Size**: Adjust the `wheelSize` parameter.
- **Animation Speed**: Set `animationSpeed` (0.5x to 3.0x).
- **Segment Colors**: Use any hex color code for each segment.
- **Probability**: Assign different weights to segments for fair or biased spins.
- **Pointer & Center Widget**: Customize the pointer and center icon/widget.
- **Styling**: Enable/disable shadows, borders, and more.

---

## ⚙️ Technical Notes

- **Weighted Random Selection**: The wheel uses a weighted random algorithm to select a segment based on its probability, ensuring fair and accurate results.
- **Result Consistency**: The segment shown under the pointer always matches the result displayed.
- **No External State Management Needed**: The widget is self-contained and does not require BLoC or Provider in your app.
- **Null Safety**: Fully null-safe and compatible with the latest Flutter versions.

---

## 📚 Learn More

For advanced usage, customization, and integration tips, please refer to the main package documentation.

---

**Happy spinning!** 🎉 