import 'dart:convert';
import 'dart:io';
import 'dart:math';

// I got a little bit of debugging help from ChatGPT on this code

void main() {
  var options = ['Rock', 'Paper', 'Scissors'];
  int userChoice;
  while (true) {
    print('Select from:');
    for (var i = 0; i < options.length; ++i) {
      print('${i + 1}. ${options[i]}');
    }
    var line = stdin.readLineSync(encoding: utf8);
    try {
      userChoice = int.parse(line!) - 1;
    } catch (e) {
      print('That does not look like an integer!');
      continue;
    }
    if (userChoice >= 0 && userChoice < options.length) {
      break;
    }
    print('Entry out of range!');
  }
  print('You selected ${options[userChoice]}');
  int computerChoice = Random(DateTime.now().millisecondsSinceEpoch).nextInt(3);
  print('Computer selected ${options[computerChoice]}');
  String result = playGame(userChoice, computerChoice);
  print('Result = $result');
}

class Rock {
  String vs (dynamic anElement) {
    return anElement.playRock();
  }

  String playRock () {
    return "draw";
  }

  String playPaper () {
    return "You Win";
  }

  String playScissors () {
    return "You Lose";
  }
}

class Paper {
  String vs (dynamic anElement) {
    return anElement.playPaper();
  }

  String playRock () {
    return "You Lose";
  }

  String playPaper () {
    return "draw";
  }

  String playScissors () {
    return "You Win";
  }
}

class Scissors {
  String vs (dynamic anElement) {
    return anElement.playScissors();
  }

  String playRock () {
    return "You Win";
  }

  String playPaper () {
    return "You Lose";
  }

  String playScissors () {
    return "draw";
  }
}

// I got this idea from chatGPT
final choices = {
  "Rock": Rock(),
  "Paper": Paper(),
  "Scissors": Scissors()
};

String playGame(int user, int computer) {
  var options = ['Rock', 'Paper', 'Scissors'];
  String result = '';

  dynamic userInstance = choices[options[user]]!;
  dynamic computerInstance = choices[options[computer]]!;

  result = userInstance.vs(computerInstance);
  return result;
}