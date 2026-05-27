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
  final Icon? iconBtn;

  const SimpelBtn({super.key, this.w, this.h, this.t, this.c, this.txc, this.st,this.r, this.bold, this.sizetx, required this.action, this.iconBtn});

  @override
  State<SimpelBtn> createState() => _SimpelBtnState();
}

class _SimpelBtnState extends State<SimpelBtn> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(widget.r ?? 10),

      child: Ink(
        decoration: BoxDecoration(
          color: widget.c ?? const Color(0xFF1E1E1E),

          border: Border.all(
            color: widget.st ?? Colors.transparent,
            width: 1,
          ),

          borderRadius: BorderRadius.circular(widget.r ?? 10),
        ),

        child: InkWell(
          borderRadius: BorderRadius.circular(widget.r ?? 10),

          onTap: widget.action,

          child: Container(
            alignment: Alignment.center,
            width: widget.w ?? 150,
            height: widget.h ?? 35,

            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 7,
            ),

            child: Text(
              widget.t ?? "Simple Button",

              style: TextStyle(
                color: widget.txc ?? Color(0xFF363636),

                fontWeight:
                    (widget.bold ?? false)
                        ? FontWeight.bold
                        : FontWeight.normal,

                fontSize: widget.sizetx ?? 13,
              ),
            ),
          ),
        ),
      ),
    );
  }
}