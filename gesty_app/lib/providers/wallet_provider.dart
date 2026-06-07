import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gesty_app/providers/app_provider.dart';
import 'package:gesty_app/service/service.dart';

final walletProvider = FutureProvider((ref) async {
  final token = ref.watch(accessTokenProvider);
  final base = ref.watch(baseUrl);

  // Si token est null, on attend
  if (token == null || token.isEmpty) return {};
  
  return await getWallet(
    base,
    "PERSONAL",
    token,
  );
});