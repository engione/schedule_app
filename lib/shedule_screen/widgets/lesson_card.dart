import 'package:flutter/material.dart';
import 'package:schedule_app/colors.dart';

class LessonCard extends StatelessWidget {
  const LessonCard({
    super.key, 
    required this.lessonNumber, 
    required this.lessonName, 
    required this.cabinet, 
    required this.time,
  });

  final String? lessonNumber;
  final String? lessonName;
  final String? cabinet;
  final String? time;
  

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.17,
      decoration: const BoxDecoration(
        color: clrPink,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow:[ BoxShadow(
          color: Color.fromRGBO(0, 0, 0, .25),
          blurRadius: 6,
          offset: Offset(0, 2)
        )]
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  time!,
                  style: TextStyle(
                    color: Colors.white,  
                    fontWeight: FontWeight.w900,
                    fontSize: screenHeight * 0.03
                  ),
                ),
                Text(
                  cabinet!,
                  style: TextStyle(
                    color: Colors.white, 
                    fontWeight: FontWeight.w900,
                    fontSize: screenHeight * 0.03
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02,),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: screenWidth * 0.07,
                  child: Text(
                    lessonNumber!,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: screenHeight * 0.03
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.1),
                Text(
                  lessonName!,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: screenHeight * 0.03
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}