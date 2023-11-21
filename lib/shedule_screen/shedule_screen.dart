import 'package:flutter/material.dart';
import 'package:schedule_app/colors.dart';
import 'package:schedule_app/shedule_screen/widgets/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SheduleScreen extends StatefulWidget {
  const SheduleScreen({
    super.key,
    required this.groupNumber
  });

  final String groupNumber;
  @override
  State<SheduleScreen> createState() => _SheduleScreenState();
}

class _SheduleScreenState extends State<SheduleScreen> with SingleTickerProviderStateMixin {
  late final String group = widget.groupNumber;
  late TabController tabviewController;
  List countLesson = [];
  
  final _future = Supabase.instance.client.from('shedule').select('first_lesson, second_lesson, third_lesson, fourth_lesson, five_lesson').order('day', ascending: true);


  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 5, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            group
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                height: screenHeight * 0.04,
                width: screenWidth * 0.9,
                child: TabBar(
                  unselectedLabelColor: Colors.grey,
                  labelColor: clrPink,
                  indicatorColor: clrPink,
                  controller: tabviewController,
                  tabs: [
                    CustomTab(day: 'Пн'),
                    CustomTab(day: 'Вт'),
                    CustomTab(day: 'Ср'),
                    CustomTab(day: 'Чт'),
                    CustomTab(day: 'Пт')
                  ],
                ),
              ),
              
              SizedBox(
                height: screenHeight * 0.75,
                child: FutureBuilder(
                  future: _future ,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: clrPink,
                        )
                      );
                    }
                    
                    final data = snapshot.data!;
                    int count = 0;
                    List<Map<dynamic, dynamic>> lessons = [];
                    for (var i in data) {
                      Map map = i;
                      lessons.add(i);
                      for (var entry in map.entries) {
                        if (entry.value != null){
                          count += 1;
                        }
                      }
                      countLesson.add(count);
                      count = 0;
                    }
                    return TabBarView(
                      controller: tabviewController,
                      children: [
                        ListCards(cardCount: countLesson[0], lessons: lessons[0]),
                        ListCards(cardCount: countLesson[1], lessons: lessons[1]),
                        ListCards(cardCount: countLesson[2], lessons: lessons[2]),
                        ListCards(cardCount: countLesson[3], lessons: lessons[3]),
                        ListCards(cardCount: countLesson[4], lessons: lessons[4]),
                      ],
                    );
                  }
                )  
              ),
            ],
          ),
        ),   
      ),
    );
  }
}



