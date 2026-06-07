import 'package:flutter/material.dart';
import 'package:gesty_app/providers/app_provider.dart';
import 'package:lottie/lottie.dart';

class EmptyState extends StatelessWidget {
  final String title;
  final String? lottiName;
  final String subtitle;
  final VoidCallback? onAction;
  final String? actionLabel;

  const EmptyState({
    super.key,
    required this.title,
    this.lottiName,
    required this.subtitle,
    this.onAction,
    this.actionLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Lottie.asset(
            'assets/animations/${(lottiName != null) ? lottiName : 'paper_plane'}.json',
            width: 150,
            height:150,
            repeat: true,
          ),
          // const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
          if (onAction != null) ...[
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: onAction,

              child: Text(actionLabel ?? "C'est parti !"),
            ),
          ]
        ],
      ),
    );
  }
}