import 'package:flutter/material.dart';
import 'package:gesty_app/widget/categorie.dart';
import 'package:gesty_app/widget/simpel_btn.dart';
import 'package:gesty_app/widget/transaction.dart';
import 'package:hugeicons/hugeicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Container(
            width: double.infinity,
            height: 300,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFF242424),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
              )
            ),

            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Text(
                          "C",
                          style: TextStyle(
                            color: Color(0xFF1E1E1E),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Jersey15',
                          )
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cesar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Jersey15',
                              )
                            ),
                            Text(
                              "cesar@gmail.com",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                              )
                            )
                          ],
                        )
              
                      )
                    ],
                  ),
              
                  const SizedBox(height: 40),
              
                  Text(
                    "1.600.000 Ar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Jersey15',
                    )
                  ),
              
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: .spaceAround,
                    crossAxisAlignment: .center,
                    children: [
              
                      SimpelBtn(t: "Deposit", w: 100, h: 35, c: Color(0xFF1E1E1E), st: Colors.transparent, txc: Color(0xFF19C285), r: 6, bold: true, sizetx: 10, action: (){}),
                      const SizedBox(width: 10),
                      SimpelBtn(t: "Withdraw", w: 100, h: 35, c: Color(0xFF1E1E1E), st: Colors.transparent, txc: Color.from(alpha: 1, red: 0.875, green: 0.247, blue: 0.192), r: 6, bold: true, sizetx: 10, action: (){}),
                      const SizedBox(width: 10),
                      SimpelBtn(t: "Expenses", w: 100, h: 35, c: Color(0xFF1E1E1E), st: Colors.transparent, txc: Color(0xFF8B12B1), r: 6, bold: true, sizetx: 10, action: (){}),
              
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

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CategorieSection(title: 'All', selected: true,),
                        CategorieSection(title: 'Food', selected: false,),
                        CategorieSection(title: 'Transport', selected: false,),
                        CategorieSection(title: 'Entertainment', selected: false,),
                        CategorieSection(title: 'Utilities', selected: false,),
                        CategorieSection(title: 'Utilities', selected: false,),
                        CategorieSection(title: 'Utilities', selected: false,),
                      ],
                    ),
                  ),
                  const SizedBox(height: -0),
                  Expanded(
                    child: ListView(
                      children: [
                        TransactionSection(
                          title: 'Burger', 
                          date: 'Today, 19:43 PM', 
                          amount: '-50.000 Ar', 
                          icon: Icons.fastfood_rounded
                        ),
                        TransactionSection(
                          title: 'Deposit', 
                          date: 'Today, 20:30 PM', 
                          amount: '+100.000 Ar', 
                          icon: HugeIcons.strokeRoundedMoneyAdd01
                        ),
                        TransactionSection(
                          title: 'Deposit', 
                          date: 'Today, 20:30 PM', 
                          amount: '+100.000 Ar', 
                          icon: HugeIcons.strokeRoundedMoneyAdd01
                        ),
                        TransactionSection(
                          title: 'Deposit', 
                          date: 'Today, 20:30 PM', 
                          amount: '+100.000 Ar', 
                          icon: HugeIcons.strokeRoundedMoneyAdd01
                        ),
                        TransactionSection(
                          title: 'Deposit', 
                          date: 'Today, 20:30 PM', 
                          amount: '+100.000 Ar', 
                          icon: HugeIcons.strokeRoundedMoneyAdd01
                        ),
                        TransactionSection(
                          title: 'Repaire PC', 
                          date: 'Today, 20:30 PM', 
                          amount: '-50.000 Ar'
                        ),
                        TransactionSection(
                          title: 'Repaire PC', 
                          date: 'Today, 20:30 PM', 
                          amount: '-50.000 Ar'
                        ),
                        TransactionSection(
                          title: 'Repaire PC', 
                          date: 'Today, 20:30 PM', 
                          amount: '-50.000 Ar'
                        ),
                        TransactionSection(
                          title: 'Repaire PC', 
                          date: 'Today, 20:30 PM', 
                          amount: '-50.000 Ar'
                        ),
                        const SizedBox(height: 70),
                      ],
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