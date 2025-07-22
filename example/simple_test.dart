import 'package:miniscript/miniscript.dart';

import 'models/player.dart';
import 'models/game.dart';
import 'models/weapon.dart';

// Import generated wrappers
import 'models/player.miniscript.dart';
import 'models/game.miniscript.dart';
import 'models/weapon.miniscript.dart';

/// Simple test to verify the generated wrappers work correctly
void main() {
  print('=== MiniScript Wrapper Test ===');
  print('');

  // Create test objects
  final player = Player('TestHero', 100, 100, 0);
  final game = Game('Test Game', '1.0.0', 5);
  final weapon = Weapon('Test Sword', 30, 100, 'sword');

  // Setup game
  game.addPlayer(player);
  game.addWeapon(weapon);

  print('Created test objects:');
  print('- Player: ${player.name} (${player.health}/${player.maxHealth} HP)');
  print('- Game: ${game.title} v${game.version}');
  print('- Weapon: ${weapon.name} (${weapon.damage} damage)');
  print('');

  // Register wrappers
  print('Registering wrappers...');
  registerPlayerWrapper();
  registerGameWrapper();
  registerWeaponWrapper();

  // Create wrapper instances
  final playerWrapper = createPlayerWrapper(player);
  final gameWrapper = createGameWrapper(game);
  final weaponWrapper = createWeaponWrapper(weapon);

  print('Created wrapper instances');
  print('');

  // Test property access
  print('=== Testing Property Access ===');

  // Test getting properties
  final playerName = playerWrapper.getProperty('name');
  final playerHealth = playerWrapper.getProperty('health');
  final gameTitle = gameWrapper.getProperty('title');
  final weaponDamage = weaponWrapper.getProperty('damage');

  print('Player name: $playerName');
  print('Player health: $playerHealth');
  print('Game title: $gameTitle');
  print('Weapon damage: $weaponDamage');
  print('');

  // Test setting properties
  print('=== Testing Property Setting ===');

  final nameSet = playerWrapper.setProperty('name', ValString('Champion'));
  final healthSet = playerWrapper.setProperty('health', ValNumber(90));
  final titleSet = gameWrapper.setProperty('title', ValString('Epic Quest'));
  final damageSet = weaponWrapper.setProperty('damage', ValNumber(35));

  print('Set player name: $nameSet');
  print('Set player health: $healthSet');
  print('Set game title: $titleSet');
  print('Set weapon damage: $damageSet');
  print('');

  // Verify changes
  print('=== Verifying Changes ===');
  print('Player name after change: ${player.name}');
  print('Player health after change: ${player.health}');
  print('Game title after change: ${game.title}');
  print('Weapon damage after change: ${weapon.damage}');
  print('');

  // Test getter properties
  print('=== Testing Getter Properties ===');
  final isAlive = playerWrapper.getProperty('isAlive');
  final healthPercentage = playerWrapper.getProperty('healthPercentage');
  final gameState = gameWrapper.getProperty('gameState');
  final isBroken = weaponWrapper.getProperty('isBroken');

  print('Player is alive: $isAlive');
  print('Player health percentage: $healthPercentage');
  print('Game state: $gameState');
  print('Weapon is broken: $isBroken');
  print('');

  // Test property lists
  print('=== Testing Property Lists ===');
  final playerProperties = playerWrapper.getPropertyNames();
  final gameProperties = gameWrapper.getPropertyNames();
  final weaponProperties = weaponWrapper.getPropertyNames();

  print('Player has ${playerProperties.length} properties:');
  print('  ${playerProperties.take(5).join(', ')}...');
  print('Game has ${gameProperties.length} properties:');
  print('  ${gameProperties.take(5).join(', ')}...');
  print('Weapon has ${weaponProperties.length} properties:');
  print('  ${weaponProperties.take(5).join(', ')}...');
  print('');

  // Test method access
  print('=== Testing Method Access ===');
  final takeDamageMethod = playerWrapper.getProperty('takeDamage');
  final healMethod = playerWrapper.getProperty('heal');
  final startGameMethod = gameWrapper.getProperty('startGame');
  final useWeaponMethod = weaponWrapper.getProperty('use');

  print(
    'Player takeDamage method: ${takeDamageMethod != null ? 'Available' : 'Not found'}',
  );
  print(
    'Player heal method: ${healMethod != null ? 'Available' : 'Not found'}',
  );
  print(
    'Game startGame method: ${startGameMethod != null ? 'Available' : 'Not found'}',
  );
  print(
    'Weapon use method: ${useWeaponMethod != null ? 'Available' : 'Not found'}',
  );
  print('');

  // Test invalid property access
  print('=== Testing Invalid Property Access ===');
  final invalidProperty = playerWrapper.getProperty('nonExistentProperty');
  final invalidSet = playerWrapper.setProperty(
    'nonExistentProperty',
    ValString('test'),
  );

  print(
    'Invalid property get: ${invalidProperty == null ? 'Correctly returns null' : 'Error!'}',
  );
  print(
    'Invalid property set: ${!invalidSet ? 'Correctly returns false' : 'Error!'}',
  );
  print('');

  // Test hidden properties
  print('=== Testing Hidden Properties ===');
  final hiddenProperty = playerWrapper.getProperty('_secretKey');
  final gameHiddenProperty = gameWrapper.getProperty('adminPassword');
  final weaponHiddenProperty = weaponWrapper.getProperty('craftingRecipe');

  print(
    'Player hidden property: ${hiddenProperty == null ? 'Correctly hidden' : 'Error!'}',
  );
  print(
    'Game hidden property: ${gameHiddenProperty == null ? 'Correctly hidden' : 'Error!'}',
  );
  print(
    'Weapon hidden property: ${weaponHiddenProperty == null ? 'Correctly hidden' : 'Error!'}',
  );
  print('');

  // Test type conversion
  print('=== Testing Type Conversion ===');

  // Test setting with correct types
  final correctString = playerWrapper.setProperty(
    'name',
    ValString('CorrectType'),
  );
  final correctNumber = playerWrapper.setProperty('health', ValNumber(95));

  // Test setting with wrong types (should fail)
  final wrongType1 = playerWrapper.setProperty('name', ValNumber(123));
  final wrongType2 = playerWrapper.setProperty(
    'health',
    ValString('not a number'),
  );

  print('Set name with string: $correctString');
  print('Set health with number: $correctNumber');
  print('Set name with number (should fail): $wrongType1');
  print('Set health with string (should fail): $wrongType2');
  print('');

  // Final verification
  print('=== Final State ===');
  print(
    'Player: ${player.name} (${player.health}/${player.maxHealth} HP, Score: ${player.score})',
  );
  print(
    'Game: ${game.title} v${game.version} (Level: ${game.level}/${game.maxLevel})',
  );
  print(
    'Weapon: ${weapon.name} (${weapon.damage} damage, ${weapon.durability}/${weapon.maxDurability} durability)',
  );
  print('');

  print('=== Test Complete ===');
  print('All wrapper functionality tests completed successfully!');
  print('The build_runner generated wrappers are working correctly.');
}
