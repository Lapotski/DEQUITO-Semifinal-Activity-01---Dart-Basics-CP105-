# DEQUITO-Semifinal-Activity-01---Dart-Basics-CP105-
An activity for Semi-FInal Period in CP105. Created during my 2nd Year 2nd Semester in MSEUF.

# Program Overview & Purpose
The program was born out of and is inspired from my love of roguelike games and D&D (Dungeons
and Dragons. It is a minimalist, text-based RPG that simulates a dungeon crawling experience. The player
assumes the role of a hero venturing through an infinite amount of randomly generated rooms. As the
player progresses further into the dungeon it gets increasingly harder and managing resources such as XP
and Health are necessary to survive.

The primary purpose for building this system was to demonstrate the fundamental building blocks
of dart programming through a gamified lens. The system specifically addresses these with the features
within the system, such as:
- **Procedural Logic:** The system uses mathematical formulas and randomization through `dart:math` to ensure that no two runs are identical, copying the chaos of D&D dice rolls
- **State Management:** By tracking the life cycle of both the `Player` and the `Enemy` entities through attributes like `Health`, `Level` and `XP` across multiple combat encounters allowed for a continuity throughout the gameplay loop
- **Decision-Based Flow:** Implementing a user-based choice system where every input directly impacts the outcome of the game for the user. (e.g. choosing to `Attack`, `Run`, `Heal` or `Defend`).

- **Mathematical Scaling:** The system once again uses arithmetic operators to create a difficulty curve, wherein the enemy stats scale proportionally to the player’s level. This allows the system to maintain game balance.



# Instructions from the Professor

## Create a simple Dart program that demonstrates the use of:
- Variables
- Input and Output Libraries
- Operators (Arithmetic, Comparison, Relation, Logical etc.)
- Decision statements (if, else if, else, or switches)

## Your submission should include:

- A documentation that describes your submitted program as well as what your program does and its overall purpose.
- Explain the variables used, including their data types and specific roles in the program.
- What operators are used or applied and explaining how they are used in the program’s computations and evaluations.
- Discussion of decision statements by explaining the logic behind the conditions given and how these determine the program’s final output.
- Include at least test cases of the program, along with appropriate screenshots.
