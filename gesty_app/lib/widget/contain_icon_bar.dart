import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gesty_app/providers/app_provider.dart';

class MyMenuBar extends ConsumerStatefulWidget {
  final String nameRoute;
  final IconData icon ;
  final void Function() onTap;
  final String selectedPageName;
  const MyMenuBar({super.key, required this.nameRoute, required this.icon, required this.onTap, required this.selectedPageName});

  @override
  ConsumerState<MyMenuBar> createState() => _MenuBarState();
}

class _MenuBarState extends ConsumerState<MyMenuBar> {

  @override
  Widget build(BuildContext context) {
    final colorApp = ref.watch(color_theme);
    
    return GestureDetector(
      
      onTap: () {
        widget.onTap();
      },
      
      child: Container(
        width: 48,
        height: 44,
        decoration: BoxDecoration(
          color: widget.selectedPageName == widget.nameRoute ? colorApp.first : colorApp[2],
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