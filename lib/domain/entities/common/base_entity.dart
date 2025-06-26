// ========================================
// BASE ENTITY CLASS
// ========================================
// Defines common properties for all entities.
// New entities can be derived from this class in the future.
// ========================================

abstract class BaseEntity {
  // ========================================
  // ABSTRACT METHODS
  // ========================================
  // Methods that each entity must implement

  /// Returns the unique identifier of the entity
  String get id;

  /// Converts the entity to JSON format
  Map<String, dynamic> toJson();

  /// Equality comparison of entities
  bool equals(BaseEntity other);

  /// Hash code of the entity
  @override
  int get hashCode;

  /// Equality operator
  @override
  bool operator ==(Object other);
}

// ========================================
// ENTITY VALIDATION MIXIN
// ========================================
// Common validation rules for entities
mixin EntityValidation {
  // ========================================
  // VALIDATION METHODS
  // ========================================

  /// Checks if the ID is valid
  bool isValidId(String id) {
    return id.isNotEmpty && id.trim().isNotEmpty;
  }

  /// Checks if the text is valid
  bool isValidText(String text) {
    return text.isNotEmpty && text.trim().isNotEmpty;
  }

  /// Checks if the color code is valid
  bool isValidColor(String color) {
    return color.startsWith('#') && color.length == 7;
  }

  /// Checks if the probability value is valid
  bool isValidProbability(double probability) {
    return probability >= 0.0 && probability <= 100.0;
  }
}
