import 'dart:async';

import 'package:cosmeticstest/presentation/pages/IntroScreens/OnBoardingScreen.dart';
import 'package:cosmeticstest/widgets/on_boarding_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => onBoardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // You can add an image or logo to display as the splash screen
    return Scaffold(
      backgroundColor: Colors.white, // Choose your desired background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           /* Image.asset(
              'assets/images/boarding.png', // Replace with your splash screen image asset path
              width: 300,
              height: 300,
            ),*/
            // (Optional) - Add a loading spinner while loading the app
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}

