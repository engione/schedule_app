import 'package:flutter/material.dart';

import 'lesson_card.dart';

class ListCards extends StatelessWidget {
  ListCards({
    super.key, 
    required this.cardCount,
    required this.lessons
  });
  
  final Map lessons;

  final List listLessons = [];

  final List  time = [];
  

  final Map<int, String> cardInfo = {
    1: '1',
    2: 'Lesson name',
    3: 'c101',
    4: '9:00-10:30'
  };
  final int cardCount;

  @override
  Widget build(BuildContext context) {
    for (var element in lessons.entries) {
      if(element.value != null){
        switch(element.key){
          case 'first_lesson':
            time.add('9:00-10:30');
          case 'second_lesson':
            time.add('10:50-12:20');
          case 'third_lesson':
            time.add('12:40-14:10');
          case 'fourth_lesson':
            time.add('14:30-16:00');
          case 'five_lesson':
            time.add('16:20-17:50');
        }
        listLessons.add(element.value);
      }
    }
    return Center(
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: cardCount,
        itemBuilder: (BuildContext context, int index) {
          return LessonCard(
            lessonNumber: (index+1).toString(), 
            lessonName: listLessons[index], 
            cabinet: cardInfo[3], 
            time: time[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          indent: 0, 
          endIndent: 0, 
          color: Colors.white
        ),
      ) 
    );
  }
}

