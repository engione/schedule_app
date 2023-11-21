import 'package:flutter/material.dart';
import 'package:schedule_app/colors.dart';

class MainButton extends StatelessWidget {

  const MainButton({
    super.key,  
    this.pressed,
    required this.txt,
  });

  final String txt;
  final void Function()? pressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow:[ BoxShadow(
          color: Color.fromRGBO(0, 0, 0, .25),
          blurRadius: 2,
          offset: Offset(0, 2)
        )]
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          
          disabledBackgroundColor: Colors.grey,
          disabledForegroundColor: Colors.white,
          backgroundColor: clrPink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        onPressed: pressed,
        child: Text(
          txt,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}