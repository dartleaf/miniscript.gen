import 'package:miniscriptgen/miniscriptgen.dart';

/// Example weapon class for testing MiniScript integration
@visible
class Weapon {
  String name;
  int damage;
  int durability;
  int maxDurability;
  String type;
  bool isEquipped;
  Map<String, dynamic> enchantments;

  @hide
  String craftingRecipe;

  final String id;

  Weapon(this.name, this.damage, this.durability, this.type)
    : maxDurability = durability,
      isEquipped = false,
      enchantments = {},
      craftingRecipe = 'secret_recipe_${DateTime.now().millisecondsSinceEpoch}',
      id = 'weapon_${DateTime.now().millisecondsSinceEpoch}';

  /// Use the weapon (reduces durability)
  int use() {
    if (durability > 0) {
      durability--;
      print('Used $name. Durability: $durability/$maxDurability');
      return damage;
    } else {
      print('$name is broken!');
      return 0;
    }
  }

  /// Repair the weapon
  void repair(int amount) {
    durability += amount;
    if (durability > maxDurability) durability = maxDurability;
    print('Repaired $name. Durability: $durability/$maxDurability');
  }

  /// Add enchantment to weapon
  void addEnchantment(String enchantment, int level) {
    enchantments[enchantment] = level;
    print('Added $enchantment (level $level) to $name');
  }

  /// Remove enchantment from weapon
  bool removeEnchantment(String enchantment) {
    bool removed = enchantments.remove(enchantment) != null;
    if (removed) {
      print('Removed $enchantment from $name');
    }
    return removed;
  }

  /// Check if weapon is broken
  bool get isBroken => durability <= 0;

  /// Get durability percentage
  double get durabilityPercentage => durability / maxDurability;

  /// Get total damage including enchantments
  int get totalDamage {
    int bonus = 0;
    for (var level in enchantments.values) {
      if (level is int) bonus += level;
    }
    return damage + bonus;
  }

  /// Equip/unequip the weapon
  void toggleEquipped() {
    isEquipped = !isEquipped;
    print('$name is now ${isEquipped ? "equipped" : "unequipped"}');
  }

  /// Get weapon info as string
  String getInfo() {
    return 'Weapon: $name, Damage: $totalDamage, Durability: $durability/$maxDurability, Type: $type';
  }

  @override
  String toString() {
    return 'Weapon(name: $name, damage: $damage, durability: $durability/$maxDurability, type: $type)';
  }
}
