import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gesty_app/widget/skeletonWidget.dart';

class SkeletonTransaction extends StatelessWidget {
  const SkeletonTransaction({super.key});


  @override
  Widget build(BuildContext context) {
    final random = Random();
    final titleWidth = 100.0 + random.nextInt(80).toDouble();
    final dateWidth = 60.0 + random.nextInt(40).toDouble();
    final amountWidth = 50.0 + random.nextInt(40).toDouble();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          // Icone
          SkeletonBox(width: 40, height: 40, radius: 20),
          const SizedBox(width: 12),

          // Titre et date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkeletonBox(width: titleWidth, height: 14),
                const SizedBox(height: 6),
                SkeletonBox(width: dateWidth, height: 10),
              ],
            ),
          ),

          // Montant
          SkeletonBox(width: amountWidth, height: 14),
        ],
      ),
    );
  }
}