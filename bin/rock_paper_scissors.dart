import 'dart:io';
import 'dart:math';

void main() {
  Random rng = Random();
  print('Enter the number of rounds that you want to play');
  int rounds = int.parse(stdin.readLineSync()!);
  int i = 0;
  game(i, rounds, rng);
}

void game(int i, rounds, Random rng) {
  int yourScore = 0;
  int cpuScore = 0;
  while (i < rounds) {
    int r = rng.nextInt(2);
    List<String> movesBank = ['R', 'P', 'S'];
    String cpu = movesBank[r];
    print(
        'Please enter your next move R, P, S: (R=Rock, P=Paper, and S=Scissors)');
    String move = stdin.readLineSync()!;
    while (valid(move)) {
      print('The move you entered is invalid, please enter a correct move');
      move = stdin.readLineSync()!;
    }
    if (cpu == move) {
      print('DRAW! try again');
    } else {
      if (cpu == 'R') {
        if (move == 'P') {
          yourScore++;
          i++;
          print(
              'You have won round #$i, the current score is $yourScore-$cpuScore');
        } else if (move == 'S') {
          cpuScore++;
          i++;
          print(
              'You have lost round #$i, the current score is $yourScore-$cpuScore');
        }
      }
      if (cpu == 'P') {
        if (move == 'S') {
          yourScore++;
          i++;
          print(
              'You have won round #$i, the current score is $yourScore-$cpuScore');
        } else if (move == 'R') {
          cpuScore++;
          i++;
          print(
              'You have lost round #$i, the current score is $yourScore-$cpuScore');
        }
      }
      if (cpu == 'S') {
        if (move == 'R') {
          yourScore++;
          i++;
          print(
              'You have won round #$i, the current score is $yourScore-$cpuScore');
        } else if (move == 'P') {
          cpuScore++;
          i++;
          print(
              'You have lost round #$i, the current score is $yourScore-$cpuScore');
        }
      }
    }
  }
  print("Final score is:\nYour score: $yourScore\nCpu's score: $cpuScore");
}

bool valid(String move) {
  if ((move == 'R') || (move == 'P') || (move == 'S')) {
    return false;
  } else
    return true;
}
