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

import "weapon.dart";

/// Generated wrapper for Weapon
class WeaponWrapper extends BaseWrapper<Weapon> {
  WeaponWrapper(super.dartObject);

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
        return ConversionUtils.dartToValue(dartValue.isBroken);
      case "durabilityPercentage":
        return ConversionUtils.dartToValue(dartValue.durabilityPercentage);
      case "totalDamage":
        return ConversionUtils.dartToValue(dartValue.totalDamage);
      case "name":
        return ConversionUtils.dartToValue(dartValue.name);
      case "damage":
        return ConversionUtils.dartToValue(dartValue.damage);
      case "durability":
        return ConversionUtils.dartToValue(dartValue.durability);
      case "maxDurability":
        return ConversionUtils.dartToValue(dartValue.maxDurability);
      case "type":
        return ConversionUtils.dartToValue(dartValue.type);
      case "isEquipped":
        return ConversionUtils.dartToValue(dartValue.isEquipped);
      case "enchantments":
        return ConversionUtils.dartToValue(dartValue.enchantments);
      case "id":
        return ConversionUtils.dartToValue(dartValue.id);
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
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.name =
              ConversionUtils.hardConvert<String>(dartValue) as String;
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "damage":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          if (dartValue is num) {
            this.dartValue.damage = dartValue.toInt();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "durability":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          if (dartValue is num) {
            this.dartValue.durability = dartValue.toInt();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "maxDurability":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          if (dartValue is num) {
            this.dartValue.maxDurability = dartValue.toInt();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "type":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.type =
              ConversionUtils.hardConvert<String>(dartValue) as String;
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "isEquipped":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.isEquipped =
              ConversionUtils.hardConvert<bool>(dartValue) as bool;
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "enchantments":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.enchantments = (dartValue).cast<String, dynamic>();
          return true;
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
    final fn = Intrinsic.create("_\$");
    fn.name = "use";
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var result = dartValue.use();
      return ConversionUtils.dartToValue(result);
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for repair
  Value _createRepairMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "repair";
    fn.addParam("amount");
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var amount = ConversionUtils.valueToDart(context.getLocal("amount"));
      if (amount == null) {
        return ValString("Missing required argument: amount");
      }
      if (amount is num) amount = amount.toInt();
      dartValue.repair(amount);
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for addEnchantment
  Value _createAddEnchantmentMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "addEnchantment";
    fn.addParam("enchantment");
    fn.addParam("level");
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var enchantment =
          ConversionUtils.valueToDart(context.getLocal("enchantment"));
      if (enchantment == null) {
        return ValString("Missing required argument: enchantment");
      }
      var level = ConversionUtils.valueToDart(context.getLocal("level"));
      if (level == null) {
        return ValString("Missing required argument: level");
      }
      if (level is num) level = level.toInt();
      dartValue.addEnchantment(enchantment, level);
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for removeEnchantment
  Value _createRemoveEnchantmentMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "removeEnchantment";
    fn.addParam("enchantment");
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var enchantment =
          ConversionUtils.valueToDart(context.getLocal("enchantment"));
      if (enchantment == null) {
        return ValString("Missing required argument: enchantment");
      }
      var result = dartValue.removeEnchantment(enchantment);
      return ConversionUtils.dartToValue(result);
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for toggleEquipped
  Value _createToggleEquippedMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "toggleEquipped";
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      dartValue.toggleEquipped();
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
