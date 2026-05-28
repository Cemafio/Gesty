import 'package:flutter/material.dart';

class MiniProfil extends StatefulWidget {
  final String? name;
  final String? email;
  const MiniProfil({super.key, this.name, this.email});

  @override
  State<MiniProfil> createState() => _MiniProfilState();
}

class _MiniProfilState extends State<MiniProfil> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: .all(16),
        height: 85,
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
                        widget.name ?? "User",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Jersey15',
                        )
                      ),
                      Text(
                        widget.email ?? "user@gmail.com",
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
        )
      );
  }
}