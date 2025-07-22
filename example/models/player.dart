import 'package:miniscriptgen/miniscriptgen.dart';

/// Example player class for testing MiniScript integration
@visible
class Player {
  String name;
  int health;
  int maxHealth;
  int score;
  List<String> inventory;
  Map<String, dynamic> stats;

  // ignore: unused_field
  final String _secretKey;

  final String id;

  Player(this.name, this.health, this.maxHealth, this.score)
    : inventory = [],
      stats = {},
      _secretKey = 'player_secret_${DateTime.now().millisecondsSinceEpoch}',
      id = 'player_${DateTime.now().millisecondsSinceEpoch}';

  /// Take damage and reduce health
  void takeDamage(int damage) {
    health -= damage;
    if (health < 0) health = 0;
    print('$name took $damage damage. Health: $health');
  }

  /// Heal the player
  void heal(int amount) {
    health += amount;
    if (health > maxHealth) health = maxHealth;
    print('$name healed $amount HP. Health: $health');
  }

  /// Add item to inventory
  void addItem(String item) {
    inventory.add(item);
    print('$name picked up: $item');
  }

  /// Remove item from inventory
  bool removeItem(String item) {
    bool removed = inventory.remove(item);
    if (removed) {
      print('$name used: $item');
    }
    return removed;
  }

  /// Check if player is alive
  bool get isAlive => health > 0;

  /// Get current health percentage
  double get healthPercentage => health / maxHealth;

  /// Level up (increases max health)
  void levelUp() {
    maxHealth += 10;
    health = maxHealth;
    score += 100;
    print('$name leveled up! Max health: $maxHealth');
  }

  /// Get player info as string
  String getInfo() {
    return 'Player: $name, Health: $health/$maxHealth, Score: $score';
  }

  @override
  String toString() {
    return 'Player(name: $name, health: $health/$maxHealth, score: $score)';
  }
}
