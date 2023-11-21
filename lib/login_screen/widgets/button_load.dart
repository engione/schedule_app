import 'package:flutter/material.dart';
import 'package:schedule_app/colors.dart';

class ButtonLoad extends StatelessWidget {

  const ButtonLoad({
    super.key,  
  });

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
        onPressed: (){},
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 15,
            height: 15,
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2.0,
            ),
          ),
        )
      ),
    );
  }
}