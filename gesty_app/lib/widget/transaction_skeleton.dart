import 'package:flutter/material.dart';
import 'package:gesty_app/widget/skeletonWidget.dart';

class SkeletonTransaction extends StatelessWidget {
  const SkeletonTransaction({super.key});

  @override
  Widget build(BuildContext context) {
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
                SkeletonBox(width: 140, height: 14),
                const SizedBox(height: 6),
                SkeletonBox(width: 80, height: 10),
              ],
            ),
          ),

          // Montant
          SkeletonBox(width: 70, height: 14),
        ],
      ),
    );
  }
}