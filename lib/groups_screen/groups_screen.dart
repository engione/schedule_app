import 'package:flutter/material.dart';
import 'package:schedule_app/colors.dart';
import 'package:schedule_app/groups_screen/widgets/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class GroupsScreen extends StatefulWidget {
  const GroupsScreen({super.key});

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {

  TextEditingController _searchFieldController = TextEditingController();
  List response = [];
  bool isLoading = false;
  
  Future<void> getData() async {
    if (_searchFieldValue == ''){
      response = await Supabase.instance.client.from('groups').select();
      isLoading = false;
    }
    else {
      response = await Supabase.instance.client.from('groups').select().ilike('group_number', '%$_searchFieldValue%');
      isLoading = false;
    }
  }

  @override
  void dispose() {
    _searchFieldController.dispose();
    super.dispose();
  }

  String _searchFieldValue = '';
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Список групп'),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.02,),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _searchFieldValue = _searchFieldController.text;
                        isLoading = true;
                      });
                      getData();
                    }, 
                    icon: Icon(
                      Icons.search_outlined,
                      size: 32,
                      color: Colors.grey,
                    )
                  ),
                  SearchField(controller: _searchFieldController,),
                  IconButton(
                    splashRadius: 1,
                    onPressed: (){
                      _searchFieldController.clear();
                    },
                    icon: const Icon(
                      Icons.backspace_outlined,
                      size: 28,
                      color: Colors.grey,
                    )
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.015,),
              SizedBox(
                child: isLoading
                ? CircularProgressIndicator(color: clrPink) 
                : response.isNotEmpty 
                  ? GroupListBuilder(searchValue: response,)
                  : null
              )
                  
            ],
          )
        ),
      )
    );
  }
}




