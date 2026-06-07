import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GestyLoadingWidget extends StatefulWidget {
  const GestyLoadingWidget({super.key});

  @override
  State<GestyLoadingWidget> createState() => _GestyLoadingWidgetState();
}

class _GestyLoadingWidgetState extends State<GestyLoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Lottie.asset(
        'assets/animations/loading_hand.json',
        width: 150,
        height:150,
        repeat: true,
      ),
    );
  }
}