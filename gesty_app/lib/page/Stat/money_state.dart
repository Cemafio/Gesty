import 'package:flutter/material.dart';
import 'package:gesty_app/widget/mini_profil.dart';

class MoneyStatePage extends StatefulWidget {
  const MoneyStatePage({super.key});

  @override
  State<MoneyStatePage> createState() => _MoneyStatePageState();
}

class _MoneyStatePageState extends State<MoneyStatePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: MiniProfil(
            name: "Cesar",
            email: "cesar@gmail.com",
          )
        ),
      ],
    );
  }
}