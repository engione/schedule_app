
import 'package:flutter/material.dart';
import 'package:schedule_app/login_screen/widgets/widgets.dart';
import 'package:schedule_app/main_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isButtonEnabled = false; 
  bool _alert = false;
  int idUser = 0;
  String name = '';
  String date = '';
  String group = '';

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_onTextChanged);
    _passwordController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      _isButtonEnabled = _usernameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  SupabaseClient client = Supabase.instance.client;
  Future<void> authenticateUser() async {
    setState(() {
      _isLoading = true; 
    });
    String login = _usernameController.text;
    String password = _passwordController.text;
    final List response = await client.from('users').select().eq('login', login).eq('password', password);
    bool userAuth = false;
    
    if(response.isNotEmpty){
      userAuth = true;
      final Map map = response[0];
      idUser = map['id'];
      name = map['name'];
      date = map['birth_date'].toString();
      group = map['group_number'];
    }
    else {
      setState(() {
        _alert = true;
      });
    }
    if (userAuth) {
      _submit();
      userAuth = false;
    }
    setState(() {
      _isLoading = false; 
    });


  }

  void _submit()  {
    Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(
              idUser: idUser,  
              name: name, 
              groupNumber: group, 
              birthDate: date,
            )
          )
        );


  }



  @override
  Widget build(BuildContext context) {
    
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    

    return SafeArea(
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Log in',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05,),
                  Container(
                    height: screenHeight * 0.75,
                    width: screenWidth,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24)
                      )
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: screenWidth * 0.8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: screenHeight * 0.03),
                            Field(
                              hintText: 'Логин', 
                              obscureText: false, 
                              controller: _usernameController,
                            ),
                            const SizedBox(height: 20.0),
                            Field(
                              hintText: 'Пароль', 
                              obscureText: true, 
                              controller: _passwordController
                            ),
                            const SizedBox(height: 20.0),
                            SizedBox(
                              width: screenWidth * 0.8,
                              height: screenHeight * 0.065,
                              child: _isLoading ? 
                              ButtonLoad():
                              MainButton(
                                pressed: _isButtonEnabled ? () => authenticateUser() : null,
                                txt: 'Log in', 
                              ),
                            ),
                            SizedBox(height: 10,),
                            SizedBox(
                              child: _alert ? 
                              Text(
                                'Вы ввели неправильный логин или пароль',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: screenHeight * 0.015,
                                )
                              ):
                              null
                            )
                          ],
                        ),
                      )  
                    ),
                  )
                ],
              )
            ),
          ),
        ),
      );
  }
}