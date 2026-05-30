import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gesty_app/models/transaction_model.dart';
import 'package:gesty_app/page/Stat/money_state.dart';
import 'package:gesty_app/page/calculate/calculatePage.dart';
import 'package:gesty_app/page/home/home.dart';
import 'package:gesty_app/page/money_box/money_box.dart';
import 'package:gesty_app/providers/app_provider.dart';
import 'package:gesty_app/service/service.dart';
import 'package:gesty_app/widget/categorie.dart';
import 'package:gesty_app/widget/contain_icon_bar.dart';
import 'package:gesty_app/widget/icon-txt-field.dart';
import 'package:gesty_app/widget/simpel_btn.dart';
import 'package:gesty_app/widget/txt-field.dart';
import 'package:hugeicons/hugeicons.dart';

class BaseApp extends ConsumerStatefulWidget {
  const BaseApp({super.key});

  @override
  ConsumerState<BaseApp> createState() => _BaseAppState();
}

class _BaseAppState extends ConsumerState<BaseApp> {
  String page_name = 'home';
  late dynamic wallet;
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final  List<double> suggeste_amount = [1000, 2000, 3000, 4000, 5000, 10000, 20000, 50000];

  void insertAmountSuggest(String amount,){
    setState(() {
      amountController.text = amount;
    });
  }

  void changeValueDescription(String desc,){
    
    setState(() {
      descriptionController.text = desc;
    });
  }

  Future<void> depositTransaction()async {
    final _baseUrl = ref.watch(baseUrl);
    final token = ref.watch(accessTokenProvider);
    final _amount =double.parse(amountController.text);

    final response = depositServiceTransaction(
      idWallet: 1,
      amount: _amount,
      baseUrl: _baseUrl,
      category: "Depot", 
      token: token, 
      type: TransactionType.income
    );
  }

  @override
  Widget build(BuildContext context) {
    final _baseUrl = ref.watch(baseUrl);
    final colorApp = ref.watch(color_theme);

    return Scaffold(
      backgroundColor: colorApp[1],
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
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,

              padding: .all(10),
                          
              decoration: BoxDecoration(
                color: colorApp[2],
                borderRadius: .only(topLeft: .circular(20),topRight: .circular(20))
              ),

              child: Column(
                mainAxisAlignment: .center,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 25
                    ),
                    child: ListView.builder(
                      scrollDirection: .horizontal,
                      itemCount: suggeste_amount.length,
                                    
                      itemBuilder: (context, index){
                        return CategorieSection(
                          selected: amountController.text == suggeste_amount[index].toString(), 
                          title: suggeste_amount[index].toString(),
                          selectedAction: ()=>insertAmountSuggest(suggeste_amount[index].toString())
                        );
                      }
                    ),
                  ),
                  const SizedBox(height: 5,),  
                  TxtFielWIcon(label: 'How much ?',controllerText: amountController, actionSaved: insertAmountSuggest),
                  TxtFielWIcon(label: 'Your decription',controllerText: descriptionController, actionSaved: changeValueDescription, icon: Icon(HugeIcons.strokeRoundedText, color: Colors.white,)),
                  const SizedBox(height: 5,),  
                  SimpelBtn(action: ()=>depositTransaction(),t: 'confirmed',c: (amountController.text != ''&& descriptionController.text != '')? colorApp.first:colorApp[1],bold: true,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}