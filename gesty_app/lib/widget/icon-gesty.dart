import 'package:flutter/material.dart';

class IconGesty extends StatelessWidget {
  const IconGesty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          Text(
            "Gy",
            style: TextStyle(
              color: Color.fromRGBO(30, 30, 30, 1),
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Jersey15',
            )
          ),
        ],
      ),
    );
  }
}