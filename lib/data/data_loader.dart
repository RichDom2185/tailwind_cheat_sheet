import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tailwind_dictionary/data/tailwind_category.dart';
import 'package:tailwind_dictionary/data/tailwind_record.dart';

class DataLoader {
  static const String _keymapPath = 'assets/keymap.json';
  static const String _classesPath = 'assets/classes.json';
  static late List<TailwindCategory> _categories;
  static late List<String> _categoryNames;
  static late List<String> _classNames;

  static Future<void> init() async {
    // Load the JSON files
    final keymap = Map<String, String>.from(await _loadJson(_keymapPath));
    final classes = Map<String, Map<String, String>>.fromEntries(
      Map<String, Map<String, dynamic>>.from(await _loadJson(_classesPath))
          .entries
          .map((entry) =>
              MapEntry(entry.key, Map<String, String>.from(entry.value)))
          .toList(),
    );

    // Initialize static data
    _categories = _buildCategories(keymap, classes);
    _categoryNames = keymap.values.toList();
    _classNames = classes.values.expand((element) => element.keys).toList();
  }

  static Future<Map<String, dynamic>> _loadJson(String path) async {
    final String json = await rootBundle.loadString(path);
    return jsonDecode(json);
  }

  static List<TailwindCategory> _buildCategories(
      Map<String, String> keymap, Map<String, Map<String, String>> classes) {
    return keymap.entries
        .map((entry) {
          final name = entry.key;
          final classesMap = classes[name];
          if (classesMap == null) {
            return null;
          }
          final records = classesMap.entries
              .map((entry) => TailwindRecord(
                    className: entry.key,
                    cssMeaning: entry.value,
                  ))
              .toList();
          return TailwindCategory(name: name, classes: records);
        })
        .where((element) => element != null)
        .cast<TailwindCategory>()
        .toList();
  }

  static List<TailwindCategory> get tailwindCategories => _categories;
  static List<String> get tailwindCategoryNames => _categoryNames;
  static List<String> get tailwindClassNames => _classNames;
}
