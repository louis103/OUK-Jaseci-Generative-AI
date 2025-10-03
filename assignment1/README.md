# TicTacToe Game - Jac Programming Assignment

This project demonstrates a complete TicTacToe game implementation using the Jac programming language, showcasing object-oriented programming concepts, game logic, and user interaction.

## 📁 Project Structure

- **`TicTacToe.jac`** - Interface file containing object definitions and method signatures
- **`TicTacToe.impl.jac`** - Implementation file containing the actual game logic
- **`README.md`** - This documentation file

## 🎮 Game Features

### Core Game Components

1. **TicTacToe Game Engine**
   - 3x3 game board representation
   - Move validation
   - Win condition checking (rows, columns, diagonals)
   - Tie detection

2. **Player System**
   - Human Player (manual input)
   - Computer Player with two difficulty levels:
     - Easy: Random moves
     - Hard: Minimax algorithm with AI strategy

3. **Game Manager**
   - Menu system
   - Multiple game modes:
     - Human vs Human
     - Human vs Computer (Easy)
     - Human vs Computer (Hard)
     - Computer vs Computer

## 🚀 How to Run

### Option 1: Full Featured Game
```bash
jac run TicTacToe.jac
```

## 🎯 Game Rules

1. The game is played on a 3x3 grid
2. Players take turns placing X and O marks
3. First player is always X
4. Win by getting 3 marks in a row (horizontal, vertical, or diagonal)
5. Game ends in a tie if the board is full with no winner

## 🎮 How to Play

### Human vs Human Mode
1. Select option 1 from the main menu
2. Players alternate turns
3. Enter row (0-2) and column (0-2) coordinates
4. First player to get 3 in a row wins!

### Human vs Computer Mode
1. Select option 2 (Easy) or 3 (Hard) from the main menu
2. Human player (X) goes first
3. Computer will automatically make its move
4. Continue until someone wins or it's a tie

### Computer vs Computer Mode
1. Select option 4 from the main menu
2. Watch two AI players compete
3. Easy vs Hard difficulty demonstration

## 🧠 AI Algorithm

The Hard difficulty computer player uses the **Minimax algorithm**:
- Evaluates all possible future game states
- Chooses the move that maximizes its chance of winning
- Considers opponent's optimal responses
- Provides challenging gameplay for human players

## 💻 Code Architecture

### Object-Oriented Design
- **Separation of Interface and Implementation**: Clean separation using `.jac` and `.impl.jac` files
- **Inheritance**: Player base class with HumanPlayer and ComputerPlayer subclasses
- **Encapsulation**: Game state and logic contained within appropriate objects
- **Polymorphism**: Different player types handled uniformly through base class interface

### Key Design Patterns
- **Strategy Pattern**: Different AI difficulty levels
- **Template Method**: Common game flow with specialized player behaviors
- **Factory Pattern**: Player creation based on game mode

## 🔧 Technical Implementation

### Jac Language Features Used
- **Object definitions** with `obj` keyword
- **Implementation blocks** with `impl` keyword
- **Method overriding** with `override` keyword
- **Type annotations** for better code clarity
- **Exception handling** with `try/except`
- **List comprehensions** and data structures
- **String formatting** and user input/output

### Game State Management
- Board represented as 2D list of strings
- Current player tracking
- Move validation and board updates
- Win/tie condition evaluation

## 🎨 User Interface

- Clean, ASCII-based board display
- Intuitive coordinate system (0-2 for rows and columns)
- Clear prompts and error messages
- Emoji-enhanced feedback for better user experience
- Menu-driven navigation

## 🎓 Learning Objectives

This assignment demonstrates:

1. **Jac Language Mastery**
   - Proper use of object-oriented constructs
   - Interface/implementation separation
   - Type system utilization

2. **Software Design Principles**
   - Clean code organization
   - Modular design
   - Error handling
   - User experience considerations

3. **Algorithm Implementation**
   - Game logic programming
   - AI algorithm (Minimax)
   - Recursive problem solving

4. **Problem Solving Skills**
   - Breaking complex problems into smaller components
   - Designing extensible systems
   - Testing and debugging

## 🚧 Future Enhancements

Potential improvements could include:
- Board size customization (4x4, 5x5)
- Network multiplayer support
- GUI interface using Jac's UI capabilities
- Tournament mode with statistics
- Difficulty level fine-tuning
- Save/load game functionality

## 📝 Notes

- The game follows standard TicTacToe rules
- Input validation prevents invalid moves
- The AI provides a good challenge on Hard mode
- Code is well-commented for educational purposes
- Demonstrates best practices in Jac programming

---

**Created as part of Jac Programming Language Assignment**  
*Demonstrating object-oriented game development in Jac*