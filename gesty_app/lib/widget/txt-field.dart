import 'package:flutter/material.dart';

class TxtField extends StatefulWidget {
  final String? label;
  const TxtField({super.key, this.label});

  @override
  State<TxtField> createState() => _TxtFieldState();
}

class _TxtFieldState extends State<TxtField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 40,
      margin: EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: widget.label ?? "Label",
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: 11,
            // fontFamily: 'Jersey15',
          ),
          filled: true,
          fillColor: Color(0xFF1E1E1E),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
        ),
        
      ),
    );
  }
}