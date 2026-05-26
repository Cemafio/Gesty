
import 'package:flutter/material.dart';
import 'package:gesty_app/page/log-in.dart';
import 'package:gesty_app/page/sign-up.dart';
import 'package:gesty_app/widget/icon-gesty.dart';
import 'package:gesty_app/widget/simpel_btn.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  void navigate(BuildContext context, Widget page) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),

        pageBuilder: (_, __, ___) => page,

        transitionsBuilder: (_, animation, __, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;

          final tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: Curves.ease));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                SimpelBtn(t: "Sign up", w: 260, h: 42, c: Color(0xFF8B12B1), bold: true,
                  action: () => navigate(context, const SignUp())
                ), 
                const SizedBox(height: 10),
                SimpelBtn(t: "Log in", w: 260, h: 42, c: Color(0xFF1E1E1E), txc:Colors.white, st: Color.fromRGBO(63, 63, 63, 1.0),bold: true, 
                  action: () => navigate(context, const Login())
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}