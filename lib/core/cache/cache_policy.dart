abstract interface class Clock {
  DateTime now();
}

final class SystemClock implements Clock {
  const SystemClock();

  @override
  DateTime now() => DateTime.now().toUtc();
}

final class CachePolicy {
  const CachePolicy({
    this.freshFor = const Duration(minutes: 15),
    this.retainFor = const Duration(days: 7),
  });

  final Duration freshFor;
  final Duration retainFor;

  bool isStale(DateTime fetchedAt, DateTime now) =>
      now.difference(fetchedAt) > freshFor;
}
