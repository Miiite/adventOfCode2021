import 'package:advent1/advent3.dart';
import 'package:advent1/advent4_data.dart';
import 'package:darq/darq.dart';

class Advent4 {
  void run() {
    Submarine4().playBingo(debugDrawn, debugBoards);
  }
}

class BingoGame {
  final List<int> input;
  final List<Board> boards;

  BingoGame(this.input, this.boards);

  factory BingoGame.fromStrings(List<int> input, List<String> boardStrings) =>
      BingoGame(
        input,
        boardStrings
            .select((boardString, index) => Board.fromString(boardString, 5))
            .toList(),
      );
}

typedef BoardChecker = List<List<int>>;

class Board {
  final BoardChecker rows;
  final int boardRowSize;

  static BoardChecker makeMatrixFromString(String board, int rowSize) {
    final allValues = board
        .split(',')
        .where((element) => element.isNotEmpty)
        .select((s, i) => int.parse(s))
        .toList();
    var i = 0;

    final rows = <List<int>>[];
    while (i < allValues.length - 1) {
      rows.add(allValues.sublist(i, i + rowSize));
      i += rowSize;
    }

    return rows;
  }

  Board(this.rows, this.boardRowSize);
  factory Board.fromString(String board, int rowSize) =>
      Board(makeMatrixFromString(board, rowSize), rowSize);
}

class Submarine4 extends Submarine3 {
  late BingoGame bingo;

  void playBingo(List<int> input, List<String> boards) {
    bingo = BingoGame.fromStrings(input, boards);

    print(bingo.boards[1].rows[4][4]);
    print(bingo.boards[2].rows[2][2]);
    print(bingo.boards[0].rows[1][1]);
  }
}
