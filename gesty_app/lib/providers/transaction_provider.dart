import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gesty_app/models/transaction_model.dart';


final transactionsProvider = StateProvider<List<TransactionModel>>((ref) {
  return [
    TransactionModel(
      title: "Burger",
      amount: 50000,
      date: DateTime.now(),
      category: "Food",
      type: TransactionType.expense,
    ),
    TransactionModel(
      title: "Deposit",
      amount: 500000,
      date: DateTime.now(),
      category: "Depo",
      type: TransactionType.income,
    ),
    TransactionModel(
      title: "Le Fruit",
      amount: 5500,
      date: DateTime.now(),
      category: "Juice",
      type: TransactionType.expense,
    ),    
];
});