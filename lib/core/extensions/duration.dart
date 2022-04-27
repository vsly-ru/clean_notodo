extension DurationIntX on int {
  /// usage example: await Future.delayed(500.ms);
  Duration get ms => Duration(milliseconds: this); // milliseconds duration
  /// usage example: await Future.delayed(5.sec);
  Duration get sec => Duration(seconds: this); // seconds
}

extension DurationFutureX on Duration {
  /// usage example: await 500.ms.delay;
  Future<void> get delay => Future.delayed(this);
}
