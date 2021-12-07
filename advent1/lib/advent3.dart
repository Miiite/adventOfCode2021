import 'package:advent1/advent3_data.dart';
import 'package:darq/darq.dart';

import 'advent2.dart';

class Advent3 {
  void run() {
    final sub = Submarine3();
    sub.assignGammaRate(data);
    sub.assignEpsilonRate(data);

    print(sub.powerConsumption);
  }
}

class Submarine3 extends Submarine {
  int gammaRate = 0;
  int epsilonRate = 0;
  int get powerConsumption => gammaRate * epsilonRate;

  void assignGammaRate(List<String> bits) {
    gammaRate = _calculateGammaRate(bits);
  }

  void assignEpsilonRate(List<String> bits) {
    epsilonRate = _calculateEpsilonRate(bits);
  }

  int _calculateGammaRate(List<String> bits) {
    String gammaRate = '';

    for (int i = 0; i < bits[0].length; i++) {
      final oneCount = bits
          .select((bit, index) => bit[i])
          .where((bit) => bit == '1')
          .count();

      final zeroCount = bits
          .select((bit, index) => bit[i])
          .where((bit) => bit == '0')
          .count();

      gammaRate += oneCount >= zeroCount ? '1' : '0';
    }

    print('Gamma Rate: $gammaRate');
    return int.parse(gammaRate, radix: 2);
  }

  int _calculateEpsilonRate(List<String> bits) {
    String epsilonRate = '';

    for (int i = 0; i < bits[0].length; i++) {
      final oneCount = bits
          .select((bit, index) => bit[i])
          .where((bit) => bit == '1')
          .count();

      final zeroCount = bits
          .select((bit, index) => bit[i])
          .where((bit) => bit == '0')
          .count();

      epsilonRate += oneCount > zeroCount ? '0' : '1';
    }

    print('Epsilon Rate: $epsilonRate');
    return int.parse(epsilonRate, radix: 2);
  }
}
