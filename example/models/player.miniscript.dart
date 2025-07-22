// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// MiniScriptWrapperGenerator
// **************************************************************************

// Generated MiniScript wrappers
// This file is auto-generated. Do not edit manually.

import "package:miniscript/miniscript_intrinsics/intrinsic.dart";
import "package:miniscript/miniscript_intrinsics/intrinsic_result.dart";
import "package:miniscript/miniscript_tac/context.dart";
import "package:miniscriptgen/miniscriptgen.dart";

import "player.dart";

/// Generated wrapper for Player
class PlayerWrapper extends BaseWrapper<Player> {
  PlayerWrapper(super.dartObject);

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
        return ConversionUtils.dartToValue(dartValue.isAlive);
      case "healthPercentage":
        return ConversionUtils.dartToValue(dartValue.healthPercentage);
      case "name":
        return ConversionUtils.dartToValue(dartValue.name);
      case "health":
        return ConversionUtils.dartToValue(dartValue.health);
      case "maxHealth":
        return ConversionUtils.dartToValue(dartValue.maxHealth);
      case "score":
        return ConversionUtils.dartToValue(dartValue.score);
      case "inventory":
        return ConversionUtils.dartToValue(dartValue.inventory);
      case "stats":
        return ConversionUtils.dartToValue(dartValue.stats);
      case "id":
        return ConversionUtils.dartToValue(dartValue.id);
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
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.name =
              ConversionUtils.hardConvert<String>(dartValue) as String;
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "health":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          if (dartValue is num) {
            this.dartValue.health = dartValue.toInt();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "maxHealth":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          if (dartValue is num) {
            this.dartValue.maxHealth = dartValue.toInt();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "score":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          if (dartValue is num) {
            this.dartValue.score = dartValue.toInt();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "inventory":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.inventory = (dartValue).cast<String>();
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "stats":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.stats = (dartValue).cast<String, dynamic>();
          return true;
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
    final fn = Intrinsic.create("_\$");
    fn.name = "takeDamage";
    fn.addParam("damage");
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var damage = ConversionUtils.valueToDart(context.getLocal("damage"));
      if (damage == null) {
        return ValString("Missing required argument: damage");
      }
      if (damage is num) damage = damage.toInt();
      dartValue.takeDamage(damage);
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for heal
  Value _createHealMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "heal";
    fn.addParam("amount");
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var amount = ConversionUtils.valueToDart(context.getLocal("amount"));
      if (amount == null) {
        return ValString("Missing required argument: amount");
      }
      if (amount is num) amount = amount.toInt();
      dartValue.heal(amount);
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for addItem
  Value _createAddItemMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "addItem";
    fn.addParam("item");
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var item = ConversionUtils.valueToDart(context.getLocal("item"));
      if (item == null) {
        return ValString("Missing required argument: item");
      }
      dartValue.addItem(item);
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for removeItem
  Value _createRemoveItemMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "removeItem";
    fn.addParam("item");
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var item = ConversionUtils.valueToDart(context.getLocal("item"));
      if (item == null) {
        return ValString("Missing required argument: item");
      }
      var result = dartValue.removeItem(item);
      return ConversionUtils.dartToValue(result);
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for levelUp
  Value _createLevelUpMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "levelUp";
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      dartValue.levelUp();
      return ValNull.instance;
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
