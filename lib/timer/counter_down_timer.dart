import 'package:timer/timer/timer_controller.dart';

class CounterDownTimer extends TimerController {
  final int initialStart;
  int _timeNow = 0;

  CounterDownTimer({required this.initialStart}) {
    _timeNow = initialStart;
  }

  @override
  String format(int hour, int minute, int second) {
    var minuteValue = minute.toString();
    var secondValue
    = second.toString();

    if (minute < 10) {
      minuteValue = minuteValue.padLeft(2, '0');
    }
    if (second < 10) {
      secondValue = secondValue.padLeft(2, '0');
    }
    return '${minuteValue}minute ${secondValue}second';
  }

  @override
  int tick() {
    _timeNow -= 1000;
    return _timeNow;
  }

  void onReset() {
    _timeNow = initialStart;
    onStop();
  }

  @override
  void onStop() {
    super.onStop();
  }
}
