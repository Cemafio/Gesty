import 'package:flutter/material.dart';
import 'package:gesty_app/page/base.dart';
import 'package:gesty_app/widget/icon-gesty.dart';
import 'package:gesty_app/widget/simpel_btn.dart';
import 'package:gesty_app/widget/txt-field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  void signUpAction(BuildContext context){
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

            TxtField(label: 'Name',),
            TxtField(label: 'Email',),
            TxtField(label: 'Password',),

            const SizedBox(height: 30),
            SimpelBtn(t: "Sign up", w: 270, h: 45, c: Color.fromRGBO(139, 18, 177, 1.0), action: () => signUpAction(context),), 

          ],
        ),
      )
    );
  }
}