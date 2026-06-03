import 'package:flutter/material.dart';

Color getCategoryColor(String categoryName) {
  final colors = [
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.red,
    Colors.teal,
    Colors.indigo,
    Colors.pink,
    Colors.amber,
    Colors.cyan,
    Color(0xFF19C285),
  ];

  final index = categoryName.hashCode.abs() % colors.length;

  return colors[index];
}