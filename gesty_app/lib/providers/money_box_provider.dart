import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gesty_app/models/money_box_model.dart';
import 'package:gesty_app/providers/app_provider.dart';
import 'package:gesty_app/service/service.dart';

final moneyBoxProvider = FutureProvider<List<MoneyBoxModel>>((ref){
  return getMoneyBox(
    ref.watch(baseUrl),
    ref.watch(accessTokenProvider),
  );
});