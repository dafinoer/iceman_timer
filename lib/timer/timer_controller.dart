import 'package:rxdart/rxdart.dart';
import 'dart:async';

class TimerController {
  late PublishSubject<int> _publishSubject;
  Timer? _timer;

  TimerController() {
    _publishSubject = PublishSubject<int>();
  }

  Stream<String> watchTime() =>
      _publishSubject.stream.map((event) => _timeValueResult(event));

  String _timeValueResult(int millisecond) {
    final inHour = millisecond / 3600000;
    final inMinute = (millisecond / 60000) % 60;
    final inSecond = (millisecond / 1000) % 60;
    return format(inHour.toInt(), inMinute.toInt(), inSecond.toInt());
  }

  String format(int hour, int minute, int second) {
    return '${hour}hour:${minute}minute:${second}second';
  }

  void onPlay() {
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      final valueTimeNow = tick();
      if (valueTimeNow <= 0) {
        _publishSubject.add(0);
        onStop();
      } else {
        _publishSubject.add(valueTimeNow);
      }
    });
  }

  int tick() {
    return 0;
  }

  void onStop() {
    _timer?.cancel();
  }

  void onDispose() {
    _publishSubject.close();
  }
}
