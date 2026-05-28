class TransactionModel {

  final String title;
  final double amount;
  final DateTime date;
  final String category;
  final TransactionType type;

  TransactionModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    required this.type,
  });
}

enum TransactionType {
  income,
  expense,
}