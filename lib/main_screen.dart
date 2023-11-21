import 'package:flutter/material.dart';
import 'package:schedule_app/colors.dart';
import 'package:schedule_app/groups_screen/groups_screen.dart';
import 'package:schedule_app/profile_screen/profile_screen.dart';
import 'package:schedule_app/shedule_screen/shedule_screen.dart';




class MainScreen extends StatefulWidget {
  MainScreen({
    super.key,
    required this.idUser,
    required this.name,
    required this.birthDate,
    required this.groupNumber
  });

  final int idUser;
  final String name;
  final String birthDate;
  final String groupNumber;
  
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late final int _idUser = widget.idUser;
  late final String _name = widget.name;
  late final String _group = widget.groupNumber;
  late final String _date = widget.birthDate;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  
  late final List<Widget> _children = [
    SheduleScreen(groupNumber: _group,),
    const GroupsScreen(),
    ProfileScreen(idUser: _idUser, name: _name, groupNumber: _group, birthDate: _date,),
  ];


  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: _children[_selectedIndex],
          bottomNavigationBar: Container(
            padding: const EdgeInsets.only(bottom: 16),
            child: BottomNavigationBar(
              selectedItemColor: clrPink,
              unselectedFontSize: 14.0,
              elevation: 0,
              backgroundColor: Colors.white,
              iconSize: 36,
              currentIndex: _selectedIndex, 
              onTap: _onItemTapped,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Ваша группа'
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.view_agenda_outlined),
                  label: 'Группы'
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outlined),
                  label: 'Профиль'
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
