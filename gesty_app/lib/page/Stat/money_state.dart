import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gesty_app/providers/app_provider.dart';
import 'package:gesty_app/providers/categories_provider.dart';
import 'package:gesty_app/providers/transaction_provider.dart';
import 'package:gesty_app/utils/extensionString.dart';
import 'package:gesty_app/widget/aleatoireColors.dart';
import 'package:gesty_app/widget/emptyState.dart';
import 'package:gesty_app/widget/legendItem.dart';
import 'package:gesty_app/widget/mini_profil.dart';
import 'package:fl_chart/fl_chart.dart';

class MoneyStatePage extends ConsumerStatefulWidget {
  const MoneyStatePage({super.key});

  @override
  ConsumerState<MoneyStatePage> createState() => _MoneyStatePageState();
}

class _MoneyStatePageState extends ConsumerState<MoneyStatePage> {

  @override
  Widget build(BuildContext context) {
    final colorApp = ref.watch(color_theme);

    final expenses = ref.watch(transactionsProvider).value!
      .where((t) => t.type == 'EXPENSE')
      .toList();

    final incomes = ref.watch(transactionsProvider).value!
      .where((t) => t.type == 'INCOME')
      .toList();

    final futureCategory = ref.watch(futureCategoryProvider);
    final sommeExpenses = expenses.fold<double>(0, (sum, t) => sum + t.amount);
    final sommeIncomes = incomes.fold<double>(0, (sum, t) => sum + t.amount);

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
          // MiniProfil(name: ref.watch(user_data)!.name.uperFirstChart()  ,email: ref.watch(user_data)!.email,marging: 16,),
    
          if(sections.isEmpty) ...[
            const SizedBox(height: 60),
            EmptyState(title: 'Pas de depense, pas de stat ...', subtitle: "Ajoutez votre première dépense dès maintenant.",lottiName: 'lottie_2', actionLabel: "Faire une transaction", onAction: (){},)
          ],
          
          if(sections.isNotEmpty) ...[

            const SizedBox(height: 150),
            Row(
              mainAxisAlignment: .center,
              children: [

                Container(
                  width: 160,
                  padding: .symmetric(horizontal: 12, vertical: 12),
                  // height: 90,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Column(
                    mainAxisAlignment: .spaceAround,
                    children: [
                      Text(
                        "Expenses",
                        style: TextStyle(
                          color: colorApp[4],
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Jersey15',
                        )
                      ),
                      Text(
                        "-${sommeExpenses.toStringAsFixed(2)} ar",
                        style: TextStyle(
                          color: colorApp.last,
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Jersey15',
                        )
                      ),

                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 160,
                  padding: .symmetric(horizontal: 12, vertical: 12),
                  // height: 90,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Column(
                    mainAxisAlignment: .spaceAround,
                    children: [
                      Text(
                        "Incomes",
                        style: TextStyle(
                          color: colorApp[4],
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Jersey15',
                        )
                      ),
                      Text(
                        "+${sommeIncomes.toStringAsFixed(2)} ar",
                        style: TextStyle(
                          color: colorApp[3],
                          fontSize: 22,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Jersey15',
                        )
                      ),
                    ],
                  ),
                ),
              ],
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
        
            const SizedBox(height: 60),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              // height: 200,
              padding: .all(16),
              decoration: BoxDecoration(
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
          ]
        ],
      ),
    );
  }
}
