import 'package:flutter/material.dart';
import 'package:schedule_app/colors.dart';
import 'package:schedule_app/profile_screen/widgets/widgets.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({
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
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // late final int _idUser = widget.idUser;
  late final String _name = widget.name;
  late final String _date = widget.birthDate;
  late final String _group = widget.groupNumber;

  @override
  Widget build(BuildContext context) {
    
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


        
    
    String dateStr = _date;
    DateTime date = DateTime.parse(dateStr);
    DateFormat formatter = DateFormat('dd.MM.yyyy');
    String dateFormatted = formatter.format(date);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Профиль', 
            style: TextStyle(
              color: Colors.white
            ),
          ),
          backgroundColor: clrPink,
          actions: [
            IconButton(
              onPressed: (){
                Navigator.pushNamed(context, '/');
              }, 
              icon: Icon(Icons.exit_to_app_outlined),
              color: Colors.white,
              iconSize: screenHeight * 0.05,
            )
          ],
        ),
        body: Column(
          children: [
            ProfileHeader(),
            SizedBox(height: 10,),
            GreyField(
              height: screenHeight * 0.07,
              width: screenWidth * 0.85,
              child: Center(
                child: Text( 
                  _name,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
            SizedBox(height: 10,),
            GreyField(
              height: screenHeight * 0.07, 
              width: screenWidth * 0.85, 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cake_outlined,
                    color: Colors.grey,
                    size: screenHeight * 0.03,
                  ),
                  SizedBox(width: 7,),
                  Text(
                    dateFormatted,
                    style: Theme.of(context).textTheme.displayMedium,
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            GreyField(
              height: screenHeight * 0.07, 
              width: screenWidth * 0.85, 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.groups_outlined,
                    color: Colors.grey,
                    size: screenHeight * 0.03,
                  ),
                  SizedBox(width: 7,),
                  Text(
                    _group,
                    style: Theme.of(context).textTheme.displayMedium,
                  )
                ],
              )
            )
          ],
        )
      )
    );   
  }
}
    



