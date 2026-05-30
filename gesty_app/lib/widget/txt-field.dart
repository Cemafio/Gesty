import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class TxtField extends StatefulWidget {
  final String label;
  final Function actionSaved;
  final Function? changeObscureText;
  final bool? obscuredText;
  const TxtField({super.key, required this.label, required this.actionSaved, this.obscuredText, this.changeObscureText});

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
      child: Center(
        child: Stack(
          children: [
            TextFormField(
              keyboardType:(widget.label == 'Email') 
                ? TextInputType.emailAddress
                : TextInputType.text,
            
              obscureText: widget.label == 'Password' && widget.obscuredText == true,
              
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
            if(widget.label == 'Password')
            Positioned(
              top: 5,
              right: 0,
              child: GestureDetector(
                onTap: () => widget.changeObscureText!(),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Icon((widget.obscuredText == true)
                        ? HugeIcons.strokeRoundedViewOff
                        :HugeIcons.strokeRoundedView, 
                      color: Colors.white
                    )
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}