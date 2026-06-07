import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gesty_app/models/user_model.dart';

final color_theme = StateProvider<List<dynamic>>((ref){
  return [
    Color(0xFF8B12B1),
    Color(0xFF1E1E1E),
    Color(0xFF242424),
    Color(0xFF19C285),
    Colors.white,
    Color(0xFFDF3F31),
  ];
});

final baseUrl = StateProvider<String>((ref) => 'https://gesty-api.onrender.com');
final accessTokenProvider = StateProvider<String>((ref) => '');
final isBalanceVisibleProvider = StateProvider<bool>((ref) => false);
final user_data = StateProvider<UserModel?>((ref) => null);