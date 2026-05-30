import 'package:flutter/material.dart';

class IconBtnWidget extends StatefulWidget {
    final double? w;
  final double? h;
  final Color? c;
  final double? r;
  final Color? borderColor;
  final double? sizeIcon;
  final Icon iconBtn;

  final void Function() action;

  const IconBtnWidget({super.key, this.w, this.h, this.c,this.r, this.borderColor,this.sizeIcon, required this.action, required this.iconBtn});

  @override
  State<IconBtnWidget> createState() => _IconBtnWidgetState();
}

class _IconBtnWidgetState extends State<IconBtnWidget> {


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(widget.r ?? 20),

      child: Ink(
        decoration: BoxDecoration(
          color: widget.c ?? const Color(0xFF1E1E1E),

          border: Border.all(
            color: widget.borderColor ?? Colors.transparent,
            width: 1,
          ),

          borderRadius: BorderRadius.circular(widget.r ?? 20),
        ),

        child: InkWell(
          borderRadius: BorderRadius.circular(widget.r ?? 20),

          onTap: widget.action,

          child: Container(
            alignment: Alignment.center,
            width: widget.w ?? 50,
            height: widget.h ?? 50,

            child: Center(child: widget.iconBtn)
          ),
        ),
      ),
    );
  }
}