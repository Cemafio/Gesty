import 'package:flutter/material.dart';

class CategorieSection extends StatefulWidget {
  final String? title;
  final bool selected;
  CategorieSection({super.key, this.title, required this.selected});

  @override
  State<CategorieSection> createState() => _CategorieSectionState();
}

class _CategorieSectionState extends State<CategorieSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(horizontal: 10, vertical: 1),
      margin: .symmetric(horizontal: 5,),
      decoration: BoxDecoration(
        color: !widget.selected ? Color(0xFF1E1E1E) : Color(0xFF8B12B1),
        borderRadius: BorderRadius.circular(6)
      ),
      child: Text(
        widget.title ?? 'category',
        style: TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.normal,
          fontFamily: 'Jersey15',
        )
      ),
    );
  }
}