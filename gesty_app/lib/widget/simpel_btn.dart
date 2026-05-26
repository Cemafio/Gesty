import 'package:flutter/material.dart';
import 'package:gesty_app/page/log-in.dart';
import 'package:gesty_app/page/sign-up.dart';

class SimpelBtn extends StatefulWidget {
  final double? w;
  final double? h;
  final String? t;
  final Color? c;
  final Color? txc;
  final Color? st;
  final void Function() action;
  final double? r;
  final double? sizetx;
  final bool? bold;

  const SimpelBtn({super.key, this.w, this.h, this.t, this.c, this.txc, this.st,this.r, this.bold, this.sizetx, required this.action});

  @override
  State<SimpelBtn> createState() => _SimpelBtnState();
}

class _SimpelBtnState extends State<SimpelBtn> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          widget.action();
        },
        child: Container(
          alignment: Alignment.center,
          width: widget.w ?? 150,
          height: widget.h ?? 35,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
          decoration: BoxDecoration(
            color: widget.c ?? Color.fromRGBO(30, 30, 30, 1.0),
            border: Border.all(color: widget.st ??  Colors.transparent, width: 1),
            borderRadius: BorderRadius.circular(widget.r ?? 10),
          ),
          child: Text(
            widget.t ?? "Simpel Button",
            style: TextStyle(
              color: widget.txc ?? Color.fromRGBO(30, 30, 30, 1.0),
              fontWeight: widget.bold ?? false ? FontWeight.bold : FontWeight.normal,
              fontSize: widget.sizetx ?? 13,
            ),
          ),
        ),
      ),
    );
  }
}