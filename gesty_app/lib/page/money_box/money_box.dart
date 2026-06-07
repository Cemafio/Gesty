import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gesty_app/page/money_box/moneyBoxForm.dart';
import 'package:gesty_app/providers/app_provider.dart';
import 'package:gesty_app/providers/categories_provider.dart';
import 'package:gesty_app/providers/money_box_provider.dart';
import 'package:gesty_app/providers/transaction_provider.dart';
import 'package:gesty_app/service/service.dart';
import 'package:gesty_app/utils/extensionString.dart';
import 'package:gesty_app/widget/categorie.dart';
import 'package:gesty_app/widget/dynamic_modal.dart';
import 'package:gesty_app/widget/emptyState.dart';
import 'package:gesty_app/widget/icon-txt-field.dart';
import 'package:gesty_app/widget/loading.dart';
import 'package:gesty_app/widget/mini_profil.dart';
import 'package:gesty_app/widget/simpel_btn.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class MoneyBox extends ConsumerStatefulWidget {
  const MoneyBox({super.key});

  @override
  ConsumerState<MoneyBox> createState() => _MoneyBoxState();
}

class _MoneyBoxState extends ConsumerState<MoneyBox> {
  bool _isLoaded = false;
  TextEditingController amountController = TextEditingController();
  final  List<double> suggeste_amount = [500, 1000, 2000, 3000, 4000, 5000, 10000, 20000, 50000];
  bool isNotEmpty = false;

  void changeValueAmountController(String value){
    print('Amount in function: ${value}');

    setState(() {
      amountController.text = value;
    });
  }

  void _update() async {
    setState(() {
      _isLoaded = true;
    });

    final amount = double.tryParse(amountController.text);
    
    if (amount == null) return;

    try {
      await updateMoneyBoxAPI(
        id: ref.watch(moneyBoxProvider).value![0].id,
        baseUrl: ref.watch(baseUrl),
        token: ref.watch(accessTokenProvider),
        amountInBox: amount,
      );

      ref.refresh(moneyBoxProvider);
      amountController.clear();
      Navigator.of(context).pop();

    } catch (e) {
      throw Exception('Failed to update money box: $e');
    }finally{
      setState(() {
        _isLoaded = false;
      });
    }
  }

  void showDepositForm(List<dynamic> _color, String type) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        int selectedIndex = -1;

        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              padding: .all(10),
              margin: .only(bottom: MediaQuery.of(context).viewInsets.bottom),
                          
              decoration: BoxDecoration(
                color: _color[2],
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
                          selected: selectedIndex == index, 
                          title: suggeste_amount[index].toString(),
                          selectedAction: (){
                            print('Selected index: ${selectedIndex}');
                            setModalState(() {
                              selectedIndex = index;
                              changeValueAmountController(suggeste_amount[index].toString());
                            });
                          },
                        );
                      }
                    ),
                  ),  
                  const SizedBox(height: 5,),  
                  TxtFielWIcon(label: 'How much ?',type: 'number',controllerText: amountController, actionSaved: () => changeValueAmountController),
                  const SizedBox(height: 5,),  
                  SimpelBtn(action:() => _update(),t: type=='INCOME'?'deposit':'withdraw',c: (amountController.text.isNotEmpty)? _color.first:_color[1],bold: true,isLoaded: _isLoaded,)
                ],
              ),
            );
          }
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final moneyBoxAsync = ref.watch(moneyBoxProvider);
    final colorApp = ref.watch(color_theme);

    return SafeArea(
      child: 
      moneyBoxAsync.when(
        skipLoadingOnRefresh: true,
        
        loading: () => const Center(
          child: GestyLoadingWidget(),
        ),

        error: (e, _) => const Center(
          child: Text('Erreur de chargement'),
        ),

        data: (moneyBox) {
          if (moneyBox.isEmpty) {
            return EmptyState(
              title: "Boite a argent introuvable",
              subtitle: "Vous pouvez commencer par en créer un maintenant!",
              actionLabel: "Créer un!",
              onAction: () => showDynamicModal(
                context,
                title: "Créer une boîte d'épargne",
                subtitle: "Remplis ce formulaire pour en créer une",
                children: [
                  CreateMoneyBoxForm(
                    colorApp: colorApp,
                    onSubmit: (name, amount) async {
                      final result = await createMoneyBox(
                        baseUrl: ref.read(baseUrl),
                        token: ref.read(accessTokenProvider),
                        name: name,
                        targetAmount: amount,
                      );
                      if (result.isNotEmpty) {
                        Navigator.pop(context);
                        ref.refresh(moneyBoxProvider.future);
                      }
                    },
                  )
                ],
              ),
            );
          }

          // Données disponibles
          return Column(
            children: [

              const SizedBox(height: 150),
              Center(
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: LiquidCircularProgressIndicator(
                    value: (moneyBox.isNotEmpty) ? (moneyBox[0].amountInBox ?? 0) / moneyBox[0].targetAmount : 0,
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
                          "${moneyBox.isNotEmpty ? NumberFormat("#,###").format(moneyBox[0].amountInBox) : '0'} Ar",
                          style: TextStyle(color: Colors.white, fontFamily: 'Jersey15', fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Goal: ${moneyBox.isNotEmpty ? moneyBox[0].targetAmount.toString() : '0'} Ar",
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
          
                  GestureDetector(
                    onTap: () => showDepositForm(ref.watch(color_theme), 'INCOME'),
                    child: Container(
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
                            "Add",
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
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}