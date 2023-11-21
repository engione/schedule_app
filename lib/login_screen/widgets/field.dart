import 'package:flutter/material.dart';
import 'package:schedule_app/colors.dart';

class Field extends StatelessWidget {
  
  const Field({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
    this.onChanged
  });

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow:[ BoxShadow(
          color: Color.fromRGBO(0, 0, 0, .25),
          blurRadius: 2,
          offset: Offset(0, 2)
        )]
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
                                        
          hintText: hintText,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: clrPink, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(8.0)), 
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(8.0)), 
          ), 
        ),
        obscureText: obscureText,
      ),
    );
  }
}