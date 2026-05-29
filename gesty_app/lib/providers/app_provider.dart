import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

final baseUrl = StateProvider<String>((ref) => 'http://10.76.52.28:3000');
final accessTokenProvider = StateProvider<String>((ref) => '');