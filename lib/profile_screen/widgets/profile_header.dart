import 'package:flutter/material.dart';
import 'package:schedule_app/colors.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.32,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: screenHeight * 0.15,
            decoration: const BoxDecoration(
              color: clrPink, 
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))
            ),
          ),
          Positioned(
            top: screenHeight * 0.025,
            left: screenWidth * 0.2,
            child: Center(
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow:[ BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, .25),
                    blurRadius: 2,
                    offset: Offset(0, 2)
                  )]
                ),
                child: CircleAvatar(
                  radius: screenWidth * 0.3,
                  backgroundColor: const Color.fromARGB(255, 240, 240, 240),
                  child: const Center(
                    child: Icon(
                      Icons.person_outline, 
                      color:Color.fromRGBO(227, 84, 109, 1),
                      size: 136,
                    )
                  ),
                ),
              ),
            )
          )
        ]
      ),
    );
  }
}