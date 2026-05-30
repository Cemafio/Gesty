import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gesty_app/providers/app_provider.dart';
import 'package:gesty_app/service/service.dart';

final walletProvider = FutureProvider((ref) async {
  return await getWallet(
    ref.watch(baseUrl),
    "PERSONAL",
    ref.watch(accessTokenProvider),
  );
});