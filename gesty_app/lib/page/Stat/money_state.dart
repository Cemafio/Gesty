import 'package:flutter/material.dart';
import 'package:gesty_app/widget/legendItem.dart';
import 'package:gesty_app/widget/mini_profil.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hugeicons/hugeicons.dart';

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

        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 250,

          child: PieChart(
            PieChartData(
              sections: [

                PieChartSectionData(
                  badgeWidget: Icon(HugeIcons.strokeRoundedServingFood),
                  value: 40,
                  color: Color(0xFF19C285),
                  showTitle: false,
                  radius: 40
                ),
                PieChartSectionData(
                  badgeWidget: Icon(HugeIcons.strokeRoundedBabyBoyDress),
                  value: 70,
                  color: Color(0xFF1930C2),
                  showTitle: false,
                  radius: 40
                ),

                PieChartSectionData(
                  badgeWidget: Icon(HugeIcons.strokeRoundedCar01),
                  value: 30,
                  color: Colors.purple,
                  showTitle: false,
                  radius: 40
                ),
                PieChartSectionData(
                  badgeWidget: Icon(HugeIcons.strokeRoundedRepair),
                  value: 10,
                  color: Colors.orange,
                  showTitle: false,
                  radius: 40
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 50),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 200,
          padding: .all(16),
          decoration: BoxDecoration(
            // color: Color(0xFF242424),
            borderRadius: BorderRadius.circular(10)
          ),

          child: Wrap(
            // crossAxisAlignment: .start,
            spacing: 15,
            runSpacing: 10,
            alignment: .center,
            children: [
              LegendItem(
                color: Color(0xFF19C285),
                title: "Food",
              ),

              LegendItem(
                color: Colors.blue,
                title: "Dress",
              ),

              LegendItem(
                color: Colors.orange,
                title: "Repair",
              ),
                            LegendItem(
                color: Color(0xFF19C285),
                title: "Food",
              ),

              LegendItem(
                color: Colors.blue,
                title: "Dress",
              ),

              LegendItem(
                color: Colors.orange,
                title: "Repair",
              ),
                            LegendItem(
                color: Color(0xFF19C285),
                title: "Food",
              ),

              LegendItem(
                color: Colors.blue,
                title: "Dress",
              ),

              LegendItem(
                color: Colors.orange,
                title: "Repair",
              ),
              
            ],
          )
        ),

        Row(
          mainAxisAlignment: .spaceAround,
          children: [

          ],
        ),

        
      ],
    );
  }
}
