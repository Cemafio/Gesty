import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gesty_app/providers/categories_provider.dart';
import 'package:gesty_app/providers/transaction_provider.dart';
import 'package:gesty_app/widget/aleatoireColors.dart';
import 'package:gesty_app/widget/legendItem.dart';
import 'package:gesty_app/widget/mini_profil.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hugeicons/hugeicons.dart';

class MoneyStatePage extends ConsumerStatefulWidget {
  const MoneyStatePage({super.key});

  @override
  ConsumerState<MoneyStatePage> createState() => _MoneyStatePageState();
}

class _MoneyStatePageState extends ConsumerState<MoneyStatePage> {

  @override
  Widget build(BuildContext context) {
    final expenses = ref.watch(transactionsProvider).value!
      .where((t) => t.type == 'EXPENSE')
      .toList();
    final futureCategory = ref.watch(futureCategoryProvider);


    Map<String, double> categoriesAmount = {};

    for (final transaction in expenses) {
      categoriesAmount.update(
        futureCategory.value!.firstWhere((c) => c.categoryId == transaction.categoryId).name,
        (value) => value + transaction.amount,
        ifAbsent: () => transaction.amount.toDouble(),
      );
    }

    final sections = categoriesAmount.entries.map((entry) {
      return PieChartSectionData(
        value: entry.value,
        color: getCategoryColor(entry.key),
        title: entry.key.split('').first.toUpperCase() + entry.key.split('')[1].toLowerCase(),
        titleStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          // color: Colors.white,
          fontFamily: 'Jersey15',
        ),
        radius: 40,
      );
    }).toList();

    return SafeArea(
      child: Column(
        children: [
           MiniProfil(
              name: "Cesar",
              email: "cesar@gmail.com",
              marging: 16,
            ),
      
          const SizedBox(height: 10),
          Text(
            "Your expenses",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Jersey15',
            ),
          ),
          Text(
            "statistics",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Jersey15',
            ),
          ),
      
          const SizedBox(height: 50),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 250,
      
            child: PieChart(
              PieChartData(
                sections: sections,
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
              spacing: 10,
              runSpacing: 10,
              alignment: .center,
      
              children: categoriesAmount.entries.map((entry) {
                return LegendItem(
                  title: entry.key,
                  color: getCategoryColor(entry.key),
                );
              }).toList(),
            )
          ),
      
          Row(
            mainAxisAlignment: .spaceAround,
            children: [
      
            ],
          ),
      
          
        ],
      ),
    );
  }
}
