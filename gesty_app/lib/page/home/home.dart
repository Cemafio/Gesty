import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gesty_app/models/category_model.dart';
import 'package:gesty_app/models/transaction_model.dart';
import 'package:gesty_app/providers/amount_provider.dart';
import 'package:gesty_app/providers/app_provider.dart';
import 'package:gesty_app/providers/categories_provider.dart';
import 'package:gesty_app/providers/transaction_provider.dart';
import 'package:gesty_app/widget/categorie.dart';
import 'package:gesty_app/widget/mini_profil.dart';
import 'package:gesty_app/widget/simpel_btn.dart';
import 'package:gesty_app/widget/transaction.dart';
import 'package:intl/intl.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  Widget build(BuildContext context, WidgetRef ref) {
    final amount = ref.watch(amountProvider);
    final transactions = ref.watch(transactionsProvider);
    final categories = ref.watch(categoriesProvider);
    final colorApp = ref.watch(color_theme);

    void depositAction() {
      ref.read(amountProvider.notifier).state += 50000;
    }

    void withdrawAction() {
      ref.read(amountProvider.notifier).state -= 50000;
    }

    void changeCategorySelect(String t){

      ref.read(categoriesProvider.notifier).state =
          ref.read(categoriesProvider)
          .map((c) {

            return CategoryModel(
              title: c.title,
              selected: c.title == t,
            );

          }).toList();
    } 

    return SizedBox(
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Container(
            width: double.infinity,
            height: 300,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorApp[2],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
              )
            ),

            child: SafeArea(
              child: Column(
                children: [
                  MiniProfil(name: 'Cesar',email: 'cesar@gmail.com',),
              
                  const SizedBox(height: 5),
              
                  Text(
                    "$amount Ar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Jersey15',
                    )
                  ),
              
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .center,
                    children: [
              
                      SimpelBtn(t: "Deposit", w: 100, h: 35, c: colorApp[1], st: Colors.transparent, txc: colorApp[3], r: 6, bold: true, sizetx: 10, action: () => depositAction()),
                      const SizedBox(width: 10),
                      SimpelBtn(t: "Withdraw", w: 100, h: 35, c: colorApp[1], st: Colors.transparent, txc: colorApp.last, r: 6, bold: true, sizetx: 10, action: () => withdrawAction()),
                      const SizedBox(width: 10),
                      SimpelBtn(t: "Expenses", w: 100, h: 35, c: colorApp[1], st: Colors.transparent, txc: colorApp.first, r: 6, bold: true, sizetx: 10, action: (){}),
              
                    ],
                  )
                ],
              ),
            )
          ),
          
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 6,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 40),

                  SizedBox(
                    height: 25,

                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,

                      itemBuilder: (context, index) {

                        final category = categories[index];

                        return CategorieSection(
                          title: category.title,
                          selected: category.selected,
                          selectedAction: () => changeCategorySelect(category.title),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: -0),
                  Expanded(
                    child: ListView.builder(
                      itemCount: transactions.length,

                      itemBuilder: (context, index) {

                        final transaction = transactions[index];

                        return TransactionSection(
                          title: transaction.title,
                          date:  DateFormat('dd MMM, HH:mm').format(transaction.date),
                          amount: "${transaction.type==TransactionType.expense ? '-' : '+'}${transaction.amount} Ar",
                          category: transaction.category, 
                        );

                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}