import '../../../../core/di/injection_container.dart' as di;

// ========================================
// APPLICATION INITIALIZATION CLASS
// ========================================
class AppInitialize {
  // ========================================
  // MAIN INITIALIZATION METHOD
  // ========================================
  static Future<void> initialize() async {
    // ========================================
    // DEPENDENCY INJECTION INITIALIZATION
    // ========================================
    await _initializeDependencyInjection();
    }

  // ========================================
  // DEPENDENCY INJECTION METHODS
  // ========================================
  static Future<void> _initializeDependencyInjection() async {
    await di.init();
  }
}
