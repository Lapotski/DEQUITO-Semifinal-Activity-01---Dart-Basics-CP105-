class Player {
  final String name;
  int health = 100;
  int maxHealth = 100;
  int attackPower = 20;
  int level = 1;
  int xp = 0;
  int maxXP = 100;

  Player({required this.name});

  // heal method to restore health
  void heal(int amount) {
    health += amount;
    if (health > maxHealth) {
      health = maxHealth;
    }
    print("$name heals for $amount! Current health: $health/$maxHealth");
  }

  // damage method to reduce health when attacked
  void takeDamage(int damage) {
    health -= damage;

    // this check makes sure that health doesn't go below 0
    if (health < 0) {
      health = 0;
    }
    print("$name takes $damage damage! Remaining health: $health");
  }

  // level up method to increase player's level and stats
  void gainXP(int amount) {
    xp += amount;

    // stat increases and level up logic
    if (xp >= maxXP) {
      level++;
      xp = 0;
      maxXP += 50;
      maxHealth += 20;
      health = maxHealth;
      attackPower += 5;
      print(
        "$name leveled up to level $level! Max health: $maxHealth, Attack power: $attackPower",
      );
    }
  }

  // getter to check if player is alive
  bool get isAlive => health > 0;
}
