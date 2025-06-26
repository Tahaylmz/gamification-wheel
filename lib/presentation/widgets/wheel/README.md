# WheelWidget - Dışarıya Aktarılabilir Çark Widget'ı

Bu widget, Flutter projelerinde kullanılabilir, tam özellikli bir çark (wheel) widget'ıdır. Clean Architecture, BLoC pattern ve Hive veritabanı kullanılarak geliştirilmiştir.

## Özellikler

- 🎯 **Tam Özellikli Çark**: Animasyonlu çark döndürme
- ⚙️ **Ayarlanabilir Segmentler**: Dinamik segment ekleme/düzenleme
- 🎨 **Renk Yönetimi**: Özelleştirilebilir renkler
- 📊 **Geçmiş Takibi**: Çark sonuçlarının geçmişi
- 🎮 **Hız Kontrolü**: Animasyon hızı ayarlama
- 📱 **Responsive Tasarım**: Farklı ekran boyutlarına uyum
- 🏗️ **Clean Architecture**: Modüler ve sürdürülebilir kod yapısı

## Kurulum

### 1. Bağımlılıkları Ekleyin

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.3
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  get_it: ^7.6.4
```

### 2. Widget'ı Import Edin

```dart
import 'package:your_app/presentation/widgets/wheel/wheel_widget_export.dart';
```

### 3. Kullanın

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Çark Uygulaması')),
        body: WheelWidget(), // Widget'ı burada kullanın
      ),
    );
  }
}
```

## Gerekli Kurulum

### 1. Hive Başlatma

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  
  // Hive adaptörlerini kaydet
  Hive.registerAdapter(WheelSegmentAdapter());
  
  runApp(MyApp());
}
```

### 2. GetIt Dependency Injection

```dart
final getIt = GetIt.instance;

void setupDependencies() {
  // Repository'leri kaydet
  getIt.registerLazySingleton<WheelRepository>(() => WheelRepositoryImpl());
  
  // BLoC'ları kaydet
  getIt.registerFactory<WheelBloc>(() => WheelBloc(getIt<WheelRepository>()));
}
```

## Widget Yapısı

```
WheelWidget/
├── wheel_widget.dart              # Ana widget
├── wheel_widget_export.dart       # Export dosyası
├── wheel_display.dart             # Çark görüntüleme
├── wheel_controls.dart            # Kontrol butonları
├── wheel_config_panel.dart        # Ayarlar paneli
├── wheel_animation_controller.dart # Animasyon kontrolü
└── README.md                      # Bu dosya
```

## BLoC Yapısı

- **WheelBloc**: Ana çark state yönetimi
- **WheelWidgetBloc**: Widget state yönetimi
- **WheelConfigBloc**: Ayarlar paneli state yönetimi
- **WheelControlsBloc**: Kontrol butonları state yönetimi
- **WheelDisplayBloc**: Çark görüntüleme state yönetimi

## Özelleştirme

### Renkler
```dart
// ColorConstants dosyasından renkleri özelleştirin
class ColorConstants {
  static const Color primaryColor = Color(0xFF2196F3);
  static const Color secondaryColor = Color(0xFF4CAF50);
  // ...
}
```

### Sabitler
```dart
// WheelConstants dosyasından sabitleri özelleştirin
class WheelConstants {
  static const double defaultWheelSize = 300.0;
  static const double defaultAnimationSpeed = 1.0;
  // ...
}
```

## Lisans

Bu widget MIT lisansı altında lisanslanmıştır.

## Katkıda Bulunma

1. Fork yapın
2. Feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Commit yapın (`git commit -m 'Add amazing feature'`)
4. Push yapın (`git push origin feature/amazing-feature`)
5. Pull Request oluşturun 