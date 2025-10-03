"""TicTacToe Game Interface - Jac Programming Assignment"""

import random;


obj TicTacToe {
    has board: list[list[str]], current_player: str;
    
    def init;
    def display_board;
    def make_move(row: int, col: int, player: str) -> bool;
    def check_winner -> str;
    def is_board_full -> bool;
    def get_empty_positions -> list[tuple[int, int]];
    def reset_game;
    def play_simple_game;
}


obj Player {
    has symbol: str, name: str;
    
    def init(symbol: str, name: str);
    def make_move(game: TicTacToe) -> tuple[int, int];
}


obj HumanPlayer(Player) {
    def init(symbol: str, name: str);
    override def make_move(game: TicTacToe) -> tuple[int, int];
}


obj ComputerPlayer(Player) {
    has difficulty: str;
    
    def init(symbol: str, name: str, difficulty: str);
    override def make_move(game: TicTacToe) -> tuple[int, int];
    def make_easy_move(game: TicTacToe) -> tuple[int, int];
    def make_hard_move(game: TicTacToe) -> tuple[int, int];
    def minimax(game: TicTacToe, depth: int, is_maximizing: bool) -> int;
}


obj GameManager {
    has game: TicTacToe;
    
    def init;
    def show_menu;
    def start_game(mode: int);
    def play_with_players(player1: Player, player2: Player);
    def run;
}

# Main entry point
with entry {
    game_manager = GameManager();
    game_manager.run();
}
