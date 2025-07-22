// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// MiniScriptWrapperGenerator
// **************************************************************************

// Generated MiniScript wrappers
// This file is auto-generated. Do not edit manually.

import "package:miniscript/miniscript_types/value.dart";
import "package:miniscript/miniscript_types/value_map.dart";
import "package:miniscript/miniscript_types/value_string.dart";
import "package:miniscript/miniscript_types/value_null.dart";

import "package:miniscriptgen/src/base_wrapper.dart";
import "package:miniscriptgen/src/cache.dart";

import "weapon.dart";

/// Generated wrapper for Weapon
class WeaponWrapper extends BaseWrapper<Weapon> {
  WeaponWrapper(Weapon dartObject) : super(dartObject);

  @override
  List<String> getPropertyNames() {
    return [
      "isBroken",
      "durabilityPercentage",
      "totalDamage",
      "name",
      "damage",
      "durability",
      "maxDurability",
      "type",
      "isEquipped",
      "enchantments",
      "id",
      "use",
      "repair",
      "addEnchantment",
      "removeEnchantment",
      "toggleEquipped",
      "getInfo",
      "toString",
    ];
  }

  @override
  Value? getProperty(String propertyName) {
    switch (propertyName) {
      case "isBroken":
        return dartToMiniScript(dartValue.isBroken);
      case "durabilityPercentage":
        return dartToMiniScript(dartValue.durabilityPercentage);
      case "totalDamage":
        return dartToMiniScript(dartValue.totalDamage);
      case "name":
        return dartToMiniScript(dartValue.name);
      case "damage":
        return dartToMiniScript(dartValue.damage);
      case "durability":
        return dartToMiniScript(dartValue.durability);
      case "maxDurability":
        return dartToMiniScript(dartValue.maxDurability);
      case "type":
        return dartToMiniScript(dartValue.type);
      case "isEquipped":
        return dartToMiniScript(dartValue.isEquipped);
      case "enchantments":
        return dartToMiniScript(dartValue.enchantments);
      case "id":
        return dartToMiniScript(dartValue.id);
      case "use":
        return _createUseMethod();
      case "repair":
        return _createRepairMethod();
      case "addEnchantment":
        return _createAddEnchantmentMethod();
      case "removeEnchantment":
        return _createRemoveEnchantmentMethod();
      case "toggleEquipped":
        return _createToggleEquippedMethod();
      case "getInfo":
        return _createGetInfoMethod();
      case "toString":
        return _createToStringMethod();
      default:
        return null;
    }
  }

  @override
  bool setProperty(String propertyName, Value? value) {
    switch (propertyName) {
      case "name":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is String || dartValue == null) {
            this.dartValue.name = dartValue;
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "damage":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is num || dartValue == null) {
            this.dartValue.damage = dartValue?.toInt();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "durability":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is num || dartValue == null) {
            this.dartValue.durability = dartValue?.toInt();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "maxDurability":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is num || dartValue == null) {
            this.dartValue.maxDurability = dartValue?.toInt();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "type":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is String || dartValue == null) {
            this.dartValue.type = dartValue;
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "isEquipped":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is bool || dartValue == null) {
            this.dartValue.isEquipped = dartValue;
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "enchantments":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is Map<String, dynamic> || dartValue == null) {
            this.dartValue.enchantments = dartValue;
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      default:
        return false;
    }
  }

  /// Creates a MiniScript callable method for use
  Value _createUseMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _useCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for use
  Value _useCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        var result = dartValue.use();
        valuePointer.value = dartToMiniScript(result);
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for repair
  Value _createRepairMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _repairCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for repair
  Value _repairCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        // TODO: Handle method parameters
        valuePointer.value = ValString("Method repair called");
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for addEnchantment
  Value _createAddEnchantmentMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _addEnchantmentCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for addEnchantment
  Value _addEnchantmentCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        // TODO: Handle method parameters
        valuePointer.value = ValString("Method addEnchantment called");
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for removeEnchantment
  Value _createRemoveEnchantmentMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _removeEnchantmentCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for removeEnchantment
  Value _removeEnchantmentCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        // TODO: Handle method parameters
        valuePointer.value = ValString("Method removeEnchantment called");
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for toggleEquipped
  Value _createToggleEquippedMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _toggleEquippedCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for toggleEquipped
  Value _toggleEquippedCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        dartValue.toggleEquipped();
        valuePointer.value = ValNull.instance;
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for getInfo
  Value _createGetInfoMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _getInfoCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for getInfo
  Value _getInfoCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        var result = dartValue.getInfo();
        valuePointer.value = dartToMiniScript(result);
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for toString
  Value _createToStringMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _toStringCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for toString
  Value _toStringCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        var result = dartValue.toString();
        valuePointer.value = dartToMiniScript(result);
        return true;
      }
      return false;
    };
    return callableMap;
  }
}

/// Factory function to create WeaponWrapper
WeaponWrapper createWeaponWrapper(Weapon dartObject) {
  return WeaponWrapper(dartObject);
}

/// Register Weapon wrapper with the cache
void registerWeaponWrapper() {
  MiniScriptCache.instance.registerWrapper<Weapon>(
    (weapon) => WeaponWrapper(weapon),
  );
}
