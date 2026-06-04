import 'package:flutter/material.dart';
import 'package:gesty_app/widget/mini_profil.dart';
import 'package:gesty_app/widget/simpel_btn.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class MoneyBox extends StatefulWidget {
  const MoneyBox({super.key});

  @override
  State<MoneyBox> createState() => _MoneyBoxState();
}

class _MoneyBoxState extends State<MoneyBox> {
  double level = 0.7;

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
        const SizedBox(height: 50),
        Center(
          child: SizedBox(
            width: 300,
            height: 300,
            child: LiquidCircularProgressIndicator(
              value: 0.2,
              valueColor: AlwaysStoppedAnimation(
                const Color.fromARGB(255, 51, 51, 51),
              ),
            
              backgroundColor: Color(0xFF242424),
            
              borderColor: const Color(0xFF242424),
              borderWidth: 2,
            
              direction: Axis.vertical,
            
              center: Column(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    "300.000 Ar",
                    style: TextStyle(color: Colors.white, fontFamily: 'Jersey15', fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Goal: 600.000 Ar",
                    style: TextStyle(color: Color(0xFF19C285), fontFamily: 'Jersey15', fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: .center,
          children: [

            Container(
              width: 100,
              padding: .symmetric(horizontal: 10, vertical: 15),
              height: 90,

              decoration: BoxDecoration(
                color: Color(0xFF242424),
                borderRadius: BorderRadius.circular(15),
              ),

              child: Column(
                mainAxisAlignment: .spaceAround,
                children: [
                  Icon(HugeIcons.strokeRoundedMoneyAdd01, color: Color(0xFF8B12B1), size: 30),
                  Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Jersey15',
                    )
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Container(
              width: 100,
              padding: .symmetric(horizontal: 10, vertical: 15),
              height: 90,

              decoration: BoxDecoration(
                color: Color(0xFF242424),
                borderRadius: BorderRadius.circular(15),
              ),

              child: Column(
                mainAxisAlignment: .spaceAround,
                children: [
                  Icon(HugeIcons.strokeRoundedChartIncrease, color: Color(0xFF8B12B1), size: 30),
                  Text(
                    textAlign: .center,
                    "Growth",
                    style: TextStyle(
                      
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Jersey15',
                    )
                  ),
                ],
              ),
            ),

          ],
        )
      ],
    );
  }
}