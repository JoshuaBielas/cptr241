import 'main.dart';

// rock, paper, scissors
main() {
  assert(playGame(0, 0) == 'draw');
  assert(playGame(0, 1) == 'loss');
  assert(playGame(0, 2) == 'win');

  assert(playGame(1, 0) == 'win');
  assert(playGame(1, 1) == 'draw');
  assert(playGame(1, 2) == 'loss');

  assert(playGame(2, 0) == 'loss');
  assert(playGame(2, 1) == 'win');
  assert(playGame(2, 2) == 'draw');

  print('All tests passed!');
}
