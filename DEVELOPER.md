# 🚀 Gamification Wheel - Developer Documentation

## 👨‍💻 Developer Information

**Main Developer:** [Taha Yılmaz](https://github.com/Tahaylmz)  
**GitHub:** [@Tahaylmz](https://github.com/Tahaylmz)  
**Position:** Flutter Developer

---

## 📋 About the Project

**Gamification Wheel** - An interactive wheel application developed with Flutter, following Clean Architecture principles and the BLoC pattern for state management.

### 🎯 Features
- Clean Architecture (Domain, Data, Presentation Layers)
- State Management with BLoC Pattern
- Local Storage with SharedPreferences
- Wheel Drawing with Custom Paint
- Animated Wheel Spinning
- Segment Management and Weighting
- Dynamic Segment Configuration
- Wheel Size and Animation Speed Control
- Modern UI/UX Design
- Responsive Design

---

## 🏗️ Project Structure

```
lib/
├── core/
│   ├── constants/
│   └── utils/
├── data/
│   ├── datasources/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── blocs/
    ├── pages/
    └── widgets/
```

---

## 🛠️ Technology Stack

- **Flutter:** 3.x
- **Dart:** 3.x
- **Material Design 3**
- **BLoC Pattern** (flutter_bloc)
- **Equatable** (State comparison)
- **SharedPreferences** (Key-Value Storage)

---

## 🚀 Installation and Running

### Requirements
- Flutter SDK 3.x
- Dart SDK 3.x
- Android Studio / VS Code
- Git

### Installation Steps

1. **Clone the repository:**
```bash
git clone https://github.com/Tahaylmz/gamification-wheel.git
cd gamification-wheel
```

2. **Install dependencies:**
```bash
flutter pub get
```

3. **Run the application:**
```bash
flutter run
```

---

## 📁 Important Files

- `lib/main.dart` - Application entry point
- `lib/presentation/pages/wheel_page.dart` - Main wheel page
- `lib/presentation/widgets/wheel/wheel_widget.dart` - Main wheel widget
- `lib/presentation/blocs/wheel/wheel_bloc.dart` - Main wheel state management
- `lib/presentation/blocs/wheel_display/wheel_display_bloc.dart` - Display state management
- `lib/domain/usecases/spin_wheel_usecase.dart` - Business logic
- `lib/data/repositories/wheel_repository_impl.dart` - Data access
- `lib/presentation/widgets/wheel/wheel_painter.dart` - Wheel drawing
- `lib/presentation/widgets/wheel/wheel_controls.dart` - Control buttons
- `lib/presentation/widgets/wheel/wheel_display.dart` - Wheel display
- `lib/presentation/widgets/wheel/wheel_animation_controller.dart` - Animation control
- `lib/core/constants/wheel_constants.dart` - Wheel configuration constants
- `lib/core/constants/color_constants.dart` - Color constants

---

## 🔧 Development Rules

- Write code following the Dart Style Guide
- Clean Code and SOLID principles
- Compliance with Clean Architecture layers
- Package management free from unnecessary dependencies and always up-to-date

---

## 🧪 Testing Strategy

- Unit Tests (critical business logic and helper functions)
- Widget Tests (main UI components)
- Integration Tests (end-to-end tests)

---

## 📈 Performance Optimization

- Widget rebuild optimization
- Memory management with dispose methods
- Animation performance improvements
- Custom Paint optimization

---

## 🔒 Security

- Input validation
- Data sanitization
- Secure storage
- Error handling

---

## 📱 Platform Support

- Android: API Level 21+
- iOS: iOS 12.0+
- Web: Modern browsers
- Responsive design, dark/light theme, accessibility support

---

## 🚀 Deployment

- Release build commands for iOS and Android
- Release build and hosting for Web

---

## 🤝 Contributing

- Fork, feature branch, commit, pull request process
- Use conventional commit messages (feat, fix, docs, style, refactor, test, chore)

---

## 📞 Contact

- **Name:** Taha Yılmaz
- **GitHub:** [@Tahaylmz](https://github.com/Tahaylmz)
- **Position:** Mobile App Developer
- **Location:** Bursa, Turkey
- **GitHub Issues:** For project-related issues
- **Email:** [Available through GitHub profile](https://github.com/Tahaylmz)

---

## 📄 License

MIT License

---

## 🙏 Acknowledgments

Thanks to all open source libraries and the community used in developing this project.

**Developer:** Taha Yılmaz  
**Last Update:** 2025  
**Version:** 0.1.4