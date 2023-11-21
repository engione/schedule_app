import 'package:flutter/material.dart';
import 'package:schedule_app/colors.dart';
import 'package:schedule_app/login_screen/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://gbtkqeglmywhwnexvudc.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdidGtxZWdsbXl3aHduZXh2dWRjIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTk0NjE5ODUsImV4cCI6MjAxNTAzNzk4NX0.RpcQSvvz9kLzxPxWWRpyaIjGrew3oaVKuryZmYtA_o8',
    
  );
  runApp(const MyApp());
}
  

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: screenHeight * 0.05
          )
        ),
        textTheme: TextTheme(
          displayMedium: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
            fontSize: screenHeight * 0.025,
          ),
          labelMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: screenHeight * 0.025,
          ) 
        ),
        scaffoldBackgroundColor: clrPink,
      ),
      routes: {
        '/': (context) => const LoginScreen(),
      }
    );
      
  }

}












