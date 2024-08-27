import 'package:flutter/foundation.dart';
import 'package:tailwind_dictionary/data/tailwind_record.dart';

class TailwindCategory {
  final String name;
  final List<TailwindRecord> classes;

  TailwindCategory({
    required this.name,
    required this.classes,
  });

  @override
  String toString() => 'TailwindCategory(name: $name, classes: $classes)';

  @override
  bool operator ==(covariant TailwindCategory other) {
    if (identical(this, other)) return true;

    return other.name == name && listEquals(other.classes, classes);
  }

  @override
  int get hashCode => name.hashCode ^ classes.hashCode;
}
