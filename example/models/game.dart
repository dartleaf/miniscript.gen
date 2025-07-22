import 'package:miniscriptgen/miniscriptgen.dart';
import 'player.dart';
import 'weapon.dart';

/// Example game class for testing MiniScript integration
@visible
class Game {
  String title;
  String version;
  int level;
  int maxLevel;
  bool isRunning;
  bool isPaused;
  List<Player> players;
  List<Weapon> weapons;
  Map<String, dynamic> settings;
  Map<String, int> highScores;

  @hide
  String adminPassword;

  final String sessionId;
  final DateTime startTime;

  Game(this.title, this.version, this.maxLevel)
    : level = 1,
      isRunning = false,
      isPaused = false,
      players = [],
      weapons = [],
      settings = {
        'difficulty': 'normal',
        'sound': true,
        'music': true,
        'graphics': 'high',
      },
      highScores = {},
      adminPassword = 'admin_${DateTime.now().millisecondsSinceEpoch}',
      sessionId = 'session_${DateTime.now().millisecondsSinceEpoch}',
      startTime = DateTime.now();

  /// Start the game
  void startGame() {
    isRunning = true;
    isPaused = false;
    print('$title v$version started!');
  }

  /// Pause the game
  void pauseGame() {
    if (isRunning) {
      isPaused = !isPaused;
      print('Game ${isPaused ? "paused" : "resumed"}');
    }
  }

  /// Stop the game
  void stopGame() {
    isRunning = false;
    isPaused = false;
    print('$title stopped');
  }

  /// Add a player to the game
  void addPlayer(Player player) {
    players.add(player);
    print('Player ${player.name} joined the game');
  }

  /// Remove a player from the game
  bool removePlayer(String playerName) {
    int index = players.indexWhere((p) => p.name == playerName);
    if (index != -1) {
      Player removed = players.removeAt(index);
      print('Player ${removed.name} left the game');
      return true;
    }
    return false;
  }

  /// Add a weapon to the game
  void addWeapon(Weapon weapon) {
    weapons.add(weapon);
    print('Weapon ${weapon.name} added to game');
  }

  /// Find player by name
  Player? findPlayer(String name) {
    try {
      return players.firstWhere((p) => p.name == name);
    } catch (e) {
      return null;
    }
  }

  /// Find weapon by name
  Weapon? findWeapon(String name) {
    try {
      return weapons.firstWhere((w) => w.name == name);
    } catch (e) {
      return null;
    }
  }

  /// Advance to next level
  void nextLevel() {
    if (level < maxLevel) {
      level++;
      print('Advanced to level $level');

      // Heal all players slightly when advancing
      for (var player in players) {
        player.heal(10);
      }
    } else {
      print('Maximum level reached!');
    }
  }

  /// Update game settings
  void updateSetting(String key, dynamic value) {
    settings[key] = value;
    print('Setting $key updated to $value');
  }

  /// Record high score
  void recordHighScore(String playerName, int score) {
    if (!highScores.containsKey(playerName) ||
        highScores[playerName]! < score) {
      highScores[playerName] = score;
      print('New high score for $playerName: $score');
    }
  }

  /// Get game state
  String get gameState {
    if (!isRunning) return 'stopped';
    if (isPaused) return 'paused';
    return 'running';
  }

  /// Get player count
  int get playerCount => players.length;

  /// Get weapon count
  int get weaponCount => weapons.length;

  /// Get total game time
  Duration get totalGameTime => DateTime.now().difference(startTime);

  /// Get game progress percentage
  double get progressPercentage => level / maxLevel;

  /// Check if game is complete
  bool get isComplete => level >= maxLevel;

  /// Get game statistics
  Map<String, dynamic> getStatistics() {
    return {
      'level': level,
      'maxLevel': maxLevel,
      'playerCount': playerCount,
      'weaponCount': weaponCount,
      'gameState': gameState,
      'totalPlayTime': totalGameTime.inSeconds,
      'progressPercentage': progressPercentage,
      'isComplete': isComplete,
    };
  }

  /// Get game info as string
  String getInfo() {
    return 'Game: $title v$version, Level: $level/$maxLevel, Players: $playerCount, State: $gameState';
  }

  @override
  String toString() {
    return 'Game(title: $title, version: $version, level: $level/$maxLevel, players: $playerCount, state: $gameState)';
  }
}
