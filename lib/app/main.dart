import 'package:cosmeticstest/presentation/pages/OnBoardingScreen.dart';
import 'package:flutter/material.dart';

void main() async{

 WidgetsFlutterBinding.ensureInitialized();
 await Future.delayed(const Duration(seconds: 2));
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontFamily: 'Bahij_TheSansArabic-Plain',  // Default font family
            // Add more text properties here as needed
          ),
        ),

      ),
      home:  onBoardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
