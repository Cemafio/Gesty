import 'package:flutter/material.dart';

class TxtField extends StatefulWidget {
  final String label;
  final Function actionSaved;
  const TxtField({super.key, required this.label, required this.actionSaved});

  @override
  State<TxtField> createState() => _TxtFieldState();
}

class _TxtFieldState extends State<TxtField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 70,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextFormField(
        keyboardType:(widget.label == 'Email') 
          ? TextInputType.emailAddress
          : TextInputType.text,

        obscureText: widget.label == 'Password',
        
        style: TextStyle(
          color: Colors.white
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Enter your ${widget.label.toLowerCase()}";
          }

          return null;
        },
        onSaved: (newValue) => newValue != '' 
          ? widget.actionSaved(newValue, widget.label)
          : null,

        decoration: InputDecoration(
          labelText: widget.label,
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