import 'package:miniscript/miniscript.dart';

import 'models/player.dart';
import 'models/game.dart';
import 'models/weapon.dart';

// Import generated wrappers
import 'models/player.miniscript.dart';
import 'models/game.miniscript.dart';
import 'models/weapon.miniscript.dart';

/// Demonstration of using generated MiniScript wrappers
void main() {
  print('=== MiniScript Wrapper Generation Demo ===\n');

  // Create Dart objects
  final player = Player('Hero', 100, 100, 0);
  final game = Game('Adventure Quest', '1.0.0', 10);
  final weapon = Weapon('Iron Sword', 25, 100, 'melee');

  // Set up the game
  game.addPlayer(player);
  game.addWeapon(weapon);
  game.startGame();

  print('Created game objects:');
  print('- ${player.getInfo()}');
  print('- ${game.getInfo()}');
  print('- ${weapon.getInfo()}');
  print('');

  // Register all generated wrappers
  print('Registering MiniScript wrappers...');
  registerPlayerWrapper();
  registerGameWrapper();
  registerWeaponWrapper();

  // Create wrapper instances
  final playerWrapper = createPlayerWrapper(player);
  final gameWrapper = createGameWrapper(game);
  final weaponWrapper = createWeaponWrapper(weapon);

  print('Created wrapper instances');
  print('');

  // Create MiniScript interpreter
  final interpreter = Interpreter();

  // Add wrapped objects to MiniScript globals
  interpreter.setGlobalValue('player', playerWrapper);
  interpreter.setGlobalValue('game', gameWrapper);
  interpreter.setGlobalValue('weapon', weaponWrapper);

  print('Added objects to MiniScript interpreter');
  print('');

  // Example MiniScript code to test the wrappers
  final miniScriptCode = '''
// Test property access
print "Player name: " + player.name
print "Player health: " + player.health
print "Player max health: " + player.maxHealth
print "Player score: " + player.score
print "Player is alive: " + player.isAlive

// Test property modification
player.name = "Champion"
player.health = 80
print "Updated player name: " + player.name
print "Updated player health: " + player.health

// Test game properties
print "Game title: " + game.title
print "Game version: " + game.version
print "Game level: " + game.level
print "Game is running: " + game.isRunning
print "Player count: " + game.playerCount

// Test weapon properties
print "Weapon name: " + weapon.name
print "Weapon damage: " + weapon.damage
print "Weapon durability: " + weapon.durability
print "Weapon is equipped: " + weapon.isEquipped

// Test method calls (basic ones that work)
print "Player info: " + player.getInfo()
print "Game info: " + game.getInfo()
print "Weapon info: " + weapon.getInfo()

// Test getter properties
print "Player health percentage: " + player.healthPercentage
print "Game progress: " + game.progressPercentage
print "Weapon durability percentage: " + weapon.durabilityPercentage

// Test boolean properties
print "Player is alive: " + player.isAlive
print "Game is complete: " + game.isComplete
print "Weapon is broken: " + weapon.isBroken

// Test complex properties
print "Player inventory size: " + player.inventory.len
print "Game settings keys: " + game.settings.keys.len
print "Weapon enchantments: " + weapon.enchantments.len
''';

  print('=== Executing MiniScript Code ===');
  print('MiniScript code to execute:');
  print(miniScriptCode);
  print('');
  print('=== Output ===');

  try {
    interpreter.source = miniScriptCode;
    interpreter.compile();
    interpreter.runUntilDone();
    print('Execution completed successfully');
  } catch (e) {
    print('Error executing MiniScript: $e');
  }

  print('');
  print('=== Final State ===');
  print('- ${player.getInfo()}');
  print('- ${game.getInfo()}');
  print('- ${weapon.getInfo()}');
  print('');

  // Demonstrate wrapper property access
  print('=== Direct Wrapper Testing ===');
  print('Testing property access through wrappers:');

  // Test getting properties
  final playerName = playerWrapper.getProperty('name');
  final playerHealth = playerWrapper.getProperty('health');
  final gameTitle = gameWrapper.getProperty('title');
  final weaponDamage = weaponWrapper.getProperty('damage');

  print('Player name (from wrapper): $playerName');
  print('Player health (from wrapper): $playerHealth');
  print('Game title (from wrapper): $gameTitle');
  print('Weapon damage (from wrapper): $weaponDamage');
  print('');

  // Test setting properties
  print('Setting properties through wrappers:');
  final nameSet = playerWrapper.setProperty('name', ValString('Warrior'));
  final healthSet = playerWrapper.setProperty('health', ValNumber(90));
  final titleSet = gameWrapper.setProperty('title', ValString('Epic Quest'));

  print('Set player name: $nameSet');
  print('Set player health: $healthSet');
  print('Set game title: $titleSet');
  print('');

  // Test property names
  print('Available properties:');
  print('Player properties: ${playerWrapper.getPropertyNames()}');
  print('Game properties: ${gameWrapper.getPropertyNames()}');
  print('Weapon properties: ${weaponWrapper.getPropertyNames()}');
  print('');

  print('=== Demo Complete ===');
  print('The build_runner integration successfully generated wrappers for:');
  print(
    '- Player class (${playerWrapper.getPropertyNames().length} properties)',
  );
  print('- Game class (${gameWrapper.getPropertyNames().length} properties)');
  print(
    '- Weapon class (${weaponWrapper.getPropertyNames().length} properties)',
  );
  print('');
  print('These wrappers enable seamless integration between Dart objects');
  print(
    'and MiniScript code, with automatic type conversion and property access.',
  );
}

/// Helper function to demonstrate wrapper capabilities
void demonstrateWrapperCapabilities() {
  print('=== Wrapper Capabilities ===');
  print('Generated wrappers provide:');
  print('1. Property access (getProperty/setProperty)');
  print('2. Method binding (callable from MiniScript)');
  print('3. Type conversion (Dart ↔ MiniScript)');
  print('4. Registration with MiniScript cache');
  print('5. Factory functions for easy instantiation');
  print('6. Support for @hide annotation');
  print('7. Automatic handling of getters/setters');
  print('8. Method parameter support (TODO for complex methods)');
  print('');
}

/// Helper function to show build_runner commands
void showBuildCommands() {
  print('=== Build Commands ===');
  print('To regenerate wrappers:');
  print('  dart run build_runner build');
  print('  dart run build_runner build --delete-conflicting-outputs');
  print('  dart run build_runner watch');
  print('  dart run build_runner clean');
  print('');
  print('Or use the helper script:');
  print('  dart scripts/build.dart build');
  print('  dart scripts/build.dart watch');
  print('  dart scripts/build.dart clean');
  print('  dart scripts/build.dart rebuild');
  print('');
}
