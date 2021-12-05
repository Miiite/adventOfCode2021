import 'advent2_data.dart';

class Advent2 {
  void run() {
    final sub = Submarine();

    for (var s in data) {
      sub.processInput(s);
    }

    print(sub.positionX * sub.depth);
  }
}

class Submarine {
  int depth = 0;
  int positionX = 0;
  int aim = 0;

  void processInput(String input) {
    final command = InputCommand.fromInput(input);

    if (command.command == 'forward') {
      forward(command.value);
    } else if (command.command == 'down') {
      down(command.value);
    } else if (command.command == 'up') {
      up(command.value);
    }
  }

  void forward(int x) {
    positionX += x;
    depth += aim * x;
  }

  void up(int x) {
    aim -= x;
  }

  void down(int x) {
    aim += x;
  }
}

class InputCommand {
  InputCommand(this.value, this.command);
  factory InputCommand.fromInput(String input) {
    final command = input.split(' ');

    return InputCommand(int.parse(command[1]), command[0]);
  }

  final int value;
  final String command;
}
