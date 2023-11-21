import 'package:flutter/material.dart';

import 'package:schedule_app/login_screen/widgets/main_button.dart';


class GroupListBuilder extends StatelessWidget {
  const GroupListBuilder({
    super.key, 
    required this.searchValue, 
    
  });

  final List searchValue;

  @override
  Widget build(BuildContext context) {
    
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.675,
      width: screenWidth * 0.9,
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: searchValue.length,
        itemBuilder: (BuildContext context, int index) {
          final group = searchValue[index];
          return Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                SizedBox(
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.85,
                  child: MainButton(
                    txt: group['group_number'].toString(),
                    pressed: () {
    
                    },
                  ),
                ),
              ] 
            ),
          );
        }
      )
    );
  }
}