import 'advent1_data.dart';
import 'advent2.dart';
import 'advent3.dart';

int _countDeeperMeasurements(List<int> measurements) {
  var count = 0;

  for (int i = 0; i < measurements.length; i++) {
    if (i > 0) {
      if (measurements[i] > measurements[i - 1]) {
        count += 1;
      }
    }
  }

  return count;
}

int _countSlidingMeasurements(List<int> measurements) {
  var count = 0;

  for (int i = 1; i < measurements.length - 2; i++) {
    final slide = measurements[i] + measurements[i + 1] + measurements[i + 2];
    final slideMinusOne =
        measurements[i - 1] + measurements[i] + measurements[i + 1];

    if (slide > slideMinusOne) {
      count += 1;
    }
  }

  return count;
}
