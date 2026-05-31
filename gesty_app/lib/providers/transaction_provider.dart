import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gesty_app/models/transaction_model.dart';
import 'package:gesty_app/providers/app_provider.dart';
import 'package:gesty_app/service/service.dart';


final transactionsProvider = FutureProvider<List<TransactionModel>>((ref) async {
  return await getAllTransactions(
    ref.watch(baseUrl),
    ref.watch(accessTokenProvider),
  );
});