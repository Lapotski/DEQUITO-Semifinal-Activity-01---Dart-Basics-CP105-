import 'dart:io';
import 'dart:math';
import '../models/enemy.dart';
import '../models/player.dart';
import '../utils/game_logger.dart';

class BattleEngine {
  final Random _random = Random();

  // starts the turn-based battle between the player and an enemy
  void startBattle(Player player, Enemy enemy) {
    GameLogger.printDivider();
    GameLogger.combat("A wild ${enemy.name} appears!");

    while (player.isAlive && enemy.isAlive) {
      GameLogger.printDivider();
      _displayStatus(player, enemy);

      print('\nWhat will you do?');
      print('1. Attack');
      print('2. Heal');
      print('3. Defend');
      print('4. Run');
      stdout.write('> ');

      String? choice = stdin.readLineSync();

      // MAIN LOOP - handles player's choice and enemy's response
      switch (choice) {
        case '1':
          _handlePlayerAttack(player, enemy);
          break;

        case '2':
          _handlePlayerHeal(player);
          break;

        case '3':
          _handlePlayerDefend(player, enemy);
          break;

        case '4':
          if (_handlePlayerRun()) {
            return;
          } else {
            GameLogger.combat("You failed to escape! The battle continues.");
          }
          break;

        default:
          GameLogger.info("You hesitated and lost your turn! (invalid input)");
          break;
      }

      // ENEMY TURN
      if (enemy.isAlive) {
        _handleEnemyAttack(player, enemy);
      }

      GameLogger.wait();
    }

    _resolveBattle(player, enemy);
  }

  // helper: show curret status
  void _displayStatus(Player player, Enemy enemy) {
    print(
      "${player.name} | LVL: ${player.level} | HP: ${player.health}/${player.maxHealth} | XP: ${player.xp}/${player.maxXP}",
    );
    print("${enemy.name} | HP: ${enemy.health}/${enemy.maxHealth}");
  }

  // helper: player attack logic
  void _handlePlayerAttack(Player player, Enemy enemy) {
    int damage = player.attackPower + _random.nextInt(5);

    if (damage < 1) {
      damage = 1;
    }

    GameLogger.printDivider();
    GameLogger.combat("You attack the ${enemy.name} for $damage damage!");
    enemy.takeDamage(damage);
  }

  // helper: player heal logic
  void _handlePlayerHeal(Player player) {
    int healAmount = (player.maxHealth * 0.3).toInt() + _random.nextInt(5);
    GameLogger.combat(
      "You use a healing potion and restore $healAmount health!",
    );
    player.heal(healAmount);
  }

  // helper: player defend logic
  void _handlePlayerDefend(Player player, Enemy enemy) {
    GameLogger.combat(
      "You brace yourself for the next attack, reducing incoming damage!",
    );

    // temporarily reduce enemy's attack power for this turn
    int originalAttack = enemy.attackPower;
    enemy.attackPower = (enemy.attackPower * 0.5).toInt();

    // enemy attacks with reduced power
    _handleEnemyAttack(player, enemy);

    // restore enemy's original attack power
    enemy.attackPower = originalAttack;
  }

  // helper: player escape logic
  bool _handlePlayerRun() {
    int chance = _random.nextInt(100);
    return chance < 30;
  }

  // helper: enemy turn logic
  void _handleEnemyAttack(Player player, Enemy enemy) {
    GameLogger.printDivider();
    GameLogger.combat("The ${enemy.name} attacks you!");

    int damage = enemy.calculateAttack();
    player.takeDamage(damage);
  }

  // helper: resolve battle outcome
  void _resolveBattle(Player player, Enemy enemy) {
    GameLogger.printDivider();

    if (player.isAlive) {
      GameLogger.success("VICTORY! You defeated the ${enemy.name}!");
      player.gainXP(enemy.xpValue);
    } else {
      GameLogger.info(
        "GAME OVER... ${player.name} has been defeated by the ${enemy.name}...",
      );
    }
  }
}
