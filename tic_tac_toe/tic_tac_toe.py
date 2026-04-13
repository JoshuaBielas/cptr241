"""
Expert Problem:  Create a tic-tac-toe game

File Name: tic_tac_toe.py
Name:      ?
Course:    CPTR 141
"""


from tic_tac_toe.ttt_functions import can_play, check_win, play, print_board

# start with empty board
board = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]

# initialize variables
next_player = {"X": "O", "O": "X"}
cur_player = "X"

while True:

    print_board(board)

    move = input("Enter player {} move as row,col: ".format(cur_player)).split(",")

    if len(move) == 2 and 0 <= int(move[0]) <= 2 and 0 <= int(move[1]) <= 2:

        if play(cur_player, int(move[0]), int(move[1]), board):

            if check_win(board) == cur_player:
                print_board(board)
                print("Congratulations! Player {} wins.".format(cur_player))
                break
            elif not can_play(board):
                print_board(board)
                print("No more valid moves. It's a draw.")
                break
            else:
                cur_player = next_player[cur_player]
        else:
            print("Invalid move. That position is already taken.")

    else:
        print(
            "Invalid move. Rows and columns must be between 0 and 2 and separated by a comma."
        )


print("\nThanks for playing!")
