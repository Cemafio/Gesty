
import 'package:flutter/material.dart';
import 'package:gesty_app/page/log-in.dart';
import 'package:gesty_app/page/sign-up.dart';
import 'package:gesty_app/widget/icon-gesty.dart';
import 'package:gesty_app/widget/simpel_btn.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  void navigation_(BuildContext context, Widget root){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => root),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 30, 30, 1),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,

            // decoration: BoxDecoration(
            //   border: Border.all(
            //     color: Color.fromRGBO(139, 18, 177, 1.0),
            //     width: 1,
            //   )
            // ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconGesty(),
                const SizedBox(height: 20),
                Text(
                  "Your money",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "under control with",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Gesty.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 50),

                SimpelBtn(t: "Sign up", w: 200, c: Color.fromRGBO(139, 18, 177, 1.0), bold: true,
                  action: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SignUp()),
                    );
                  }
                ), 
                const SizedBox(height: 10),
                SimpelBtn(t: "Log in", w: 200, c: Color.fromRGBO(30, 30, 30, 1.0), txc:Colors.white, st: Color.fromRGBO(63, 63, 63, 1.0),bold: true, 
                  action: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Login()),
                    );
                  }
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}