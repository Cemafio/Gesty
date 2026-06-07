import 'package:flutter/material.dart';
import 'package:gesty_app/widget/icon-txt-field.dart';
import 'package:gesty_app/widget/simpel_btn.dart';
import 'package:hugeicons/hugeicons.dart';

class CreateMoneyBoxForm extends StatefulWidget {
  final List<dynamic> colorApp;
  final Function(String name, double amount) onSubmit;

  const CreateMoneyBoxForm({
    super.key,
    required this.colorApp,
    required this.onSubmit,
  });

  @override
  State<CreateMoneyBoxForm> createState() => _CreateMoneyBoxFormState();
}

class _CreateMoneyBoxFormState extends State<CreateMoneyBoxForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    nameController.addListener(() => setState(() {}));
    amountController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    nameController.dispose();
    amountController.dispose();
    super.dispose();
  }

  bool get _isValid => nameController.text.isNotEmpty && amountController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TxtFielWIcon(
          label: 'Nom de la boîte',
          type: 'text',
          controllerText: nameController,
          actionSaved: (value) => setState(() {nameController.text = value; }),
          icon: Icon(HugeIcons.strokeRoundedPiggyBank, color: Colors.white),
        ),
        TxtFielWIcon(
          label: 'Objectif (montant)',
          type: 'number',
          controllerText: amountController,
          actionSaved: (value) => setState(() {amountController.text = value; }),
          icon: Icon(HugeIcons.strokeRoundedMoney01, color: Colors.white),
        ),
        const SizedBox(height: 10),
        SimpelBtn(
          t: 'Créer',
          bold: true,
          isLoaded: _isLoaded,
          c: _isValid ? widget.colorApp.first : widget.colorApp[1],
          action: _isValid
              ? () => widget.onSubmit(
                    nameController.text,
                    double.tryParse(amountController.text) ?? 0,
                  )
              : () {},
        ),
      ],
    );
  }
}