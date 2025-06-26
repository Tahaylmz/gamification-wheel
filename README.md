# 🎯 Gamification Wheel

A fully customizable gamification wheel application developed with Flutter, following Clean Architecture principles and BLoC pattern for state management. Perfect for games, decision-making, and interactive applications.

## 📹 Demo

<!-- Add your demo GIF here -->
![Gamification Wheel Demo](assets/gifs/demo.gif)

*Interactive gamification wheel with smooth animations and customizable segments*

## ✨ Features

- **🎲 Dynamic Wheel System**: Fully customizable segments with individual colors and weights
- **🎨 Modern UI/UX**: Beautiful interface designed with Material Design 3 principles
- **📱 Responsive Design**: Optimized for all screen sizes and orientations
- **⚡ High Performance**: Smooth animations with optimized state management
- **🎯 Weight-Based Probability**: Customizable probability values for each segment
- **🔄 Real-time Configuration**: Dynamic segment management (add, edit, delete)
- **⚙️ Adjustable Settings**: Control wheel size and animation speed
- **🎨 Color Customization**: Hex color picker for each segment
- **📊 Result Display**: Clear result presentation after spinning
- **🔄 Reset Functionality**: Easy reset to default settings

## 🏗️ Architecture

### Clean Architecture Implementation
```
lib/
├── core/                    # Core layer
│   ├── constants/          # Application constants
│   │   ├── color_constants.dart
│   │   └── wheel_constants.dart
│   └── utils/              # Utility classes
│       └── color_utils.dart
├── data/                   # Data layer
│   ├── datasources/        # Data sources
│   │   └── local/
│   │       └── shared_preferences_datasource.dart
│   └── repositories/       # Repository implementations
│       └── wheel_repository_impl.dart
├── domain/                 # Domain layer
│   ├── entities/           # Entities
│   │   ├── common/
│   │   │   ├── base_entity.dart
│   │   │   └── entities.dart
│   │   └── wheel/
│   │       └── wheel_segment.dart
│   ├── repositories/       # Repository interfaces
│   │   └── wheel_repository.dart
│   └── usecases/           # Use cases
│       └── spin_wheel_usecase.dart
└── presentation/           # Presentation layer
    ├── blocs/              # BLoC classes
    │   ├── wheel/
    │   │   ├── wheel_bloc.dart
    │   │   ├── events.dart
    │   │   └── states.dart
    │   └── wheel_display/
    │       ├── wheel_display_bloc.dart
    │       ├── events.dart
    │       └── states.dart
    ├── pages/              # Page widgets
    │   └── wheel_page.dart
    └── widgets/            # UI components
        └── wheel/
            ├── wheel_widget.dart
            ├── wheel_display.dart
            ├── wheel_controls.dart
            ├── wheel_animation_controller.dart
            ├── wheel_painter.dart
            └── wheel_widget_export.dart
```

### State Management with BLoC Pattern
- **WheelBloc**: Main wheel state management and spinning logic
- **WheelDisplayBloc**: Display and animation state management
- **Event-driven Architecture**: Clean separation of concerns

## 🚀 Quick Start

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/Tahaylmz/gamification-wheel.git
cd gamification-wheel
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the application**
```bash
flutter run
```

## 📦 Dependencies

### Core Dependencies
- **flutter_bloc**: ^8.1.6 - BLoC pattern for state management
- **get_it**: ^7.7.0 - Dependency injection
- **equatable**: ^2.0.5 - Value equality comparison
- **dartz**: ^0.10.1 - Functional programming utilities
- **flutter_spinkit**: ^5.2.1 - Loading animations
- **vector_math**: ^2.1.4 - Vector math operations
- **dio**: ^5.4.0 - HTTP client
- **json_annotation**: ^4.9.0 - JSON serialization
- **freezed_annotation**: ^2.4.1 - Immutable data classes

### Development Dependencies
- **flutter_lints**: ^3.0.2 - Code quality and linting
- **build_runner**: ^2.4.7 - Code generation
- **json_serializable**: ^6.9.0 - JSON serialization
- **freezed**: ^2.4.6 - Immutable data class generation

## 🎮 How to Use

### Basic Usage

1. **Spinning the Wheel**
   - Tap on the wheel or use the "Spin" button to start spinning
   - Watch the smooth animation as the wheel spins
   - See the result highlighted when the wheel stops

2. **Managing Segments**
   - Add new segments with custom text and colors
   - Edit existing segments (text, color, weight)
   - Delete unwanted segments
   - Set probability weights for each segment

3. **Customizing Settings**
   - Adjust wheel size (200px - 400px)
   - Control animation speed (0.5x - 3x)
   - Reset to default configuration

### Advanced Features

- **Weight System**: Set probability values (0.1 - 100.0) for each segment
- **Color Picker**: Use hex color codes or predefined color palette
- **Responsive Design**: Optimal display on phones, tablets, and web
- **Export Ready**: Package structure ready for pub.dev publication

## 🔧 Development

### Code Quality Standards
- **Clean Architecture**: Separation of concerns with domain, data, and presentation layers
- **SOLID Principles**: Object-oriented design principles
- **DRY Principle**: Don't Repeat Yourself
- **Clean Code**: Readable and maintainable code

### Testing Strategy
- **Unit Tests**: Business logic and use cases
- **Widget Tests**: UI component testing
- **Integration Tests**: End-to-end functionality

### Performance Features
- **Optimized Animations**: 60 FPS smooth wheel spinning
- **Memory Management**: Proper disposal of resources
- **Custom Painting**: Efficient wheel rendering
- **State Optimization**: Minimal widget rebuilds

## 📱 Platform Support

- ✅ **Android**: API Level 21+ (Android 5.0+)
- ✅ **iOS**: iOS 12.0+
- ✅ **Web**: Chrome, Firefox, Safari, Edge
- ✅ **Desktop**: Windows, macOS, Linux

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. **Fork the project**
2. **Create a feature branch** (`git checkout -b feature/amazing-feature`)
3. **Commit your changes** (`git commit -m 'Add amazing feature'`)
4. **Push to the branch** (`git push origin feature/amazing-feature`)
5. **Open a Pull Request**

### Commit Message Convention
- **feat**: New feature
- **fix**: Bug fix
- **docs**: Documentation update
- **style**: Code format changes
- **refactor**: Code refactoring
- **test**: Test addition/update
- **chore**: Build processes, tools

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Flutter Team** for the amazing framework
- **BLoC Team** for state management solution
- **Material Design Team** for design guidelines
- **All open source contributors** who made this possible

## 📞 Contact & Support

- **Developer**: Taha Yılmaz
- **GitHub**: [@Tahaylmz](https://github.com/Tahaylmz)
- **Company**: Analitik Yazılım
- **Location**: Bursa, Turkey

### Support Channels
- **GitHub Issues**: For bug reports and feature requests
- **GitHub Discussions**: For general questions and discussions
- **Email**: Available through GitHub profile

---

⭐ **Star this repository** if you found it helpful!

🔗 **Share with others** who might benefit from this gamification wheel!

---

*Built with ❤️ using Flutter and Clean Architecture*
