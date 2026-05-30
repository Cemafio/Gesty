import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gesty_app/page/Stat/money_state.dart';
import 'package:gesty_app/page/calculate/calculatePage.dart';
import 'package:gesty_app/page/home/home.dart';
import 'package:gesty_app/page/money_box/money_box.dart';
import 'package:gesty_app/providers/amount_provider.dart';
import 'package:gesty_app/providers/app_provider.dart';
import 'package:gesty_app/service/service.dart';
import 'package:gesty_app/widget/contain_icon_bar.dart';
import 'package:hugeicons/hugeicons.dart';

class BaseApp extends ConsumerStatefulWidget {
  const BaseApp({super.key});

  @override
  ConsumerState<BaseApp> createState() => _BaseAppState();
}

class _BaseAppState extends ConsumerState<BaseApp> {
  String page_name = 'home';
  late dynamic wallet;


  @override
  void initState() {
    super.initState();

    loadWallet();
  }

  Future<void> loadWallet() async {
    final result = await getWallet(
      ref.read(baseUrl),
      "PERSONAL",
      ref.read(accessTokenProvider),
    );
    if(result['success']){
      setState(() {
        wallet = result;
      });
      ref.read(amountProvider.notifier).state = wallet['data']['balance'].toDouble();
    }

}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,

            child: (page_name == 'home')
            ? HomePage()
            : (page_name == 'calculate')
              ? CalculatePage()
              : (page_name == 'money_box')
                ? MoneyBox()
                : (page_name == 'money_state')
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
                  MyMenuBar(nameRoute: 'home', selectedPageName: page_name, icon: HugeIcons.strokeRoundedHome09,
                  onTap: (){
                    setState(() {
                      page_name = 'home';
                    });
                  }),
                  
                  const SizedBox(width: 6),
                  
                  MyMenuBar(nameRoute: 'money_state', selectedPageName: page_name, icon: HugeIcons.strokeRoundedAnalytics01, onTap: (){
                    setState(() {
                      page_name = 'money_state';
                    });
                  }),

                  const SizedBox(width: 6),

                  MyMenuBar(nameRoute: 'money_box', selectedPageName: page_name, icon: HugeIcons.strokeRoundedPiggyBank, onTap: (){
                    setState(() {
                      page_name = 'money_box';
                    });
                  }),

                  const SizedBox(width: 6),

                  MyMenuBar(nameRoute: 'calculate', selectedPageName: page_name, icon: HugeIcons.strokeRoundedCalculate, onTap: (){
                    setState(() {
                      page_name = 'calculate';
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