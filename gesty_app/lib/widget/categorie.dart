import 'package:flutter/material.dart';
import 'package:gesty_app/providers/app_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategorieSection extends ConsumerStatefulWidget {
  final String? title;
  final bool selected;
  final void Function() selectedAction;
  CategorieSection({super.key, this.title, required this.selected, required this.selectedAction});

  @override
  ConsumerState<CategorieSection> createState() => _CategorieSectionState();
}

class _CategorieSectionState extends ConsumerState<CategorieSection> {
  @override
  Widget build(BuildContext context) {
    final colorApp = ref.watch(color_theme);

    return GestureDetector(
      onTap: () {
        widget.selectedAction();
      },
      child: Container(
        padding: .symmetric(horizontal: 10, vertical: 2),
        margin: .symmetric(horizontal: 5,),
        decoration: BoxDecoration(
          color: !widget.selected ? colorApp[2] : colorApp.first,
          borderRadius: BorderRadius.circular(6)
        ),
        child: Text(
          widget.title ?? 'category',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.normal,
            fontFamily: 'Jersey15',
          )
        ),
      ),
    );
  }
}