import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gesty_app/page/Stat/money_state.dart';
import 'package:gesty_app/page/calculate/calculatePage.dart';
import 'package:gesty_app/page/home/home.dart';
import 'package:gesty_app/page/money_box/money_box.dart';
import 'package:gesty_app/providers/app_provider.dart';
import 'package:gesty_app/widget/contain_icon_bar.dart';

import 'package:hugeicons/hugeicons.dart';

class BaseApp extends ConsumerStatefulWidget {
  const BaseApp({super.key});

  @override
  ConsumerState<BaseApp> createState() => _BaseAppState();
}

class _BaseAppState extends ConsumerState<BaseApp> {
  String pageName = 'home';
  late dynamic wallet;


  @override
  Widget build(BuildContext context) {
    final colorApp = ref.watch(color_theme);

    return Scaffold(
      backgroundColor: colorApp[1],
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,

            child: (pageName == 'home')
            ? HomePage()
            : (pageName == 'calculate')
              ? CalculatePage()
              : (pageName == 'money_box')
                ? MoneyBox()
                : (pageName == 'money_state')
                  ? MoneyStatePage()
                  : null,
          ),

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
                  MyMenuBar(nameRoute: 'home', selectedPageName: pageName, icon: HugeIcons.strokeRoundedHome09,
                  onTap: (){
                    setState(() {
                      pageName = 'home';
                    });
                  }),
                  
                  const SizedBox(width: 6),
                  
                  MyMenuBar(nameRoute: 'money_state', selectedPageName: pageName, icon: HugeIcons.strokeRoundedAnalytics01, onTap: (){
                    setState(() {
                      pageName = 'money_state';
                    });
                  }),

                  const SizedBox(width: 6),

                  MyMenuBar(nameRoute: 'money_box', selectedPageName: pageName, icon: HugeIcons.strokeRoundedPiggyBank, onTap: (){
                    setState(() {
                      pageName = 'money_box';
                    });
                  }),

                  const SizedBox(width: 6),

                  MyMenuBar(nameRoute: 'calculate', selectedPageName: pageName, icon: HugeIcons.strokeRoundedCalculate, onTap: (){
                    setState(() {
                      pageName = 'calculate';
                    });
                  }),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}