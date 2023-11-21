import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({
    super.key, 
    required this.day, 
  });

  final String day;


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Tab(
      child: Container(
        height: screenHeight * 0.05,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: screenWidth * 0.15,
              height: screenHeight * 0.024,
              child: FittedBox(
                child: Text(
                  day
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}