import 'package:advent1/advent3_data.dart';
import 'package:darq/darq.dart';

import 'advent2.dart';

class Advent3 {
  void run() {
    final sub = Submarine3();
    sub.assignOxygenRating(data);
    sub.assignCO2ScrubberRating(data);

    print(sub.lifeSupportRating);
  }
}

class Submarine3 extends Submarine {
  int gammaRate = 0;
  int epsilonRate = 0;
  int oxygenGeneratorRating = 0;
  int co2ScrubberRating = 0;

  int get lifeSupportRating => oxygenGeneratorRating * co2ScrubberRating;
  int get powerConsumption => gammaRate * epsilonRate;

  void assignGammaRate(List<String> bits) {
    gammaRate = _calculateGammaRate(bits);
  }

  void assignEpsilonRate(List<String> bits) {
    epsilonRate = _calculateEpsilonRate(bits);
  }

  void assignOxygenRating(List<String> bits) {
    oxygenGeneratorRating = calculateOxygenRating(bits, 0);
  }

  void assignCO2ScrubberRating(List<String> bits) {
    co2ScrubberRating = calculateCO2ScrubberRating(bits, 0);
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

  int calculateOxygenRating(List<String> bits, int bitIndex) {
    final length = bits[0].length;

    final mostCommon = _findMostCommonValue(bits, bitIndex);
    final newBitSet = bits.where((b) => b[bitIndex] == mostCommon).toList();

    if (newBitSet.length != 1 && bitIndex < length - 1) {
      return calculateOxygenRating(newBitSet, bitIndex + 1);
    } else {
      final oRating = int.parse(newBitSet.first, radix: 2);
      print('Found oxygen rating: ${newBitSet.first}');
      print('Found oxygen rating: $oRating');
      return oRating;
    }
  }

  int calculateCO2ScrubberRating(List<String> bits, int bitIndex) {
    final length = bits[0].length;

    final mostCommon = _findMostCommonValue(bits, bitIndex);
    final newBitSet = bits.where((b) => b[bitIndex] != mostCommon).toList();

    if (newBitSet.length != 1 && bitIndex < length - 1) {
      return calculateCO2ScrubberRating(newBitSet, bitIndex + 1);
    } else {
      final oRating = int.parse(newBitSet.first, radix: 2);
      print('Found CO2 rating: ${newBitSet.first}');
      print('Found CO2 rating: $oRating');
      return oRating;
    }
  }

  String _findMostCommonValue(List<String> bits, int index) {
    final oneCount = bits.where((b) => b[index] == '1').count();
    final zeroCount = bits.where((b) => b[index] == '0').count();

    return oneCount >= zeroCount ? '1' : '0';
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
