import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gesty_app/models/category_model.dart';

final categoriesProvider = StateProvider<List<CategoryModel>>((ref) {
  return [
    CategoryModel(title: 'All', selected: true),
    CategoryModel(title: 'Food', selected: false),
    CategoryModel(title: 'Transport', selected: false),
    CategoryModel(title: 'Utilities', selected: false),
  ];
});

