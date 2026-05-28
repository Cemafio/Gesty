import 'package:flutter/material.dart';

class AppNavigator {

  static void navigate( BuildContext context,Widget page,) {
    Navigator.push(
      context,

      PageRouteBuilder(

        transitionDuration:
            const Duration(milliseconds: 250),

        pageBuilder: (_, __, ___) => page,

        transitionsBuilder:
            (_, animation, __, child) {

          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;

          final tween = Tween(
            begin: begin,
            end: end,
          ).chain(
            CurveTween(curve: Curves.ease),
          );

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }
}