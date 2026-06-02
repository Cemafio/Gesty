class CategoryModel {

  final String name;
  final int walletId;
  final int categoryId;

  CategoryModel({
    required this.name,
    required this.walletId, 
    required this.categoryId,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> categoryJson) {
    return CategoryModel(
      name: categoryJson['name'],
      walletId: categoryJson['walletId'],
      categoryId: categoryJson['id'],
    );
  }

}
