import 'package:flutter/material.dart';
import 'package:gesty_app/page/calculate/calculatePage.dart';
import 'package:gesty_app/page/home/home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gesty_app/page/money_box/money_box.dart';
import 'package:gesty_app/widget/contain_icon_bar.dart';
import 'package:hugeicons/hugeicons.dart';

class BaseApp extends StatefulWidget {
  const BaseApp({super.key});

  @override
  State<BaseApp> createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {
  String page_name = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(36, 36, 36, 1.0),
      body: Stack(
        children: [
          if(page_name == 'home')
            HomePage(),
          if(page_name == 'calculate')
            CalculatePage(),
          if(page_name == 'money_box')
            MoneyBox(),

          Positioned(
            bottom: 10,
            right: 16,
            left: 16,
            child: Container(
              width: double.infinity,
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: .circular(6),
              ),

              child: Row(
                mainAxisAlignment: .center,
                crossAxisAlignment: .center,
                children: [
                  MyMenuBar(url: 'assets/svg/home.svg', selectedPageName: page_name,icon: HugeIcons.strokeRoundedHome09,
                  onTap: (){
                    setState(() {
                      page_name = 'home';
                    });
                  }),
                  
                  const SizedBox(width: 5),
                  
                  MyMenuBar(url: 'assets/svg/calculate.svg', selectedPageName: page_name, icon: HugeIcons.strokeRoundedAnalytics01, onTap: (){
                    setState(() {
                      page_name = 'calculate';
                    });
                  }),

                  const SizedBox(width: 5),

                  MyMenuBar(url: 'assets/svg/money_box.svg', selectedPageName: page_name, icon: HugeIcons.strokeRoundedPiggyBank, onTap: (){
                    setState(() {
                      page_name = 'money_box';
                    });
                  }),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}