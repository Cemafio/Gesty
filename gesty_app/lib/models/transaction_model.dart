class TransactionModel {
  final int id;
  final int categoryId;
  final double amount;
  final String type;
  final String description;
  final DateTime createdAt;

  TransactionModel({
    required this.id,
    required this.categoryId,
    required this.amount,
    required this.type,
    required this.description,
    required this.createdAt,
  });

  factory TransactionModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return TransactionModel(
      id: json['id'],
      categoryId: json['categoryId'],
      amount: json['amount'].toDouble(),
      type: json['type'],
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}