import 'package:flutter/material.dart';
import 'package:gesty_app/page/calculate/calculatorGrid.dart';
import 'package:gesty_app/widget/mini_profil.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({super.key});

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: MiniProfil(
            name: "Cesar",
            email: "cesar@gmail.com",
            marging: 16,
          )
        ),
        // const SizedBox(height: 200),Contain
        Expanded(
          child: CalculatorGrid(),
        )
      ],
    );
    
  }
}