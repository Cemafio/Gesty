import 'package:flutter/material.dart';

class MoneyBox extends StatefulWidget {
  const MoneyBox({super.key});

  @override
  State<MoneyBox> createState() => _MoneyBoxState();
}

class _MoneyBoxState extends State<MoneyBox> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: .all(16),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Text(
                    "C",
                    style: TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Jersey15',
                    )
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cesar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Jersey15',
                        )
                      ),
                      Text(
                        "cesar@gmail.com",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                        )
                      )
                    ],
                  )

                )
              ],
            ),
          ],
        ),
      )
    );
  }
}