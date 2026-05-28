import 'package:flutter/material.dart';
import 'package:gesty_app/page/base.dart';
import 'package:gesty_app/utils/navigation.dart';
import 'package:gesty_app/widget/icon-gesty.dart';
import 'package:gesty_app/widget/simpel_btn.dart';
import 'package:gesty_app/widget/txt-field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email = '';
  String _pass = '';

  void logInAction(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => BaseApp()),
    );
  }

  void _savedValue(String newValue, String label) {
    print("$newValue, $label");
    setState(() {
      switch(label){
        case('Name'):
          break;
        case('Email'):
          _email = newValue;

          break;
        default:
          _pass = newValue;

      }
    });
  }

  // void navigate(BuildContext context, Widget page) {
  //   Navigator.push(
  //     context,
  //     PageRouteBuilder(
  //       transitionDuration: const Duration(milliseconds: 250),

  //       pageBuilder: (_, __, ___) => page,

  //       transitionsBuilder: (_, animation, __, child) {
  //         const begin = Offset(1.0, 0.0);
  //         const end = Offset.zero;

  //         final tween = Tween(
  //           begin: begin,
  //           end: end,
  //         ).chain(CurveTween(curve: Curves.ease));

  //         return SlideTransition(
  //           position: animation.drive(tween),
  //           child: child,
  //         );
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 255, 255, 255)
        ),
          backgroundColor:  Color.fromRGBO(30, 30, 30, 1.0),
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

            TxtField(label: 'Email',actionSaved: _savedValue,),
            TxtField(label: 'Password',actionSaved: _savedValue),
            const SizedBox(height: 30),
            SimpelBtn(t: "log in", w: 270,h:45, c: Color.fromRGBO(139, 18, 177, 1.0), bold: true,
              action: () => AppNavigator.navigate(context, const BaseApp()),), 

          ],
        ),
      )
    );
  }
}