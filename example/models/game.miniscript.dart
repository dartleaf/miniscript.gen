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

import "game.dart";
import "player.dart";
import "weapon.dart";

/// Generated wrapper for Game
class GameWrapper extends BaseWrapper<Game> {
  GameWrapper(Game dartObject) : super(dartObject);

  @override
  List<String> getPropertyNames() {
    return [
      "gameState",
      "playerCount",
      "weaponCount",
      "totalGameTime",
      "progressPercentage",
      "isComplete",
      "title",
      "version",
      "level",
      "maxLevel",
      "isRunning",
      "isPaused",
      "players",
      "weapons",
      "settings",
      "highScores",
      "sessionId",
      "startTime",
      "startGame",
      "pauseGame",
      "stopGame",
      "addPlayer",
      "removePlayer",
      "addWeapon",
      "findPlayer",
      "findWeapon",
      "nextLevel",
      "updateSetting",
      "recordHighScore",
      "getStatistics",
      "getInfo",
      "toString",
    ];
  }

  @override
  Value? getProperty(String propertyName) {
    switch (propertyName) {
      case "gameState":
        return dartToMiniScript(dartValue.gameState);
      case "playerCount":
        return dartToMiniScript(dartValue.playerCount);
      case "weaponCount":
        return dartToMiniScript(dartValue.weaponCount);
      case "totalGameTime":
        return dartToMiniScript(dartValue.totalGameTime);
      case "progressPercentage":
        return dartToMiniScript(dartValue.progressPercentage);
      case "isComplete":
        return dartToMiniScript(dartValue.isComplete);
      case "title":
        return dartToMiniScript(dartValue.title);
      case "version":
        return dartToMiniScript(dartValue.version);
      case "level":
        return dartToMiniScript(dartValue.level);
      case "maxLevel":
        return dartToMiniScript(dartValue.maxLevel);
      case "isRunning":
        return dartToMiniScript(dartValue.isRunning);
      case "isPaused":
        return dartToMiniScript(dartValue.isPaused);
      case "players":
        return dartToMiniScript(dartValue.players);
      case "weapons":
        return dartToMiniScript(dartValue.weapons);
      case "settings":
        return dartToMiniScript(dartValue.settings);
      case "highScores":
        return dartToMiniScript(dartValue.highScores);
      case "sessionId":
        return dartToMiniScript(dartValue.sessionId);
      case "startTime":
        return dartToMiniScript(dartValue.startTime);
      case "startGame":
        return _createStartGameMethod();
      case "pauseGame":
        return _createPauseGameMethod();
      case "stopGame":
        return _createStopGameMethod();
      case "addPlayer":
        return _createAddPlayerMethod();
      case "removePlayer":
        return _createRemovePlayerMethod();
      case "addWeapon":
        return _createAddWeaponMethod();
      case "findPlayer":
        return _createFindPlayerMethod();
      case "findWeapon":
        return _createFindWeaponMethod();
      case "nextLevel":
        return _createNextLevelMethod();
      case "updateSetting":
        return _createUpdateSettingMethod();
      case "recordHighScore":
        return _createRecordHighScoreMethod();
      case "getStatistics":
        return _createGetStatisticsMethod();
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
      case "title":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is String || dartValue == null) {
            this.dartValue.title = dartValue;
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "version":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is String || dartValue == null) {
            this.dartValue.version = dartValue;
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "level":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is num || dartValue == null) {
            this.dartValue.level = dartValue?.toInt();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "maxLevel":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is num || dartValue == null) {
            this.dartValue.maxLevel = dartValue?.toInt();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "isRunning":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is bool || dartValue == null) {
            this.dartValue.isRunning = dartValue;
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "isPaused":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is bool || dartValue == null) {
            this.dartValue.isPaused = dartValue;
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "players":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is List<Player> || dartValue == null) {
            this.dartValue.players = dartValue;
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "weapons":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is List<Weapon> || dartValue == null) {
            this.dartValue.weapons = dartValue;
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "settings":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is Map<String, dynamic> || dartValue == null) {
            this.dartValue.settings = dartValue;
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "highScores":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is Map<String, int> || dartValue == null) {
            this.dartValue.highScores = dartValue;
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

  /// Creates a MiniScript callable method for startGame
  Value _createStartGameMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _startGameCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for startGame
  Value _startGameCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        dartValue.startGame();
        valuePointer.value = ValNull.instance;
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for pauseGame
  Value _createPauseGameMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _pauseGameCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for pauseGame
  Value _pauseGameCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        dartValue.pauseGame();
        valuePointer.value = ValNull.instance;
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for stopGame
  Value _createStopGameMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _stopGameCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for stopGame
  Value _stopGameCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        dartValue.stopGame();
        valuePointer.value = ValNull.instance;
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for addPlayer
  Value _createAddPlayerMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _addPlayerCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for addPlayer
  Value _addPlayerCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        // TODO: Handle method parameters
        valuePointer.value = ValString("Method addPlayer called");
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for removePlayer
  Value _createRemovePlayerMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _removePlayerCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for removePlayer
  Value _removePlayerCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        // TODO: Handle method parameters
        valuePointer.value = ValString("Method removePlayer called");
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for addWeapon
  Value _createAddWeaponMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _addWeaponCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for addWeapon
  Value _addWeaponCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        // TODO: Handle method parameters
        valuePointer.value = ValString("Method addWeapon called");
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for findPlayer
  Value _createFindPlayerMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _findPlayerCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for findPlayer
  Value _findPlayerCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        // TODO: Handle method parameters
        valuePointer.value = ValString("Method findPlayer called");
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for findWeapon
  Value _createFindWeaponMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _findWeaponCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for findWeapon
  Value _findWeaponCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        // TODO: Handle method parameters
        valuePointer.value = ValString("Method findWeapon called");
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for nextLevel
  Value _createNextLevelMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _nextLevelCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for nextLevel
  Value _nextLevelCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        dartValue.nextLevel();
        valuePointer.value = ValNull.instance;
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for updateSetting
  Value _createUpdateSettingMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _updateSettingCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for updateSetting
  Value _updateSettingCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        // TODO: Handle method parameters
        valuePointer.value = ValString("Method updateSetting called");
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for recordHighScore
  Value _createRecordHighScoreMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _recordHighScoreCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for recordHighScore
  Value _recordHighScoreCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        // TODO: Handle method parameters
        valuePointer.value = ValString("Method recordHighScore called");
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for getStatistics
  Value _createGetStatisticsMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _getStatisticsCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for getStatistics
  Value _getStatisticsCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        var result = dartValue.getStatistics();
        valuePointer.value = dartToMiniScript(result);
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

/// Factory function to create GameWrapper
GameWrapper createGameWrapper(Game dartObject) {
  return GameWrapper(dartObject);
}

/// Register Game wrapper with the cache
void registerGameWrapper() {
  MiniScriptCache.instance.registerWrapper<Game>(
    (game) => GameWrapper(game),
  );
}
