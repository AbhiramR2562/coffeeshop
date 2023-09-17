import 'dart:async';

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
      Duration(seconds: 3), // Adjust the duration as needed
      () {
        // Navigate to the main content screen after the splash screen.
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomePage(), // Replace with your main screen
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('lib/images/coffee-shop.png'),
      ),
    );
  }
}
