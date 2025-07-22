// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// MiniScriptWrapperGenerator
// **************************************************************************

// Generated MiniScript wrappers
// This file is auto-generated. Do not edit manually.

import "package:miniscriptgenlib/miniscriptgenlib.dart";

import "game.dart";
import "player.dart";
import "weapon.dart";

/// Generated wrapper for Game
class GameWrapper extends BaseWrapper<Game> {
  GameWrapper(super.dartObject);

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
        return ConversionUtils.dartToValue(dartValue.gameState);
      case "playerCount":
        return ConversionUtils.dartToValue(dartValue.playerCount);
      case "weaponCount":
        return ConversionUtils.dartToValue(dartValue.weaponCount);
      case "totalGameTime":
        return ConversionUtils.dartToValue(dartValue.totalGameTime);
      case "progressPercentage":
        return ConversionUtils.dartToValue(dartValue.progressPercentage);
      case "isComplete":
        return ConversionUtils.dartToValue(dartValue.isComplete);
      case "title":
        return ConversionUtils.dartToValue(dartValue.title);
      case "version":
        return ConversionUtils.dartToValue(dartValue.version);
      case "level":
        return ConversionUtils.dartToValue(dartValue.level);
      case "maxLevel":
        return ConversionUtils.dartToValue(dartValue.maxLevel);
      case "isRunning":
        return ConversionUtils.dartToValue(dartValue.isRunning);
      case "isPaused":
        return ConversionUtils.dartToValue(dartValue.isPaused);
      case "players":
        return ConversionUtils.dartToValue(dartValue.players);
      case "weapons":
        return ConversionUtils.dartToValue(dartValue.weapons);
      case "settings":
        return ConversionUtils.dartToValue(dartValue.settings);
      case "highScores":
        return ConversionUtils.dartToValue(dartValue.highScores);
      case "sessionId":
        return ConversionUtils.dartToValue(dartValue.sessionId);
      case "startTime":
        return ConversionUtils.dartToValue(dartValue.startTime);
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
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.title =
              ConversionUtils.hardConvert<String>(dartValue) as String;
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "version":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.version =
              ConversionUtils.hardConvert<String>(dartValue) as String;
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "level":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          if (dartValue is int || dartValue is double) {
            this.dartValue.level = dartValue.toInt();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "maxLevel":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          if (dartValue is int || dartValue is double) {
            this.dartValue.maxLevel = dartValue.toInt();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "isRunning":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.isRunning =
              ConversionUtils.hardConvert<bool>(dartValue) as bool;
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "isPaused":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.isPaused =
              ConversionUtils.hardConvert<bool>(dartValue) as bool;
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "players":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.players = (dartValue).cast<Player>();
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "weapons":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.weapons = (dartValue).cast<Weapon>();
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "settings":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.settings = (dartValue).cast<String, dynamic>();
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "highScores":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.highScores = (dartValue).cast<String, int>();
          return true;
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
    final fn = Intrinsic.create("_\$");
    fn.name = "startGame";
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      dartValue.startGame();
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for pauseGame
  Value _createPauseGameMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "pauseGame";
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      dartValue.pauseGame();
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for stopGame
  Value _createStopGameMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "stopGame";
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      dartValue.stopGame();
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for addPlayer
  Value _createAddPlayerMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "addPlayer";
    fn.addParam("player");
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var player = ConversionUtils.valueToDart(context.getLocal("player"));
      if (player == null) {
        return ValString("Missing required argument: player");
      }
      dartValue.addPlayer(player);
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for removePlayer
  Value _createRemovePlayerMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "removePlayer";
    fn.addParam("playerName");
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var playerName =
          ConversionUtils.valueToDart(context.getLocal("playerName"));
      if (playerName == null) {
        return ValString("Missing required argument: playerName");
      }
      var result = dartValue.removePlayer(playerName);
      return ConversionUtils.dartToValue(result);
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for addWeapon
  Value _createAddWeaponMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "addWeapon";
    fn.addParam("weapon");
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var weapon = ConversionUtils.valueToDart(context.getLocal("weapon"));
      if (weapon == null) {
        return ValString("Missing required argument: weapon");
      }
      dartValue.addWeapon(weapon);
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for findPlayer
  Value _createFindPlayerMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "findPlayer";
    fn.addParam("name");
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var name = ConversionUtils.valueToDart(context.getLocal("name"));
      if (name == null) {
        return ValString("Missing required argument: name");
      }
      var result = dartValue.findPlayer(name);
      return ConversionUtils.dartToValue(result);
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for findWeapon
  Value _createFindWeaponMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "findWeapon";
    fn.addParam("name");
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var name = ConversionUtils.valueToDart(context.getLocal("name"));
      if (name == null) {
        return ValString("Missing required argument: name");
      }
      var result = dartValue.findWeapon(name);
      return ConversionUtils.dartToValue(result);
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for nextLevel
  Value _createNextLevelMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "nextLevel";
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      dartValue.nextLevel();
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for updateSetting
  Value _createUpdateSettingMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "updateSetting";
    fn.addParam("key");
    fn.addParam("value");
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var key = ConversionUtils.valueToDart(context.getLocal("key"));
      if (key == null) {
        return ValString("Missing required argument: key");
      }
      var value = ConversionUtils.valueToDart(context.getLocal("value"));
      if (value == null) {
        return ValString("Missing required argument: value");
      }
      dartValue.updateSetting(key, value);
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for recordHighScore
  Value _createRecordHighScoreMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "recordHighScore";
    fn.addParam("playerName");
    fn.addParam("score");
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var playerName =
          ConversionUtils.valueToDart(context.getLocal("playerName"));
      if (playerName == null) {
        return ValString("Missing required argument: playerName");
      }
      var score = ConversionUtils.valueToDart(context.getLocal("score"));
      if (score == null) {
        return ValString("Missing required argument: score");
      }
      if (score is int) score = score.toInt();
      dartValue.recordHighScore(playerName, score);
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for getStatistics
  Value _createGetStatisticsMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "getStatistics";
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var result = dartValue.getStatistics();
      return ConversionUtils.dartToValue(result);
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for getInfo
  Value _createGetInfoMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "getInfo";
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var result = dartValue.getInfo();
      return ConversionUtils.dartToValue(result);
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for toString
  Value _createToStringMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "toString";
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var result = dartValue.toString();
      return ConversionUtils.dartToValue(result);
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
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
