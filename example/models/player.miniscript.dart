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

import "player.dart";

/// Generated wrapper for Player
class PlayerWrapper extends BaseWrapper<Player> {
  PlayerWrapper(Player dartObject) : super(dartObject);

  @override
  List<String> getPropertyNames() {
    return [
      "isAlive",
      "healthPercentage",
      "name",
      "health",
      "maxHealth",
      "score",
      "inventory",
      "stats",
      "id",
      "takeDamage",
      "heal",
      "addItem",
      "removeItem",
      "levelUp",
      "getInfo",
      "toString",
    ];
  }

  @override
  Value? getProperty(String propertyName) {
    switch (propertyName) {
      case "isAlive":
        return dartToMiniScript(dartValue.isAlive);
      case "healthPercentage":
        return dartToMiniScript(dartValue.healthPercentage);
      case "name":
        return dartToMiniScript(dartValue.name);
      case "health":
        return dartToMiniScript(dartValue.health);
      case "maxHealth":
        return dartToMiniScript(dartValue.maxHealth);
      case "score":
        return dartToMiniScript(dartValue.score);
      case "inventory":
        return dartToMiniScript(dartValue.inventory);
      case "stats":
        return dartToMiniScript(dartValue.stats);
      case "id":
        return dartToMiniScript(dartValue.id);
      case "takeDamage":
        return _createTakeDamageMethod();
      case "heal":
        return _createHealMethod();
      case "addItem":
        return _createAddItemMethod();
      case "removeItem":
        return _createRemoveItemMethod();
      case "levelUp":
        return _createLevelUpMethod();
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
      case "health":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is num || dartValue == null) {
            this.dartValue.health = dartValue?.toInt();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "maxHealth":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is num || dartValue == null) {
            this.dartValue.maxHealth = dartValue?.toInt();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "score":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is num || dartValue == null) {
            this.dartValue.score = dartValue?.toInt();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "inventory":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is List<String> || dartValue == null) {
            this.dartValue.inventory = dartValue;
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "stats":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is Map<String, dynamic> || dartValue == null) {
            this.dartValue.stats = dartValue;
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

  /// Creates a MiniScript callable method for takeDamage
  Value _createTakeDamageMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _takeDamageCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for takeDamage
  Value _takeDamageCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        // TODO: Handle method parameters
        valuePointer.value = ValString("Method takeDamage called");
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for heal
  Value _createHealMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _healCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for heal
  Value _healCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        // TODO: Handle method parameters
        valuePointer.value = ValString("Method heal called");
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for addItem
  Value _createAddItemMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _addItemCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for addItem
  Value _addItemCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        // TODO: Handle method parameters
        valuePointer.value = ValString("Method addItem called");
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for removeItem
  Value _createRemoveItemMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _removeItemCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for removeItem
  Value _removeItemCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        // TODO: Handle method parameters
        valuePointer.value = ValString("Method removeItem called");
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for levelUp
  Value _createLevelUpMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _levelUpCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for levelUp
  Value _levelUpCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        dartValue.levelUp();
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

/// Factory function to create PlayerWrapper
PlayerWrapper createPlayerWrapper(Player dartObject) {
  return PlayerWrapper(dartObject);
}

/// Register Player wrapper with the cache
void registerPlayerWrapper() {
  MiniScriptCache.instance.registerWrapper<Player>(
    (player) => PlayerWrapper(player),
  );
}
