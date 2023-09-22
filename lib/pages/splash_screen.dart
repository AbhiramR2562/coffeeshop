import 'dart:async';

import 'package:cofee_shop/pages/intro_home_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2), // Adjust the duration as needed
      () {
        // Navigate to the main content screen after the splash screen.
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>
                IntroHomePage(), // Replace with your main screen
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          children: [
            // icon
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Image.asset(
                'lib/images/cup (1).png',
                height: 240,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
//opacity: 0.8 for the blur effect