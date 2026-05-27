import 'package:flutter/material.dart';

class LegendItem extends StatelessWidget {
  final Color color;
  final String title;

  const LegendItem({
    super.key,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,

      children: [

        Container(
          width: 10,
          height: 10,

          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),

        const SizedBox(width: 5),

        Text(
          title,

          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Jersey15',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}