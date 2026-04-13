void print_board(board) {
  print(" " + board[0][0] + " | " + board[0][1] + " | " + board[0][2] + "\n" +
        "---+---+---" + "\n" +
        " " + board[1][0] + " | " + board[1][1] + " | " + board[1][2] + "\n" +
        "---+---+---" + "\n" +
        " " + board[2][0] + " | " + board[2][1] + " | " + board[2][2] + "\n"
  );
}


bool play(symbol, row, col, board) {
  if (board[row][col] == " ") {
    board[row][col] = symbol;
    return true;
  }
  return false;
}


bool can_play(board) {
  if(board[0][0] != " " &&
     board[0][1] != " " &&
     board[0][2] != " " &&
     board[1][0] != " " &&
     board[1][1] != " " &&
     board[1][2] != " " &&
     board[2][0] != " " &&
     board[2][1] != " " &&
     board[2][2] != " "
  ) {
    return false;
  }
  return true;
}


bool check_win(board) {
  // Row Checks
  if (board[0][0] != " " && board[0][0] == board[0][1] && board[0][0] == board[0][2]) {
    return true;
  }
  if (board[1][0] != " " && board[1][0] == board[1][1] && board[1][0] == board[1][2]) {
    return true;
  }
  if (board[2][0] != " " && board[2][0] == board[2][1] && board[2][0] == board[2][2]) {
    return true;
  }
  // Column Checks
  if (board[0][0] != " " && board[0][0] == board[1][0] && board[0][0] == board[2][0]) {
    return true;
  }
  if (board[0][1] != " " && board[0][1] == board[1][1] && board[0][1] == board[2][1]) {
    return true;
  }
  if (board[0][2] != " " && board[0][2] == board[1][2] && board[0][2] == board[2][2]) {
    return true;
  }
  // Diagonal Checks
  if (board[0][0] != " " && board[0][0] == board[1][1] && board[0][0] == board[2][2]) {
    return true;
  }
  if (board[0][2] != " " && board[0][2] == board[1][1] && board[0][2] == board[2][0]) {
    return true;
  }

  return false;
}