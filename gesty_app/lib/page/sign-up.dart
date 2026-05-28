import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gesty_app/page/base.dart';
import 'package:gesty_app/providers/app_provider.dart';
import 'package:gesty_app/service/service.dart';
import 'package:gesty_app/widget/icon-gesty.dart';
import 'package:gesty_app/widget/simpel_btn.dart';
import 'package:gesty_app/widget/txt-field.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _pass = '';

  Future<void> signUpAction(BuildContext context, String url)async {

    formKey.currentState!.validate();
    formKey.currentState!.save();

    if(_name.isNotEmpty && _email.isNotEmpty && _pass.isNotEmpty){
      // final _baseUrl = ref.watch(baseUrl);
      final response = await register(url, _name, _email, _pass);

      if(response == 'Success'){  
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => BaseApp()),
        );
      }
    }

  }

  void _savedValue(String newValue, String label) {
    print("$newValue, $label");
    setState(() {
      switch(label){
        case('Name'):
          _name = newValue;

          break;
        case('Email'):
          _email = newValue;

          break;
        default:
          _pass = newValue;

      }
    });
  }


  @override
  Widget build(BuildContext context) {
    final _baseUrl = ref.watch(baseUrl);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 255, 255, 255)
        ),
          backgroundColor:  Color(0xFF1E1E1E),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconGesty(),
            Text(
              "Gesty",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.normal,
                fontFamily: 'Jersey15',
              )
            ),
            
            const SizedBox(height: 30),

            Form(
              key: formKey,
              child: Column(
                children: [
                  TxtField(label: 'Name',actionSaved: _savedValue,),
                  TxtField(label: 'Email',actionSaved: _savedValue),
                  TxtField(label: 'Password',actionSaved: _savedValue),
                ],
              )
            ),

            const SizedBox(height: 30),
            SimpelBtn(t: "Sign up", w: 270, h: 45, c: Color.fromRGBO(139, 18, 177, 1.0), action: () => signUpAction(context, _baseUrl),), 

          ],
        ),
      )
    );
  }
}