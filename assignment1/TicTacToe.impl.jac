"""TicTacToe Game Implementation - Jac Programming Assignment one"""

import random;

# TicTacToe implementations
impl TicTacToe.init {
    self.board = [["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]];
    self.current_player = "X";
}

impl TicTacToe.display_board {
    print("\n   0   1   2");
    for i in range(3) {
        print(f"{i}  {self.board[i][0]} | {self.board[i][1]} | {self.board[i][2]}");
        if i < 2 {
            print("  -----------");
        }
    }
    print();
}

impl TicTacToe.make_move {
    if row < 0 or row > 2 or col < 0 or col > 2 {
        return False;
    }
    if self.board[row][col] != "_" {
        return False;
    }
    self.board[row][col] = player;
    return True;
}

impl TicTacToe.check_winner {
    # Check rows
    for row in self.board {
        if row[0] == row[1] == row[2] and row[0] != "_" {
            return row[0];
        }
    }
    
    # Check columns
    for col in range(3) {
        if self.board[0][col] == self.board[1][col] == self.board[2][col] and self.board[0][col] != "_" {
            return self.board[0][col];
        }
    }
    
    # Check diagonals
    if self.board[0][0] == self.board[1][1] == self.board[2][2] and self.board[0][0] != "_" {
        return self.board[0][0];
    }
    if self.board[0][2] == self.board[1][1] == self.board[2][0] and self.board[0][2] != "_" {
        return self.board[0][2];
    }
    
    return "";
}

impl TicTacToe.is_board_full {
    for row in self.board {
        for cell in row {
            if cell == "_" {
                return False;
            }
        }
    }
    return True;
}

impl TicTacToe.get_empty_positions {
    empty_positions = [];
    for i in range(3) {
        for j in range(3) {
            if self.board[i][j] == "_" {
                empty_positions.append((i, j));
            }
        }
    }
    return empty_positions;
}

impl TicTacToe.reset_game {
    self.board = [["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]];
    self.current_player = "X";
}

impl TicTacToe.play_simple_game {
    print("🎮 Welcome to TicTacToe! 🎮");
    print("Players will be X and O");
    print("Enter row and column (0-2) to make your move");
    
    while True {
        self.display_board();
        print(f"Player {self.current_player}'s turn");
        
        try {
            row = int(input("Enter row (0-2): "));
            col = int(input("Enter column (0-2): "));
            
            if self.make_move(row, col, self.current_player) {
                winner = self.check_winner();
                if winner {
                    self.display_board();
                    print(f"\n🎉 Congratulations! Player {winner} wins! 🎉");
                    break;
                }
                
                if self.is_board_full() {
                    self.display_board();
                    print("\n🤝 It's a tie! 🤝");
                    break;
                }
                
                # Switch player
                self.current_player = "O" if self.current_player == "X" else "X";
            } else {
                print("❌ Invalid move! Try again.");
            }
        } except ValueError {
            print("❌ Please enter valid numbers!");
        }
    }
}

# Player implementations  
impl Player.init {
    self.symbol = symbol;
    self.name = name;
}

impl Player.make_move {
    raise NotImplementedError("Subclasses must implement this method.");
}

# HumanPlayer implementations
impl HumanPlayer.init {
    self.symbol = symbol;
    self.name = name;
}

impl HumanPlayer.make_move {
    while True {
        try {
            print(f"\n{self.name}'s turn ({self.symbol})");
            row = int(input("Enter row (0-2): "));
            col = int(input("Enter column (0-2): "));
            return (row, col);
        } except ValueError {
            print("Please enter valid numbers!");
        }
    }
}

# ComputerPlayer implementations
impl ComputerPlayer.init {
    self.symbol = symbol;
    self.name = name;
    self.difficulty = difficulty;
}

impl ComputerPlayer.make_move {
    print(f"\n{self.name} is thinking...");
    if self.difficulty == "easy" {
        return self.make_easy_move(game);
    } else {
        return self.make_hard_move(game);
    }
}

impl ComputerPlayer.make_easy_move {
    empty_positions = game.get_empty_positions();
    return random.choice(empty_positions);
}

impl ComputerPlayer.make_hard_move {
    best_score = -float('inf');
    best_move = None;
    
    empty_positions = game.get_empty_positions();
    for pos in empty_positions {
        row = pos[0];
        col = pos[1];
        # Make a temporary move
        game.board[row][col] = self.symbol;
        score = self.minimax(game, 0, False);
        game.board[row][col] = "_";  # Undo move
        
        if score > best_score {
            best_score = score;
            best_move = (row, col);
        }
    }
    
    return best_move if best_move else empty_positions[0];
}

impl ComputerPlayer.minimax {
    winner = game.check_winner();
    
    # Terminal cases
    if winner == self.symbol {
        return 10 - depth;
    } elif winner and winner != self.symbol {
        return depth - 10;
    } elif game.is_board_full() {
        return 0;
    }
    
    if is_maximizing {
        max_eval = -float('inf');
        empty_positions = game.get_empty_positions();
        for pos in empty_positions {
            row = pos[0];
            col = pos[1];
            game.board[row][col] = self.symbol;
            eval_score = self.minimax(game, depth + 1, False);
            game.board[row][col] = "_";
            max_eval = max(max_eval, eval_score);
        }
        return max_eval;
    } else {
        min_eval = float('inf');
        opponent_symbol = "X" if self.symbol == "O" else "O";
        empty_positions = game.get_empty_positions();
        for pos in empty_positions {
            row = pos[0];
            col = pos[1];
            game.board[row][col] = opponent_symbol;
            eval_score = self.minimax(game, depth + 1, True);
            game.board[row][col] = "_";
            min_eval = min(min_eval, eval_score);
        }
        return min_eval;
    }
}

# GameManager implementations
impl GameManager.init {
    self.game = TicTacToe();
}

impl GameManager.show_menu {
    print("\n" + "="*40);
    print("      WELCOME TO TICTACTOE GAME");
    print("="*40);
    print("1. Human vs Human");
    print("2. Human vs Computer (Easy)");
    print("3. Human vs Computer (Hard)");
    print("4. Computer vs Computer");
    print("5. Simple TicTacToe Game");
    print("6. Exit");
    print("="*40);
}

impl GameManager.start_game {
    self.game.reset_game();
    
    if mode == 1 {
        # Human vs Human
        player1 = HumanPlayer("X", "Player 1");
        player2 = HumanPlayer("O", "Player 2");
        self.play_with_players(player1, player2);
        
    } elif mode == 2 {
        # Human vs Computer (Easy)
        player1 = HumanPlayer("X", "Human");
        player2 = ComputerPlayer("O", "Computer", "easy");
        self.play_with_players(player1, player2);
        
    } elif mode == 3 {
        # Human vs Computer (Hard)
        player1 = HumanPlayer("X", "Human");
        player2 = ComputerPlayer("O", "Computer", "hard");
        self.play_with_players(player1, player2);
        
    } elif mode == 4 {
        # Computer vs Computer
        player1 = ComputerPlayer("X", "Computer 1", "easy");
        player2 = ComputerPlayer("O", "Computer 2", "hard");
        self.play_with_players(player1, player2);
        
    } elif mode == 5 {
        # Simple game
        self.game.play_simple_game();
    }
}

impl GameManager.play_with_players {
    current_player = player1;
    
    print(f"\nStarting game: {player1.name} (X) vs {player2.name} (O)");
    
    while True {
        self.game.display_board();
        
        # Get move from current player
        move_result = current_player.make_move(self.game);
        row = move_result[0];
        col = move_result[1];
        
        # Make the move
        if self.game.make_move(row, col, current_player.symbol) {
            # Check for winner
            winner = self.game.check_winner();
            if winner {
                self.game.display_board();
                print(f"\n🎉 {current_player.name} ({winner}) wins! 🎉");
                break;
            }
            
            # Check for tie
            if self.game.is_board_full() {
                self.game.display_board();
                print("\n🤝 It's a tie! 🤝");
                break;
            }
            
            # Switch players
            current_player = player2 if current_player == player1 else player1;
        } else {
            print("Invalid move! Try again.");
        }
    }
}

impl GameManager.run {
    while True {
        self.show_menu();
        try {
            choice = int(input("\nEnter your choice (1-6): "));
            
            if choice == 6 {
                print("Thanks for playing! Goodbye! 👋");
                break;
            } elif choice in [1, 2, 3, 4, 5] {
                self.start_game(choice);
                
                # Ask if player wants to play again
                play_again = input("\nWould you like to play again? (y/n): ").lower();
                if play_again != 'y' and play_again != 'yes' {
                    print("Thanks for playing! Goodbye! 👋");
                    break;
                }
            } else {
                print("Invalid choice! Please enter a number between 1-6.");
            }
        } except ValueError {
            print("Please enter a valid number!");
        }
    }
}