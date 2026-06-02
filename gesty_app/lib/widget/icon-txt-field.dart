import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class TxtFielWIcon extends StatefulWidget {
  final String label;
  final Function actionSaved;
  final controllerText;
  final Icon? icon;
  const TxtFielWIcon({super.key, required this.label, required this.actionSaved,required this.controllerText, this.icon});

  @override
  State<TxtFielWIcon> createState() => _TxtFielWIconState();
}

class _TxtFielWIconState extends State<TxtFielWIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 70,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Center(
        child: Stack(
          children: [
            TextFormField(
              controller: widget.controllerText,
              onChanged: (value) => widget.actionSaved(value, widget.label),
              
              keyboardType:(widget.label == 'How much ?')
                ?TextInputType.number
                :TextInputType.text,
              
              style: TextStyle(
                color: Colors.white
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "It's empty";
                }
            
                return null;
              },
              onSaved: (newValue) => newValue != '' 
                ? widget.actionSaved(newValue, widget.label)
                : null,
            
              decoration: InputDecoration(
                prefixIcon: widget.icon ?? Icon(HugeIcons.strokeRoundedCoins01, color: Colors.white,),
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

          ],
        ),
      ),
    );
  }
}