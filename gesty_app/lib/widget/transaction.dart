
import 'package:flutter/material.dart';

class TransactionSection extends StatefulWidget {
  final String title;
  final String? date;
  final String amount;
  final IconData? icon;
  const TransactionSection({super.key, required this.title, this.date, required this.amount, this.icon});

  @override
  State<TransactionSection> createState() => _TransactionSectionState();
}

class _TransactionSectionState extends State<TransactionSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      height: 60,
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        // color: Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        crossAxisAlignment: .center,
        children: [
          Row(
            children: [
              const SizedBox(width: 5),
              Icon(widget.icon ?? Icons.category, color: Colors.white, size: 20,),
              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Jersey15',
                    )
                  ),
                  Text(
                    widget.date ?? "Today, 12:00 PM",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.normal,
                    )
                  )
                ],
              )
            ],
          ),

          Text(
            widget.amount,
            style: TextStyle(
              color: widget.amount.startsWith('+') ? Color(0xFF19C285) : Color(0xFFDF3F31),
              fontSize: 15,
              fontWeight: FontWeight.normal,
              fontFamily: 'Jersey15',
            )
          )
        ],
      ),
    );
  }
}