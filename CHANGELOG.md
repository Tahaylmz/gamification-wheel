# Changelog

All notable changes to this project will be documented in this file.

## [0.1.0] - 2025-01-XX

### ✨ Initial Release
- **Wheel Widget**: Fully customizable wheel widget
- **BLoC Pattern**: State management with Clean Architecture
- **Customizable Segments**: Dynamic segment add/edit/delete functionality
- **Color Management**: Custom color support for each segment
- **Animation Controls**: Adjustable animation speed
- **Responsive Design**: Support for different screen sizes
- **Probability System**: Weight-based probability system
- **Tap to Spin**: Tap to spin wheel feature
- **Settings Panel**: Wheel size and other settings
- **Export Package**: Publishable package structure for pub.dev

### Technical Features
- BLoC pattern for state management
- Repository pattern for data access
- Dependency injection with GetIt
- SharedPreferences for local storage
- Custom painter for wheel visualization
- Animation controller for smooth transitions
- Event-driven architecture
- Modular widget structure
- Clean Architecture implementation

### Dependencies
- flutter_bloc: ^8.1.6
- get_it: ^7.7.0
- equatable: ^2.0.5
- flutter_spinkit: ^5.2.1
- vector_math: ^2.1.4
- dio: ^5.4.0
- dartz: ^0.10.1
- json_annotation: ^4.9.0
- freezed_annotation: ^2.4.1

### Development Dependencies
- flutter_lints: ^3.0.2
- build_runner: ^2.4.7
- json_serializable: ^6.9.0
- freezed: ^2.4.6

### Project Structure
- Clean Architecture with Domain, Data, and Presentation layers
- BLoC pattern for state management
- Repository pattern for data access
- Custom wheel painting with CustomPainter
- Responsive UI design
- Modular widget architecture

## [1.1.0] - 2024-01-XX

### 🗑️ Kaldırılan
- **Hive Database**: Local storage kaldırıldı, artık sadece RAM'de çalışıyor
- **Hive Dependencies**: `hive` ve `hive_flutter` paketleri kaldırıldı
- **Freezed Annotations**: Entity'lerden Hive annotation'ları kaldırıldı
- **Generated Files**: Freezed ve Hive tarafından oluşturulan dosyalar kaldırıldı

### 🔄 Değişen
- **Data Persistence**: Veriler artık sadece uygulama çalışırken RAM'de saklanıyor
- **Entity Structure**: WheelSegment ve SpinResult entity'leri Equatable kullanacak şekilde güncellendi
- **Repository Interface**: getSpinHistory metodu SpinResult listesi döndürecek şekilde güncellendi
- **ResetToDefaults**: Artık void döndürüyor, varsayılan segmentler otomatik yükleniyor

### ✨ Eklenen
- **In-Memory Storage**: Basit ve hızlı RAM tabanlı veri saklama
- **Simplified Architecture**: Daha basit ve anlaşılır kod yapısı
- **Better Performance**: Database overhead'i olmadan daha hızlı çalışma

### 🐛 Düzeltilen
- **Import Errors**: Tüm import yolları düzeltildi
- **Type Safety**: SpinResult entity'si ile daha güvenli tip kontrolü
- **Memory Management**: Daha iyi bellek yönetimi

## [1.0.0] - 2024-01-XX

### ✨ İlk Sürüm
- **Wheel Widget**: Tam özelleştirilebilir çark widget'ı
- **BLoC Pattern**: Clean Architecture ile state yönetimi
- **Customizable Segments**: Dinamik segment ekleme/düzenleme/silme
- **Color Management**: Her segment için özel renk desteği
- **Animation Controls**: Ayarlanabilir animasyon hızı
- **History Tracking**: Çevirme geçmişi takibi
- **Responsive Design**: Farklı ekran boyutlarına uyum
- **Probability System**: Ağırlık tabanlı olasılık sistemi
- **Tap to Spin**: Çarka dokunarak çevirme özelliği
- **Settings Panel**: Çark boyutu ve diğer ayarlar
- **Export Package**: pub.dev'de yayınlanabilir paket yapısı

### Technical Features
- BLoC pattern for state management
- Repository pattern for data access
- Dependency injection with GetIt
- Hive database for local storage
- Custom painter for wheel visualization
- Animation controller for smooth transitions
- Event-driven architecture
- Modular widget structure

### Dependencies
- flutter_bloc: ^8.1.3
- hive: ^2.2.3
- hive_flutter: ^1.1.0
- get_it: ^7.6.4 