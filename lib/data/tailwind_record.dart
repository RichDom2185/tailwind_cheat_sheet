class TailwindRecord {
  final String className;
  final String cssMeaning;

  TailwindRecord({
    required this.className,
    required this.cssMeaning,
  });

  @override
  String toString() =>
      'TailwindRecord(className: $className, cssMeaning: $cssMeaning)';

  @override
  bool operator ==(covariant TailwindRecord other) {
    if (identical(this, other)) return true;

    return other.className == className && other.cssMeaning == cssMeaning;
  }

  @override
  int get hashCode => className.hashCode ^ cssMeaning.hashCode;
}
