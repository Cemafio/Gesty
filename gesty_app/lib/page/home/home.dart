import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gesty_app/providers/wallet_provider.dart';
import 'package:gesty_app/providers/app_provider.dart';
import 'package:gesty_app/providers/categories_provider.dart';
import 'package:gesty_app/providers/transaction_provider.dart';
import 'package:gesty_app/utils/extensionString.dart';
import 'package:gesty_app/widget/categorie.dart';
import 'package:gesty_app/widget/emptyState.dart';
import 'package:gesty_app/widget/icon-btn.dart';
import 'package:gesty_app/widget/mini_profil.dart';
import 'package:gesty_app/widget/skeletonWidget.dart';
import 'package:gesty_app/widget/transaction.dart';
import 'package:gesty_app/widget/transaction_skeleton.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:gesty_app/service/service.dart';
import 'package:gesty_app/widget/icon-txt-field.dart';
import 'package:gesty_app/widget/simpel_btn.dart';
import 'package:lottie/lottie.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  bool _isLoaded = false;

  final  List<double> suggeste_amount = [500, 1000, 2000, 3000, 4000, 5000, 10000, 20000, 50000];
  
  void changeCategorySelect(String catego, int categoiryId, ) async {
    ref.read(selectedCategoryProvider.notifier).state = catego;
      ref.read(categoriesFilteredProvider.notifier).state = ref.read(transactionsProvider).value!
        .where((c) => c .categoryId == categoiryId)
        .toList();
  }

  void changeValueTextController(String value,String type){
    setState(() {
      switch (type) {
        case 'How much ?':
          amountController.text = value;
          break;
        case 'Your description':
          descriptionController.text = value;
          break;
        case 'His category':
          categoryController.text = value;
          break;
        default:
      }
    });
  }

  Future<void> depositTransaction(String type)async {
    final _baseUrl = ref.read(baseUrl);
    final token = ref.read(accessTokenProvider);
    final double _amount = double.tryParse(amountController.text) ?? 0.0;
    final int walletId = await ref.read(walletProvider.future).then((value) => value['id']);

    if (_baseUrl != '' && token != '' && _amount > 0 && descriptionController.text != '') {
      setState(() {
        _isLoaded = true;
      });

      try {
        await depositServiceTransaction(
          idWallet: walletId,
          amount: _amount,
          baseUrl: _baseUrl,
          category: type, 
          token: token, 
          type: type,
          description: descriptionController.text,
          categoryName: categoryController.text,
        );
        refreshData();
        setState(() {
          amountController.text = '';
          descriptionController.text = '';
          categoryController.text = '';
        });

        Navigator.pop(context,true);

      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erreur lors de la transaction"))
        );        
      }finally {
        setState(() {
          _isLoaded = false;
        });
      }
    }
  }

  Future<void> refreshData() async {
    print('Refreshing data...');
    await ref.refresh(walletProvider.future);
    await ref.refresh(transactionsProvider.future);
    await ref.refresh(futureCategoryProvider.future);
  }

  void showDepositForm(List<dynamic> _color, String type) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.4,
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
                      selected: amountController.text == suggeste_amount[index].toString(), 
                      title: suggeste_amount[index].toString(),
                      selectedAction: ()=>changeValueTextController(suggeste_amount[index].toString(), 'How much ?'),
                    );
                  }
                ),
              ),

              const SizedBox(height: 5,),  
              TxtFielWIcon(label: 'How much ?',type: 'number',controllerText: amountController, actionSaved: changeCategorySelect),
              TxtFielWIcon(label: 'Your description',type: 'text',controllerText: descriptionController, actionSaved: changeValueTextController, icon: Icon(HugeIcons.strokeRoundedText, color: Colors.white,)),
              const SizedBox(height: 5,),  
              TxtFielWIcon(label: 'His category',type: 'text',controllerText: categoryController, actionSaved: changeValueTextController, icon: Icon(HugeIcons.strokeRoundedText, color: Colors.white,)),
              const SizedBox(height: 5,),  
              SimpelBtn(action: ()=> depositTransaction(type),t: type=='INCOME'?'deposit':'withdraw',c: (amountController.text != ''&& descriptionController.text != ''&& categoryController.text != '')? _color.first:_color[1],bold: true,isLoaded: _isLoaded,)
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final walletAsync = ref.watch(walletProvider);
    final selectedCategoryName = ref.watch(selectedCategoryProvider); 
    final transactions = ref.watch(transactionsProvider);
    final colorApp = ref.watch(color_theme);
    final futureCategory = ref.watch(futureCategoryProvider);
    final transactionForCategery = ref.watch(categoriesFilteredProvider);

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
                  MiniProfil(name: ref.watch(user_data)!.name.uperFirstChart()  ,email: ref.watch(user_data)!.email,),
              
                  const SizedBox(height: 5),
                  walletAsync.when(
                    data: (wallet) => Text(
                      "${NumberFormat('#,###', 'fr_FR').format(wallet['balance'])} Ar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Jersey15',
                      )
                    ),
                    loading: () => CircularProgressIndicator(),
                    error: (e, _) => Text(
                      "0 Ar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Jersey15',
                      )
                    ),
                  ),
              
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .center,
                    children: [
                      IconBtnWidget(iconBtn: Icon(HugeIcons.strokeRoundedAdd02, color: colorApp[3],), c: colorApp[1], r: 20, sizeIcon: 15, action: () => showDepositForm(colorApp, 'INCOME')),
                      const SizedBox(width: 10),
                      IconBtnWidget(iconBtn: Icon(HugeIcons.strokeRoundedRemove02, color: colorApp.last,), c: colorApp[1], r: 20, sizeIcon: 15, action: () => showDepositForm(colorApp, 'EXPENSE')),
                      const SizedBox(width: 10),
                      IconBtnWidget(iconBtn: Icon(HugeIcons.strokeRoundedAddToList, color: colorApp.first,), c: colorApp[1], r: 20, sizeIcon: 15, action: (){}),
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

                  if(futureCategory.hasValue)...[
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 25,

                      child: futureCategory.when(
                        skipLoadingOnRefresh: true,
                        data: (c) {
                          // print('Categories loaded: $c');
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: c.length,
                            itemBuilder: (context, index) {
                              final category = c[index];

                              return CategorieSection(
                                title: category.name,
                                selected: category.name == selectedCategoryName,
                                selectedAction: () {
                                  changeCategorySelect(category.name, category.categoryId);
                                },
                              );
                            },
                          );
                        },

                        loading: () => Row(
                          children: List.generate(4, (index) => 
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: SkeletonBox(width: 50, height: 20, radius: 6),
                            )
                          ),
                        ),

                        error: (error, stack) => Center(
                          child: Text(''),
                        ),
                      )
                    ),
                  ],
                  

                  if(transactionForCategery.isNotEmpty)
                    Expanded(
                      child: ListView.builder(
                        itemCount: transactionForCategery.length,

                        itemBuilder: (context, index) {
                          final transaction = transactionForCategery[index];

                          return TransactionSection(
                            title: transaction.description,
                            date:  DateFormat('dd MMM, HH:mm').format(transaction.createdAt),
                            amount: "${transaction.type=='EXPENSE' ? '-' : '+'}${transaction.amount} Ar",
                            category: transaction.type, 
                          );
                        },
                      )
                    ),

                  if(transactionForCategery.isEmpty)
                    Expanded(
                      child: transactions.when(
                        loading: () => ListView.builder(
                          itemCount: 5, // 5 skeletons
                          itemBuilder: (context, index) => const SkeletonTransaction(),
                        ),


                        error: (err, stack){
                          print(err);
                          print(stack);
                          
                          return Text(
                            'Erreur : $err',
                          );
                        },

                        data: (transactions) {
                          if(transactions.isEmpty) {
                            return EmptyState(title: "Pas encore de transactions.", subtitle: "Ajoutez votre première dépense des maintenant.", onAction: () => showDepositForm(colorApp, 'INCOME'),);
                          }

                          return ListView.builder(
                            itemCount: transactions.length,

                            itemBuilder: (context, index) {
                              final transaction = transactions[index];

                              return TransactionSection(
                                title: transaction.description,
                                date:  DateFormat('dd MMM, HH:mm').format(transaction.createdAt),
                                amount: "${transaction.type=='EXPENSE' ? '-' : '+'}${transaction.amount} Ar",
                                category: transaction.type, 
                              );
                            },
                          );
                        },
                      ),
                    ),
                  const SizedBox(height: 70),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
