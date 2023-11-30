import 'package:flutter_test/flutter_test.dart';

import 'package:timer/timer.dart';
import 'package:timer/timer/stopwatch_timer.dart';

void main() {
  group('Timer Test', () {
    late CounterDownTimer counterDownTimer;
    late StopWatchTimer stopWatchTimer;

    setUp(() {
      counterDownTimer = CounterDownTimer(initialStart: 60000);
      stopWatchTimer = StopWatchTimer(maxLimmitTimeMillisecond: 5000);
    });

    tearDown(() {
      counterDownTimer.onStop();
      counterDownTimer.onDispose();
      stopWatchTimer.onStop();
      stopWatchTimer.onDispose();
    });

    test('Counter Count Down', () async {
      counterDownTimer.onPlay();
      await Future.delayed(const Duration(milliseconds: 1000));
      await counterDownTimer
          .watchTime()
          .first
          .then((value) => expectLater(value, '00minute 58second'));
    });

    test('Counter Down Reset', () async {
      counterDownTimer.onPlay();
      await Future.delayed(const Duration(milliseconds: 5000));
      counterDownTimer.onReset();
      counterDownTimer.onPlay();
      await Future.delayed(const Duration(milliseconds: 1000));
      await counterDownTimer
          .watchTime()
          .first
          .then((value) => expectLater(value, '00minute 58second'));
    });

    test('StopwatchTest', () async {
      stopWatchTimer.onPlay();
      await Future.delayed(const Duration(milliseconds: 1000));
      stopWatchTimer.watchTime().first.then(expectAsync1(
            (value) => expect(value, '0hour:0minute:2second'),
          ));
    });
  });
}
