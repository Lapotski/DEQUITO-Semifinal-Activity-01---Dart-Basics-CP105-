import 'dart:math';

class Enemy {
  final String name;
  int health;
  int maxHealth;
  int attackPower;
  int xpValue;

  Enemy({
    required this.name,
    required this.health,
    required this.attackPower,
    required this.xpValue,
  }) : maxHealth = health;

  // damage method to reduce health when attacked
  void takeDamage(int damage) {
    health -= damage;

    // this check makes sure that health doesn't go below 0
    if (health < 0) {
      health = 0;
    }

    print("$name takes $damage damage! Remaining health: $health");
  }

  // method to check if enemy is alive
  bool get isAlive => health > 0;

  // method to attack the player
  int calculateAttack() {
    final random = Random();

    // add some randomness to the attack damage
    int variance = random.nextInt(5);
    int damage = attackPower + (attackPower * variance ~/ 100);

    return damage;
  }

  // factory method to spawn different types of enemies based on player level
  static Enemy spawn(String type, int playerLevel) {
    double healthMod = 1.5;
    int attackMod = 3;
    int xpMod = 10;

    switch (type.toLowerCase()) {
      case 'slime':
        return Enemy(
          name: 'Green Slime',
          health: (40 + (playerLevel * healthMod)).toInt(),
          attackPower: (10 + (playerLevel * attackMod)).toInt(),
          xpValue: (20 + (playerLevel * xpMod)).toInt(),
        );

      case 'goblin':
        return Enemy(
          name: 'Goblin Scout',
          health: (60 + (playerLevel * healthMod)).toInt(),
          attackPower: (15 + (playerLevel * attackMod)).toInt(),
          xpValue: (30 + (playerLevel * xpMod)).toInt(),
        );

      case 'orc':
        return Enemy(
          name: 'Orc Warrior',
          health: (80 + (playerLevel * healthMod)).toInt(),
          attackPower: (20 + (playerLevel * attackMod)).toInt(),
          xpValue: (50 + (playerLevel * xpMod)).toInt(),
        );

      case 'troll':
        return Enemy(
          name: 'Cave Troll',
          health: (120 + (playerLevel * healthMod)).toInt(),
          attackPower: (25 + (playerLevel * attackMod)).toInt(),
          xpValue: (80 + (playerLevel * xpMod)).toInt(),
        );

      default:
        return Enemy(
          name: 'Unknown Creature',
          health: (50 + (playerLevel * healthMod)).toInt(),
          attackPower: (10 + (playerLevel * attackMod)).toInt(),
          xpValue: (20 + (playerLevel * xpMod)).toInt(),
        );
    }
  }
}
