import 'package:miniscript/miniscript_types/helpers.dart';
import 'package:miniscriptgen/miniscriptgen.dart';

/// Static utility class for type conversions between Dart and MiniScript.
///
/// This is the single source of truth for all conversions in the system.
/// All other classes should delegate to these methods.
class ConversionUtils {
  ConversionUtils._(); // Private constructor to prevent instantiation

  /// Converts a Dart object to a MiniScript Value.
  ///
  /// This is the main conversion method that handles all Dart -> MiniScript
  /// conversions including primitives, collections, and null values.
  /// For custom objects, returns null (should be handled by cache system).
  static Value? dartToValue<T>(T dartValue, {bool force = false}) {
    if (dartValue == null) {
      return ValNull.instance;
    }

    if (dartValue is String) {
      return ValString(dartValue);
    }

    if (dartValue is num) {
      return ValNumber(dartValue.toDouble());
    }

    if (dartValue is bool) {
      return ValNumber(dartValue ? 1.0 : 0.0);
    }

    if (dartValue is List<Value>) {
      return ValList(dartValue);
    }

    if (dartValue is Map<Value?, Value?>) {
      return ValMap(Dictionary(dartValue));
    }

    if (dartValue is Dictionary) {
      return ValMap(dartValue);
    }

    if (force) {
      if (dartValue is List) {
        return ValList(
          dartValue.map((e) => dartToValue(e, force: true)).toList(),
        );
      }

      if (dartValue is Map) {
        return ValMap(
          Dictionary(
            dartValue.map((k, v) => MapEntry(dartToValue(k), dartToValue(v))),
          ),
        );
      }
    }

    final wrapper = MiniScriptCache.instance.getWrapper<T>();

    if (wrapper == null) {
      throw UnsupportedError('Unsupported type: ${dartValue.runtimeType}');
    }

    return wrapper.call(dartValue);
  }

  /// Converts a MiniScript Value to a Dart object.
  ///
  /// This is the main conversion method that handles all MiniScript -> Dart
  /// conversions including primitives, collections, wrappers, and null values.
  static dynamic valueToDart<T extends Value>(T? value) {
    if (value == null || value is ValNull) {
      return null;
    }

    if (value is ValString) {
      return value.value;
    }

    if (value is ValNumber) {
      return value.value;
    }

    if (value is ValList) {
      return value.values;
    }

    // Handle BaseWrapper objects - import handled via late binding
    if (value is BaseWrapper) {
      // Use reflection-like approach to get userData
      try {
        final userData = (value as ValMap).userData;
        return userData;
      } catch (e) {
        // Fallback if userData access fails
        return value;
      }
    }

    if (value is ValMap) {
      return value.map.realMap;
    }

    // For other types, return as-is
    return value;
  }

  /// Gets the type name of a MiniScript Value as a string.
  static String getTypeName(Value? value) {
    if (value == null || value is ValNull) {
      return 'null';
    }

    if (value is ValString) {
      return 'string';
    }

    if (value is ValNumber) {
      return 'number';
    }

    if (value is ValList) {
      return 'list';
    }

    if (value is ValMap) {
      if (value.runtimeType.toString().contains('BaseWrapper')) {
        try {
          final userData = (value as dynamic).userData;
          return 'object(${userData.runtimeType})';
        } catch (e) {
          return 'object';
        }
      }
      return 'map';
    }

    return value.runtimeType.toString();
  }
}

/// Extension methods for Value to add convenience methods.
extension ValueExtensions on Value {
  /// Gets the type name of this Value.
  String get typeName => ConversionUtils.getTypeName(this);
}

/// Extension methods for common Dart types to convert to MiniScript Values.
extension DartExtensions on dynamic {
  /// Converts this Dart value to a MiniScript Value.
  Value? get asMiniScriptValue => ConversionUtils.dartToValue(this);
}

/// Global convenience functions for conversion
Value? dartToMiniScript(dynamic dartValue) =>
    ConversionUtils.dartToValue(dartValue);
dynamic miniScriptToDart(Value? value) => ConversionUtils.valueToDart(value);
