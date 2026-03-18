import 'dart:io';

class GameLogger {
  // prints a divider between sections of the game
  static void printDivider() {
    print("\n==================================================\n");
  }

  // method for general game messages
  static void info(String message) {
    print("[INFO] $message");
  }

  // method for combat messages
  static void combat(String message) {
    print("[COMBAT] $message");
  }

  // method for positive events
  static void success(String message) {
    print("[SUCCESS] $message");
  }

  // press to continue method
  static void wait() {
    print("\nPress Enter to continue...");
    stdin.readLineSync();
  }
}
