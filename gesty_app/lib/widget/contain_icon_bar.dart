import 'package:flutter/material.dart';

class MyMenuBar extends StatefulWidget {
  final String nameRoute;
  final IconData icon ;
  final void Function() onTap;
  final String selectedPageName;
  const MyMenuBar({super.key, required this.nameRoute, required this.icon, required this.onTap, required this.selectedPageName});

  @override
  State<MyMenuBar> createState() => _MenuBarState();
}

class _MenuBarState extends State<MyMenuBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
      onTap: () {
        widget.onTap();
      },
      
      child: Container(
        width: 48,
        height: 44,
        decoration: BoxDecoration(
          color: widget.selectedPageName == widget.nameRoute ? Color(0xFF8B12B1) : Color(0xFF242424),
          borderRadius: BorderRadius.circular(10),
        ),
        child:  Center(
          child: Icon(widget.icon)
        ),
          // Image.asset("assets/images/Money Box.svg", width: 20, height: 20),
      ),
    );
  }
}