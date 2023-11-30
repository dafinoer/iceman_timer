import 'package:timer/timer/timer_controller.dart';

class StopWatchTimer extends TimerController {
  final int maxLimmitTimeMillisecond;
  late final Stopwatch _stopwatch;

  StopWatchTimer({required this.maxLimmitTimeMillisecond}) {
    _stopwatch = Stopwatch();
  }

  @override
  void onPlay() {
    _stopwatch.start();
    super.onPlay();
  }

  @override
  int tick() {
    return _stopwatch.elapsedMilliseconds;
  }

  void onReset() {
    _stopwatch.reset();
  }

  @override
  void onStop() {
    _stopwatch.stop();
    super.onStop();
  }
}
