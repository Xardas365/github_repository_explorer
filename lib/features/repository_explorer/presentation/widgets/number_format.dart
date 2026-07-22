String compactCount(int value) {
  if (value >= 1000000) {
    return '${_trim(value / 1000000)}M';
  }
  if (value >= 1000) {
    return '${_trim(value / 1000)}K';
  }
  return value.toString();
}

String _trim(double value) {
  final formatted = value.toStringAsFixed(value >= 10 ? 0 : 1);
  return formatted.endsWith('.0')
      ? formatted.substring(0, formatted.length - 2)
      : formatted;
}
