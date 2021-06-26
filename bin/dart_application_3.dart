import 'dart:io';
import 'dart:math';

void main() {
  int score = 3;
  print('Enter the maximum number of the range:');
  int max = int.parse(stdin.readLineSync()!);
  Random rng = new Random();
  int number = rng.nextInt(max);
  print(number);
  print('Guess the number');
  int guess = int.parse(stdin.readLineSync()!);
  if (number == guess) {
    print('Congratulation, you are correct, your score $score');
  } else {
    for (int i = 0; i < 2 && number != guess; i++) {
      score--;
      if (score == 0) {
        print('You lose, the answer is $number');
        break;
      }
      String hint = hints(i, number, guess);
      print(
          'Wrong guess, guess again. Here is a hint $hint, your score is $score');
      guess = int.parse(stdin.readLineSync()!);
    }
    if (number == guess)
      print('Congratulation, you are correct, your score is $score');
  }
}

String hints(int numOfTries, number, guess) {
  List<String> hint = [
    'your guess is greater than the number',
    'your guess is smaller than the number',
    'the number is divisible by 2',
    'the number is divisible by 3',
    'the number is divisible by 5',
    'the number is prime'
  ];
  if (numOfTries == 0) {
    if (number > guess) {
      return hint[1];
    }
    return hint[0];
  }
  if (number % 2 == 0) {
    return hint[2];
  } else if (number % 3 == 0) {
    return hint[3];
  } else if (number % 5 == 0) {
    return hint[4];
  } else {
    return hint[5];
  }
}
