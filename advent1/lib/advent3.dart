import 'advent2.dart';
import 'package:darq/darq.dart';

import 'advent3_data.dart';

class Advent3 {
  void run() {
    print(5.toRadixString(2));
    print(Submarine3().gammaRate(debugData));
  }
}

class Submarine3 extends Submarine {
  int powerConsumption = 0;

  String gammaRate(List<String> bits) {
    String gammaRate = '';

    for (int i = 0; i < 5; i++) {
      final oneCount = bits
          .select((bit, index) => bit[i])
          .where((bit) => bit == '1')
          .count();

      final zeroCount = bits
          .select((bit, index) => bit[i])
          .where((bit) => bit == '0')
          .count();

      gammaRate += oneCount > zeroCount ? '1' : '0';
    }

    return gammaRate;
  }
}
