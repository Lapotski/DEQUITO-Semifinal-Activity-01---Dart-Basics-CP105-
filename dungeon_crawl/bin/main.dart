import 'dart:io';
import 'dart:math';
import '../lib/models/enemy.dart';
import '../lib/models/player.dart';
import '../lib/utils/game_logger.dart';
import '../lib/logic/battle_engine.dart';

void main() {
  GameLogger.printDivider();
  GameLogger.info("Welcome to the Dungeon Crawl!");
  GameLogger.printDivider();

  // create player
  stdout.write("Enter your character's name: ");
  String? name = stdin.readLineSync();

  if (name == null || name.isEmpty) {
    name = "Hero";
  }

  // initialize objects
  Player player = Player(name: name);
  BattleEngine battleEngine = BattleEngine();
  int roomCount = 1;

  GameLogger.printDivider();
  GameLogger.info("Welcome, ${player.name}! Your adventure begins now...");
  GameLogger.wait();

  // main game loop
  while (player.isAlive) {
    GameLogger.printDivider();
    GameLogger.info("You enter room $roomCount...");
    GameLogger.wait();

    // spawn enemy scaled to player level
    String enemyType = _getRandomEnemyType(roomCount);
    Enemy enemy = Enemy.spawn(enemyType, player.level);

    battleEngine.startBattle(player, enemy);

    if (player.isAlive) {
      roomCount++;
      GameLogger.success(
        "You venture deeper into the dungeon... (current level: ${player.level})",
      );
      GameLogger.wait();
    } else {
      GameLogger.printDivider();
      GameLogger.info(
        "FINAL SCORE: You reached room $roomCount and achieved level ${player.level}.",
      );
      GameLogger.info("Game Over! Thanks for playing.");
      GameLogger.printDivider();
      break;
    }
  }
}

// helper: random enemy type generator based on room number
String _getRandomEnemyType(int roomCount) {
  final random = Random();
  int roll = random.nextInt(100);

  if (roll >= 95) {
    return 'troll';
  } else if (roll >= 85) {
    return 'orc';
  } else if (roll >= 60) {
    return 'goblin';
  } else {
    return 'slime';
  }
}
