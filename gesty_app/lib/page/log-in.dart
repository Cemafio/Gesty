import 'package:flutter/material.dart';
import 'package:gesty_app/page/base.dart';
import 'package:gesty_app/widget/icon-gesty.dart';
import 'package:gesty_app/widget/simpel_btn.dart';
import 'package:gesty_app/widget/txt-field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void logInAction(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => BaseApp()),
    );
  }
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
            const SizedBox(height: 20),

            TxtField(label: 'Email',),
            TxtField(label: 'Password',),
            const SizedBox(height: 20),
            SimpelBtn(t: "log in", w: 220, c: Color.fromRGBO(139, 18, 177, 1.0), bold: true,
              action: () => logInAction(context),), 

          ],
        ),
      )
    );
  }
}