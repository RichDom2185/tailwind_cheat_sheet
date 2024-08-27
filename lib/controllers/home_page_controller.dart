import 'package:flutter/material.dart';
import 'package:tailwind_dictionary/data/data_loader.dart';
import 'package:tailwind_dictionary/data/tailwind_category.dart';

class HomePageController {
  final TextEditingController searchController = TextEditingController();
  late final List<String> _allTags;
  late final List<TailwindCategory> _allClassNames;

  void initialize() {
    _allTags = DataLoader.tailwindCategoryNames;
    _allClassNames = DataLoader.tailwindCategories;
  }

  void dispose() {
    searchController.dispose();
  }

  List<String> get allTags => _allTags;
  List<TailwindCategory> get listItems {
    final search = searchController.text;
    if (search.isEmpty) {
      return _allClassNames;
    }
    return _allClassNames
        .map((category) => category.copyWith(
              classes: category.classes
                  .where((element) =>
                      element.className.contains(search) ||
                      element.cssMeaning.contains(search))
                  .toList(),
            ))
        .where((category) => category.classes.isNotEmpty)
        .toList();
  }
}
