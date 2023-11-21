import 'package:flutter/material.dart';


class GreyField extends StatelessWidget {
  const GreyField({
    super.key, 
    required this.height, 
    required this.width,
    required this.child
  });


  final double height;
  final double width;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 240, 240, 240),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [BoxShadow(
          color: Color.fromRGBO(0, 0, 0, .25),
          blurRadius: 2,
          offset: Offset(0, 2)
        )]
      ),
      child: child
    );
  }
}