import 'dart:io';
import 'ttt_functions.dart' show print_board, play, can_play, check_win;

void main () {
  var board = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]];
  
  var next_player = {"X": "O", "O": "X"};
  String cur_player = "X";

  while (true) {
    print_board(board);

    stdout.write('Enter player ' + cur_player + ' move as row,col: ');
    var move = stdin.readLineSync() ?? "";
    // print("move");
    // print(int.parse(move[0]));

    // print(move[0]);
    // print(move[2]);
    // print(move.length);
    if (move.length == 3 && 
    0 <= int.parse(move[0]) && int.parse(move[0]) <= 2 && 
    0 <= int.parse(move[2]) && int.parse(move[2]) <= 2) {
      // print("Entered first if");

      // print(cur_player);
      if(play(cur_player, int.parse(move[0]), int.parse(move[2]), board)) {
        // print("Entered second if");
        if(check_win(board)) {
          print("Congratulations! Player " + cur_player + " wins.");
          break;
        }
        else if(!can_play(board)) {
          print_board(board);
          print("No more valid moves. It's a draw.");
          break;
        }
        else {
          cur_player = next_player[cur_player]!;
        }
      }
      else {
        print("Invalid move. That position is already taken.");
      }
    }
    else {
      print("Invalid move. Rows and columns must be between 0 and 2 and separated by a comma");
    }
  }
  print_board(board);
  print("Thanks for playing!");
}

// I used ChatGPT for debugging some of my errors.