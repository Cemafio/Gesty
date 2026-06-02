import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gesty_app/models/category_model.dart';
import 'package:gesty_app/providers/app_provider.dart';
import 'package:gesty_app/providers/wallet_provider.dart';
import 'package:gesty_app/service/service.dart';

final futureCategoryProvider = FutureProvider<List<CategoryModel>>((ref) async {
  final walletId = await ref.watch(walletProvider.future);
    final categories = await getAllCategory(
    baseUrl: ref.watch(baseUrl),
    token: ref.watch(accessTokenProvider),
    walletId: walletId['id'],
  );

  return [
    CategoryModel(name: 'All', walletId: walletId['id'], categoryId: 0),
    ...categories
  ];
});

final selectedCategoryProvider = StateProvider<String?>((ref) => 'All');

